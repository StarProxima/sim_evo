// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'simulation_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SimulationStats {
  DateTime get startTime => throw _privateConstructorUsedError;
  int get stepCount => throw _privateConstructorUsedError;
  int get agentCount => throw _privateConstructorUsedError;
  int get natureCount => throw _privateConstructorUsedError;
  double get totalEnergy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimulationStatsCopyWith<SimulationStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimulationStatsCopyWith<$Res> {
  factory $SimulationStatsCopyWith(
          SimulationStats value, $Res Function(SimulationStats) then) =
      _$SimulationStatsCopyWithImpl<$Res, SimulationStats>;
  @useResult
  $Res call(
      {DateTime startTime,
      int stepCount,
      int agentCount,
      int natureCount,
      double totalEnergy});
}

/// @nodoc
class _$SimulationStatsCopyWithImpl<$Res, $Val extends SimulationStats>
    implements $SimulationStatsCopyWith<$Res> {
  _$SimulationStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? stepCount = null,
    Object? agentCount = null,
    Object? natureCount = null,
    Object? totalEnergy = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int,
      agentCount: null == agentCount
          ? _value.agentCount
          : agentCount // ignore: cast_nullable_to_non_nullable
              as int,
      natureCount: null == natureCount
          ? _value.natureCount
          : natureCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalEnergy: null == totalEnergy
          ? _value.totalEnergy
          : totalEnergy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimulationStatsCopyWith<$Res>
    implements $SimulationStatsCopyWith<$Res> {
  factory _$$_SimulationStatsCopyWith(
          _$_SimulationStats value, $Res Function(_$_SimulationStats) then) =
      __$$_SimulationStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      int stepCount,
      int agentCount,
      int natureCount,
      double totalEnergy});
}

/// @nodoc
class __$$_SimulationStatsCopyWithImpl<$Res>
    extends _$SimulationStatsCopyWithImpl<$Res, _$_SimulationStats>
    implements _$$_SimulationStatsCopyWith<$Res> {
  __$$_SimulationStatsCopyWithImpl(
      _$_SimulationStats _value, $Res Function(_$_SimulationStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? stepCount = null,
    Object? agentCount = null,
    Object? natureCount = null,
    Object? totalEnergy = null,
  }) {
    return _then(_$_SimulationStats(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int,
      agentCount: null == agentCount
          ? _value.agentCount
          : agentCount // ignore: cast_nullable_to_non_nullable
              as int,
      natureCount: null == natureCount
          ? _value.natureCount
          : natureCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalEnergy: null == totalEnergy
          ? _value.totalEnergy
          : totalEnergy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_SimulationStats extends _SimulationStats {
  _$_SimulationStats(
      {required this.startTime,
      required this.stepCount,
      required this.agentCount,
      required this.natureCount,
      required this.totalEnergy})
      : super._();

  @override
  final DateTime startTime;
  @override
  final int stepCount;
  @override
  final int agentCount;
  @override
  final int natureCount;
  @override
  final double totalEnergy;

  @override
  String toString() {
    return 'SimulationStats(startTime: $startTime, stepCount: $stepCount, agentCount: $agentCount, natureCount: $natureCount, totalEnergy: $totalEnergy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimulationStats &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.stepCount, stepCount) ||
                other.stepCount == stepCount) &&
            (identical(other.agentCount, agentCount) ||
                other.agentCount == agentCount) &&
            (identical(other.natureCount, natureCount) ||
                other.natureCount == natureCount) &&
            (identical(other.totalEnergy, totalEnergy) ||
                other.totalEnergy == totalEnergy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, startTime, stepCount, agentCount, natureCount, totalEnergy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimulationStatsCopyWith<_$_SimulationStats> get copyWith =>
      __$$_SimulationStatsCopyWithImpl<_$_SimulationStats>(this, _$identity);
}

abstract class _SimulationStats extends SimulationStats {
  factory _SimulationStats(
      {required final DateTime startTime,
      required final int stepCount,
      required final int agentCount,
      required final int natureCount,
      required final double totalEnergy}) = _$_SimulationStats;
  _SimulationStats._() : super._();

  @override
  DateTime get startTime;
  @override
  int get stepCount;
  @override
  int get agentCount;
  @override
  int get natureCount;
  @override
  double get totalEnergy;
  @override
  @JsonKey(ignore: true)
  _$$_SimulationStatsCopyWith<_$_SimulationStats> get copyWith =>
      throw _privateConstructorUsedError;
}
