import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/simulation_settings/simulation_settings.dart';

final simulationSettings =
    StateNotifierProvider<SimulationSettingsNotifier, SimulationSettings>(
        (ref) {
  return SimulationSettingsNotifier(
    SimulationSettings(
      size: const Size(100, 100),
      stepPerSec: 4,
      framesSkip: 0,
      active: false,
    ),
  );
});

class SimulationSettingsNotifier extends StateNotifier<SimulationSettings> {
  SimulationSettingsNotifier(super.state);

  @override
  SimulationSettings get state => super.state;

  void editSize(Size size) {
    state = state.copyWith(size: size);
  }

  void editSpeed(int stepPerSec) {
    state = state.copyWith(stepPerSec: stepPerSec);
  }

  void editFrameSkip(int framesSkip) {
    state = state.copyWith(framesSkip: framesSkip);
  }

  void toggleActive() {
    state = state.copyWith(active: !state.active);
  }
}
