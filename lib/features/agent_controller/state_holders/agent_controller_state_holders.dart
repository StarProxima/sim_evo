import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/agent_map/agent_map.dart';
import '../../app_paint/state_holders/app_paint_state_holders.dart';

final agentMap = StateNotifierProvider<AgentMapNotifier, AgentMap>((ref) {
  final size = ref.watch(appPaintSize);
  return AgentMapNotifier(AgentMap.empty(size));
});

class AgentMapNotifier extends StateNotifier<AgentMap> {
  AgentMapNotifier(super.state);

  @override
  set state(AgentMap value) {
    super.state = value;
  }

  @override
  AgentMap get state => super.state;

  @override
  bool updateShouldNotify(old, current) {
    return true;
  }
}
