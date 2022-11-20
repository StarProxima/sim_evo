import 'dart:async';

import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/data_models/simulation_settings/simulation_settings.dart';
import '../../../state_holders/simulation_settings.dart';
import '../../../state_holders/world_timer.dart';
import '../../world_map/manager/world_map_manager.dart';

final simulationManager = Provider<SimulationManager>((ref) {
  return SimulationManager(
    settingsNotifier: ref.watch(simulationSettings.notifier),
    worldMapManager: ref.watch(worldMapManager),
    timerNotifier: ref.watch(worldTimer.notifier),
  );
});

class SimulationManager {
  final SimulationSettingsNotifier settingsNotifier;
  final WorldMapManager worldMapManager;
  final WorldTimerNotifier timerNotifier;

  SimulationSettings get settings => settingsNotifier.state;
  Timer get timer => timerNotifier.state;

  SimulationManager({
    required this.settingsNotifier,
    required this.worldMapManager,
    required this.timerNotifier,
  }) {
    settingsNotifier.addListener(
      (state) {
        Future(() {
          timerNotifier.edit(state, worldMapManager.takeStep);
        });
      },
    );
  }

  void editSize(Size size) {
    settingsNotifier.editSize(size);
  }

  void editSpeed(int framePerSec) {
    settingsNotifier.editSpeed(framePerSec);
  }

  void editFrameSkip(int framesSkip) {
    settingsNotifier.editFrameSkip(framesSkip);
  }

  void initialSpawn() {
    worldMapManager.initialSpawn();
  }

  void toggleActive() {
    settingsNotifier.toggleActive();
  }
}
