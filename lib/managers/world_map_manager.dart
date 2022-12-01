import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/agent/agent.dart';
import '../data/data_models/nature/nature.dart';
import '../data/data_models/pos/pos.dart';
import '../data/data_models/simulation_settings/simulation_settings.dart';
import '../data/data_models/simulation_stats/simulation_stats.dart';
import '../data/models/world_map/world_map.dart';
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

  void initialSpawn() {
    final height = worldMap.size.height;
    final width = worldMap.size.width;

    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        if (Random().nextInt(500) < 1) {
          final agent = Agent(id: 0, createdAt: DateTime.now(), energy: 500);
          worldMap.agent[Pos(j, i)] = agent;
        }

        if (Random().nextInt(1000) < 1) {
          //final agent = Agent(id: 0, createdAt: DateTime.now(), energy: 100);
          worldMap.nature[Pos(j, i)] = Nature(energy: 30);
        }
      }
    }

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
