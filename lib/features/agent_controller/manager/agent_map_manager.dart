import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/agent_map/agent_map.dart';
import '../../app_paint/state_holders/app_paint_state_holders.dart';
import '../../visualizer/agent_map_visualizer.dart';
import '../../../models/agent/agent.dart';
import '../state_holders/agent_controller_state_holders.dart';

import 'dart:ui' as ui;

final agentMapManager = Provider<AgentMapManager>((ref) {
  return AgentMapManager(
    agentMapNotifier: ref.watch(agentMap.notifier),
    visualizerNotifier: ref.watch(agentMapVisualizer.notifier),
    imageNotifier: ref.watch(appPaintImage.notifier),
  );
});

class AgentMapManager {
  final AgentMapNotifier agentMapNotifier;
  final AgentMapVisualizerNotifier visualizerNotifier;
  final StateController<ui.Image?> imageNotifier;

  AgentMap get agentMap => agentMapNotifier.state;
  AgentMapVisualizer get visualizer => visualizerNotifier.state;
  ui.Image? get image => imageNotifier.state;

  AgentMapManager({
    required this.agentMapNotifier,
    required this.visualizerNotifier,
    required this.imageNotifier,
  });

  Timer? _timer;

  void initAgentMap() {
    createAgentMap();
  }

  void start() {
    if (_timer == null) {
      initAgentMap();
    }
    if (_timer?.isActive == true) {
      _timer!.cancel();
    } else {
      _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        takeStep();
      });
    }
  }

  final _random = Random();

  void createAgentMap() {
    final map = agentMap;
    final size = map.size;
    final width = size.width.toInt();
    final height = size.height.toInt();

    final now = DateTime.now();

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        map[i][j] = Random().nextInt(100) < 5
            ? Agent(
                id: i * width + j,
                energy: _random.nextInt(100),
                createdAt: now,
              )
            : null;
      }
    }
    agentMapNotifier.state = map;
  }

  void takeStep() async {
    final map = agentMap;
    for (var i = 0; i < map.size.height; i++) {
      for (var j = 0; j < map.size.width; j++) {
        if (map[i][j] != null) {
          map[i][j]!.energy--;

          if (_random.nextInt(100) < 10 && map[i][j]!.energy > 75) {
            final x = j + _random.nextInt(3) - 1;
            final y = i + _random.nextInt(3) - 1;
            if (x >= 0 && x < map.size.width && y >= 0 && y < map.size.height) {
              if (map[y][x] == null) {
                map[y][x] = Agent(id: 0, createdAt: DateTime.now(), energy: 90);
                map[i][j]!.energy -= 25;
              }
            }
          }

          if (_random.nextInt(100) < 20) {
            final x = j + _random.nextInt(3) - 1;
            final y = i + _random.nextInt(3) - 1;
            if (x >= 0 && x < map.size.width && y >= 0 && y < map.size.height) {
              if (map[y][x] == null) {
                map[y][x] = map[i][j];
                map[i][j] = null;
                continue;
              } else if (map[y][x]!.energy < map[i][j]!.energy) {
                final e = map[i][j]!.energy - map[y][x]!.energy;
                if (e < 20) {
                  map[i][j]!.energy -= e;
                  map[y][x]!.energy += e;
                } else {
                  map[i][j]!.energy += map[y][x]!.energy;
                  map[y][x] = map[i][j];
                }

                continue;
              }
            }
          }

          if (_random.nextInt(100) < 11) {
            map[i][j]!.energy += 10;
          }

          if (map[i][j]!.energy <= 0) {
            map[i][j] = null;
          }
        }
      }
    }

    agentMapNotifier.state = map;

    imageNotifier.state = await visualizer.visualize(map);
  }
}
