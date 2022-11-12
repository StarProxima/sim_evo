import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';

@unfreezed
class Agent with _$Agent {
  factory Agent({
    required final int id,
    required final DateTime createdAt,
    required int energy,
  }) = _Agent;
}
