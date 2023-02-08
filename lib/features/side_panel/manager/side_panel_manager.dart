import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../managers/simulation_manager.dart';
import '../models/side_panel_view_model.dart';
import '../state_holders/side_panel_view_model.dart';

final sidePanelManager = Provider<SidePanelManager>((ref) {
  return SidePanelManager(
    simulationManager: ref.watch(simulationManager),
    sideBarViewModelNotifier: ref.watch(sidePanelViewModel.notifier),
  );
});

class SidePanelManager {
  final SimulationManager simulationManager;

  final SidePanelViewModelNotifier sideBarViewModelNotifier;

  SidePanelViewModel get sideBarViewModel => sideBarViewModelNotifier.state;

  SidePanelManager({
    required this.simulationManager,
    required this.sideBarViewModelNotifier,
  });

  void toggleActive() {
    simulationManager.toggleActive();
  }

  void initialSpawn() {
    simulationManager.initialSpawn();
  }

  void editSize() {
    final width = int.tryParse(sideBarViewModel.widthController.text);
    final height = int.tryParse(sideBarViewModel.heightController.text);

    if (width != null && height != null) {
      simulationManager.editSize(
        Size(
          width.toDouble(),
          height.toDouble(),
        ),
      );
    }
    sideBarViewModelNotifier.edit(simulationManager.settings.size);
  }

  void editSpeed(int framePerSec) {
    simulationManager.editSpeed(framePerSec);
  }

  void editFrameSkip(int framesSkip) {
    simulationManager.editFps(framesSkip);
  }
}
