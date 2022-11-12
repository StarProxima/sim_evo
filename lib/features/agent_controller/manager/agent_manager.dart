import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_paint/state_holders/app_paint_state_holders.dart';
import '../../visualizer/agent_map_visualizer.dart';
import '../agent/agent.dart';
import '../state_holders/agent_controller_state_holders.dart';

import 'dart:ui' as ui;

final agentManager = Provider<AgentManager>((ref) {
  return AgentManager(
    agentMapNotifier: ref.watch(agentMap.notifier),
    imageNotifier: ref.watch(appPaintImage.notifier),
  );
});

class AgentManager {
  final AgentMapNotifier agentMapNotifier;
  final StateController<ui.Image?> imageNotifier;

  AgentMap get agentMap => agentMapNotifier.state;

  AgentManager({
    required this.agentMapNotifier,
    required this.imageNotifier,
  });

  final _visualizer = AgentMapVisualizer.energy();

  late final Timer? _timer;

  Future<void> start() {
    return Future(() {
      createAgentMap();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        takeStep();
      });
    });
  }

  void createAgentMap() {
    final map = agentMap;
    final size = map.size;
    final width = size.width.toInt();
    final height = size.height.toInt();

    final now = DateTime.now();

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        map[i][j] = Random().nextInt(100) < 10
            ? Agent(
                id: i * width + j,
                energy: 100,
                createdAt: now,
              )
            : null;
      }
    }
    agentMapNotifier.update(map);
  }

  void takeStep() async {
    final map = agentMap;
    for (var i = 0; i < map.size.height; i++) {
      for (var j = 0; j < map.size.width; j++) {
        if (map[i][j] != null) {
          map[i][j]!.energy--;
        }
      }
    }
    agentMapNotifier.update(map);

    imageNotifier.state = await _visualizer.visualize(map);
  }

  void setAgentMap(AgentMap agentMap) {
    agentMapNotifier.update(agentMap);
  }
}
