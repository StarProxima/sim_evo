import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/simulation_settings/simulation_settings.dart';

final visualizationTimer =
    StateNotifierProvider<VisualizationTimerNotifier, Timer>((ref) {
  return VisualizationTimerNotifier(
    Timer(
      Duration.zero,
      () {},
    ),
  );
});

class VisualizationTimerNotifier extends StateNotifier<Timer> {
  VisualizationTimerNotifier(super.state);

  @override
  Timer get state => super.state;

  void edit(
    SimulationSettings settings,
    VoidCallback callback,
  ) {
    state.cancel();
    if (settings.framePerSec > 0) {
      state = Timer.periodic(
        Duration(
          milliseconds: 1000 ~/ settings.framePerSec,
        ),
        (timer) {
          if (settings.active) callback();
        },
      );
    }
  }
}
