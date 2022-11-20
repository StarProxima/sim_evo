import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../simulation_manager/manager/simulation_manager.dart';

final sidePanelManager = Provider<SidePanelManager>((ref) {
  return SidePanelManager(
    simulationManager: ref.watch(simulationManager),
  );
});

class SidePanelManager {
  final SimulationManager simulationManager;

  SidePanelManager({
    required this.simulationManager,
  });

  void toggleActive() {
    simulationManager.toggleActive();
  }

  void initialSpawn() {
    simulationManager.initialSpawn();
  }
}
