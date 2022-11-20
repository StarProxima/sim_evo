import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_models/agent/agent.dart';
import '../../../data/data_models/pos/pos.dart';
import '../../../data/data_models/simulation_settings/simulation_settings.dart';
import '../../../data/data_models/simulation_stats/simulation_stats.dart';
import '../../../data/models/world_map/world_map.dart';
import '../../../state_holders/simulation_settings.dart';
import '../../../state_holders/simulation_stats.dart';
import '../../../state_holders/world_map.dart';
import '../../../state_holders/world_map_visualizer.dart';
import '../../agent_map/manager/agent_map_stepper.dart';
import '../../visualizer/world_map_visualizer.dart';

final worldMapManager = Provider<WorldMapManager>((ref) {
  return WorldMapManager(
    settingsNotifier: ref.watch(simulationSettings.notifier),
    statsNotifier: ref.watch(simulationStats.notifier),
    worldMapNotifier: ref.watch(worldMap.notifier),
    visualizer: ref.watch(worldMapVisualizer),
  );
});

class WorldMapManager {
  SimulationSettingsNotifier settingsNotifier;
  SimulationStatsNotifier statsNotifier;
  WorldMapNotifier worldMapNotifier;
  WorldMapVisualizer visualizer;

  SimulationSettings get settings => settingsNotifier.state;
  SimulationStats get stats => statsNotifier.state;
  WorldMap get worldMap => worldMapNotifier.state;

  AgentStepper agentStepper = AgentStepper();

  WorldMapManager({
    required this.settingsNotifier,
    required this.statsNotifier,
    required this.worldMapNotifier,
    required this.visualizer,
  });

  void initialSpawn() {
    print('initialSpawn');
    final height = worldMap.size.height;
    final width = worldMap.size.width;

    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        if (Random().nextInt(100) < 10) {
          final agent = Agent(id: 0, createdAt: DateTime.now(), energy: 100);
          worldMap.agent[Pos(j, i)] = agent;
        }
      }
    }

    visualizer.visualize(worldMap);
  }

  void takeStep() {
    print('takeStep');
    final map = agentStepper.takeStep(worldMap);

    visualizer.visualize(map);
  }
}
