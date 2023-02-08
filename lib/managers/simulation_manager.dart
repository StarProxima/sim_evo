import 'dart:async';

import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data_models/simulation_settings/simulation_settings.dart';
import '../state_holders/simulation_settings.dart';
import '../state_holders/visualization_timer.dart';
import '../state_holders/world_map_visualizer.dart';
import '../state_holders/world_timer.dart';
import '../features/visualizer/world_map_visualizer.dart';
import 'world_map_manager.dart';

final simulationManager = Provider<SimulationManager>((ref) {
  return SimulationManager(
    settingsNotifier: ref.watch(simulationSettings.notifier),
    worldMapManager: ref.watch(worldMapManager),
    timerNotifier: ref.watch(worldTimer.notifier),
    visualizationTimerNotifier: ref.watch(visualizationTimer.notifier),
    visualizer: ref.watch(worldMapVisualizer),
  );
});

class SimulationManager {
  final SimulationSettingsNotifier settingsNotifier;
  final WorldMapManager worldMapManager;
  final WorldTimerNotifier timerNotifier;
  final VisualizationTimerNotifier visualizationTimerNotifier;
  final WorldMapVisualizer visualizer;

  SimulationSettings get settings => settingsNotifier.state;
  Timer get timer => timerNotifier.state;
  Timer get visualizationTimer => visualizationTimerNotifier.state;

  SimulationManager({
    required this.settingsNotifier,
    required this.worldMapManager,
    required this.timerNotifier,
    required this.visualizationTimerNotifier,
    required this.visualizer,
  }) {
    settingsNotifier.addListener(
      (state) {
        Future(() {
          timerNotifier.edit(state, worldMapManager.takeStep);
          visualizationTimerNotifier.edit(state, visualizer.visualize);
        });
      },
    );
  }

  void editSize(Size size) {
    settingsNotifier.editSize(size);
    if (settings.active && settings.size != size) {
      settingsNotifier.toggleActive();
    }
  }

  void editSpeed(int framePerSec) {
    settingsNotifier.editSpeed(framePerSec);
  }

  void editFps(int framesSkip) {
    settingsNotifier.editFps(framesSkip);
  }

  void initialSpawn() {
    worldMapManager.initialSpawn();
  }

  void toggleActive() {
    settingsNotifier.toggleActive();
  }
}
