// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Agent {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get energy => throw _privateConstructorUsedError;
  set energy(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AgentCopyWith<Agent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentCopyWith<$Res> {
  factory $AgentCopyWith(Agent value, $Res Function(Agent) then) =
      _$AgentCopyWithImpl<$Res, Agent>;
  @useResult
  $Res call({int id, DateTime createdAt, int energy});
}

/// @nodoc
class _$AgentCopyWithImpl<$Res, $Val extends Agent>
    implements $AgentCopyWith<$Res> {
  _$AgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? energy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AgentCopyWith<$Res> implements $AgentCopyWith<$Res> {
  factory _$$_AgentCopyWith(_$_Agent value, $Res Function(_$_Agent) then) =
      __$$_AgentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime createdAt, int energy});
}

/// @nodoc
class __$$_AgentCopyWithImpl<$Res> extends _$AgentCopyWithImpl<$Res, _$_Agent>
    implements _$$_AgentCopyWith<$Res> {
  __$$_AgentCopyWithImpl(_$_Agent _value, $Res Function(_$_Agent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? energy = null,
  }) {
    return _then(_$_Agent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Agent implements _Agent {
  _$_Agent({required this.id, required this.createdAt, required this.energy});

  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  int energy;

  @override
  String toString() {
    return 'Agent(id: $id, createdAt: $createdAt, energy: $energy)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AgentCopyWith<_$_Agent> get copyWith =>
      __$$_AgentCopyWithImpl<_$_Agent>(this, _$identity);
}

abstract class _Agent implements Agent {
  factory _Agent(
      {required final int id,
      required final DateTime createdAt,
      required int energy}) = _$_Agent;

  @override
  int get id;
  @override
  DateTime get createdAt;
  @override
  int get energy;
  set energy(int value);
  @override
  @JsonKey(ignore: true)
  _$$_AgentCopyWith<_$_Agent> get copyWith =>
      throw _privateConstructorUsedError;
}
