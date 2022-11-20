// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'simulation_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SimulationSettings {
  Size get size => throw _privateConstructorUsedError;
  int get stepPerSec => throw _privateConstructorUsedError;
  int get framePerSec => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimulationSettingsCopyWith<SimulationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimulationSettingsCopyWith<$Res> {
  factory $SimulationSettingsCopyWith(
          SimulationSettings value, $Res Function(SimulationSettings) then) =
      _$SimulationSettingsCopyWithImpl<$Res, SimulationSettings>;
  @useResult
  $Res call({Size size, int stepPerSec, int framePerSec, bool active});
}

/// @nodoc
class _$SimulationSettingsCopyWithImpl<$Res, $Val extends SimulationSettings>
    implements $SimulationSettingsCopyWith<$Res> {
  _$SimulationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? stepPerSec = null,
    Object? framePerSec = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      stepPerSec: null == stepPerSec
          ? _value.stepPerSec
          : stepPerSec // ignore: cast_nullable_to_non_nullable
              as int,
      framePerSec: null == framePerSec
          ? _value.framePerSec
          : framePerSec // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimulationSettingsCopyWith<$Res>
    implements $SimulationSettingsCopyWith<$Res> {
  factory _$$_SimulationSettingsCopyWith(_$_SimulationSettings value,
          $Res Function(_$_SimulationSettings) then) =
      __$$_SimulationSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Size size, int stepPerSec, int framePerSec, bool active});
}

/// @nodoc
class __$$_SimulationSettingsCopyWithImpl<$Res>
    extends _$SimulationSettingsCopyWithImpl<$Res, _$_SimulationSettings>
    implements _$$_SimulationSettingsCopyWith<$Res> {
  __$$_SimulationSettingsCopyWithImpl(
      _$_SimulationSettings _value, $Res Function(_$_SimulationSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? stepPerSec = null,
    Object? framePerSec = null,
    Object? active = null,
  }) {
    return _then(_$_SimulationSettings(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      stepPerSec: null == stepPerSec
          ? _value.stepPerSec
          : stepPerSec // ignore: cast_nullable_to_non_nullable
              as int,
      framePerSec: null == framePerSec
          ? _value.framePerSec
          : framePerSec // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SimulationSettings extends _SimulationSettings {
  _$_SimulationSettings(
      {required this.size,
      required this.stepPerSec,
      required this.framePerSec,
      required this.active})
      : super._();

  @override
  final Size size;
  @override
  final int stepPerSec;
  @override
  final int framePerSec;
  @override
  final bool active;

  @override
  String toString() {
    return 'SimulationSettings(size: $size, stepPerSec: $stepPerSec, framePerSec: $framePerSec, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimulationSettings &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.stepPerSec, stepPerSec) ||
                other.stepPerSec == stepPerSec) &&
            (identical(other.framePerSec, framePerSec) ||
                other.framePerSec == framePerSec) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, size, stepPerSec, framePerSec, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimulationSettingsCopyWith<_$_SimulationSettings> get copyWith =>
      __$$_SimulationSettingsCopyWithImpl<_$_SimulationSettings>(
          this, _$identity);
}

abstract class _SimulationSettings extends SimulationSettings {
  factory _SimulationSettings(
      {required final Size size,
      required final int stepPerSec,
      required final int framePerSec,
      required final bool active}) = _$_SimulationSettings;
  _SimulationSettings._() : super._();

  @override
  Size get size;
  @override
  int get stepPerSec;
  @override
  int get framePerSec;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_SimulationSettingsCopyWith<_$_SimulationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
