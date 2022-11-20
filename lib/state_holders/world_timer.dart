import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_models/simulation_settings/simulation_settings.dart';

final worldTimer = StateNotifierProvider<WorldTimerNotifier, Timer>((ref) {
  return WorldTimerNotifier(
    Timer(
      Duration.zero,
      () {},
    ),
  );
});

class WorldTimerNotifier extends StateNotifier<Timer> {
  WorldTimerNotifier(super.state);

  @override
  Timer get state => super.state;

  void edit(
    SimulationSettings settings,
    VoidCallback callback,
  ) {
    state.cancel();
    state = Timer.periodic(
      Duration(milliseconds: 1000 ~/ settings.stepPerSec),
      (timer) {
        if (settings.active) callback();
      },
    );
  }
}
