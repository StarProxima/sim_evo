import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/agent_brain/agent_brain.dart';
import '../direction/direction.dart';
import '../pos/pos.dart';

part 'agent.freezed.dart';

@unfreezed
class Agent with _$Agent {
  factory Agent({
    required final int id,
    required final DateTime createdAt,
    required int energy,
    required Pos direction,
    required AgentBrain brain,
  }) = _Agent;
}
