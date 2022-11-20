import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'simulation_settings.freezed.dart';

@freezed
class SimulationSettings with _$SimulationSettings {
  SimulationSettings._();
  factory SimulationSettings({
    required Size size,
    required int stepPerSec,
    required int framesSkip,
    required bool active,
  }) = _SimulationSettings;
}
