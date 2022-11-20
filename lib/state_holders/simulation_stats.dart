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

  void edit(SimulationStats stats) {
    state = stats.copyWith(
      totalCount: stats.agentCount + stats.natureCount,
      totalEnergy: stats.agentEnergy + stats.natureEnergy,
    );
  }

  void reset() {
    state = SimulationStats.empty();
  }
}
