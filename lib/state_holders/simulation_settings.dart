import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/simulation_settings/simulation_settings.dart';

final simulationSettings =
    StateNotifierProvider<SimulationSettingsNotifier, SimulationSettings>(
        (ref) {
  return SimulationSettingsNotifier(
    SimulationSettings(
      size: const Size(300, 300),
      stepPerSec: 4,
      framePerSec: 60,
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

  void editFps(int fps) {
    state = state.copyWith(framePerSec: fps);
  }

  void toggleActive() {
    state = state.copyWith(active: !state.active);
  }
}
