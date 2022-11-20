import 'package:freezed_annotation/freezed_annotation.dart';

part 'simulation_stats.freezed.dart';

@freezed
class SimulationStats with _$SimulationStats {
  SimulationStats._();

  factory SimulationStats({
    required DateTime startTime,
    required int stepCount,
    required int agentCount,
    required int natureCount,
    required double totalEnergy,
  }) = _SimulationStats;

  factory SimulationStats.empty() => SimulationStats(
        startTime: DateTime.now(),
        stepCount: 0,
        agentCount: 0,
        natureCount: 0,
        totalEnergy: 0,
      );
}
