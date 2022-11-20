import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/simulation_stats/simulation_stats.dart';

final simulationStats =
    StateNotifierProvider<SimulationStatsNotifier, SimulationStats>((ref) {
  return SimulationStatsNotifier(
    SimulationStats.empty(),
  );
});

class SimulationStatsNotifier extends StateNotifier<SimulationStats> {
  SimulationStatsNotifier(super.state);

  @override
  SimulationStats get state => super.state;

  void editStartTime(DateTime startTime) {
    state = state.copyWith(startTime: startTime);
  }

  void editStepCount(int stepCount) {
    state = state.copyWith(stepCount: stepCount);
  }

  void editAgentCount(int agentCount) {
    state = state.copyWith(agentCount: agentCount);
  }

  void editNatureCount(int natureCount) {
    state = state.copyWith(natureCount: natureCount);
  }

  void editTotalEnergy(double totalEnergy) {
    state = state.copyWith(totalEnergy: totalEnergy);
  }

  void reset() {
    state = SimulationStats.empty();
  }
}
