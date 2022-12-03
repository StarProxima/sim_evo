import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/agent/agent.dart';
import '../data/data_models/nature/nature.dart';
import '../data/data_models/pos/pos.dart';
import '../data/data_models/simulation_settings/simulation_settings.dart';
import '../data/data_models/simulation_stats/simulation_stats.dart';
import '../data/models/world_map/world_map.dart';
import '../features/agent_brain/agent_brain.dart';
import '../state_holders/simulation_settings.dart';
import '../state_holders/simulation_stats.dart';
import '../state_holders/world_map.dart';
import 'controllers/agent_controller.dart';
import 'controllers/nature_controller.dart';

final worldMapManager = Provider<WorldMapManager>((ref) {
  return WorldMapManager(
    settingsNotifier: ref.watch(simulationSettings.notifier),
    statsNotifier: ref.watch(simulationStats.notifier),
    worldMapNotifier: ref.watch(worldMap.notifier),
  );
});

class WorldMapManager {
  SimulationSettingsNotifier settingsNotifier;
  SimulationStatsNotifier statsNotifier;
  WorldMapNotifier worldMapNotifier;

  SimulationSettings get settings => settingsNotifier.state;
  SimulationStats get stats => statsNotifier.state;
  WorldMap get worldMap => worldMapNotifier.state;

  AgentController agentController = AgentController();
  NatureController natureController = NatureController();

  WorldMapManager({
    required this.settingsNotifier,
    required this.statsNotifier,
    required this.worldMapNotifier,
  });

  void spawnAgent() {
    final height = worldMap.size.height.toInt();
    final width = worldMap.size.width.toInt();

    final size = height * width;

    for (int i = 0; i < 0.001 * size; i++) {
      final pos = Pos(Random().nextInt(width), Random().nextInt(height));
      if (worldMap.agent[pos] == null) {
        worldMap.agent[pos] = Agent(
          id: 0,
          createdAt: DateTime.now(),
          energy: Random().nextInt(100),
          direction: Pos(0, 0),
          brain: AgentBrain(),
        );
      }
    }
  }

  void spawnNature() {
    final height = worldMap.size.height.toInt();
    final width = worldMap.size.width.toInt();

    final size = height * width;

    for (int i = 0; i < 0.005 * size; i++) {
      final pos = Pos(Random().nextInt(width), Random().nextInt(height));
      worldMap.nature[pos] = Nature(energy: 30);
    }
  }

  void initialSpawn() {
    spawnAgent();
    spawnNature();

    statsNotifier.edit(
      stats.copyWith(
        startTime: DateTime.now(),
      ),
    );
  }

  void countStats() {
    int agentCount = 0;
    int agentEnergy = 0;

    int natureCount = 0;
    int natureEnergy = 0;

    for (int i = 0; i < worldMap.size.height; i++) {
      for (int j = 0; j < worldMap.size.width; j++) {
        if (worldMap.agent(i, j) != null) {
          agentCount++;
          agentEnergy += worldMap.agent(i, j)!.energy;
        } else if (worldMap.nature(i, j) != null) {
          natureCount++;
          natureEnergy += worldMap.nature(i, j)!.energy;
        }
      }
    }

    if (agentCount < 50) {
      spawnAgent();
    }

    statsNotifier.edit(
      stats.copyWith(
        stepCount: stats.stepCount + 1,
        agentCount: agentCount,
        agentEnergy: agentEnergy,
        natureCount: natureCount,
        natureEnergy: natureEnergy,
      ),
    );
  }

  void takeStep() {
    natureController.takeStep(worldMap);
    agentController.takeStep(worldMap);

    countStats();
  }
}
