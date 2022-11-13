import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../agent_controller/manager/agent_map_manager.dart';

final sidePanelManager = Provider<SidePanelManager>((ref) {
  return SidePanelManager(
    agentMapManager: ref.watch(agentMapManager),
  );
});

class SidePanelManager {
  final AgentMapManager agentMapManager;

  SidePanelManager({
    required this.agentMapManager,
  });

  void start() {
    agentMapManager.start();
  }
}
