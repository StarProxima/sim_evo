// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Nature {
  int get energy => throw _privateConstructorUsedError;
  set energy(int value) => throw _privateConstructorUsedError;
  bool get isMovementAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NatureCopyWith<Nature> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NatureCopyWith<$Res> {
  factory $NatureCopyWith(Nature value, $Res Function(Nature) then) =
      _$NatureCopyWithImpl<$Res, Nature>;
  @useResult
  $Res call({int energy, bool isMovementAllowed});
}

/// @nodoc
class _$NatureCopyWithImpl<$Res, $Val extends Nature>
    implements $NatureCopyWith<$Res> {
  _$NatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energy = null,
    Object? isMovementAllowed = null,
  }) {
    return _then(_value.copyWith(
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int,
      isMovementAllowed: null == isMovementAllowed
          ? _value.isMovementAllowed
          : isMovementAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NatureCopyWith<$Res> implements $NatureCopyWith<$Res> {
  factory _$$_NatureCopyWith(_$_Nature value, $Res Function(_$_Nature) then) =
      __$$_NatureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int energy, bool isMovementAllowed});
}

/// @nodoc
class __$$_NatureCopyWithImpl<$Res>
    extends _$NatureCopyWithImpl<$Res, _$_Nature>
    implements _$$_NatureCopyWith<$Res> {
  __$$_NatureCopyWithImpl(_$_Nature _value, $Res Function(_$_Nature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energy = null,
    Object? isMovementAllowed = null,
  }) {
    return _then(_$_Nature(
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int,
      isMovementAllowed: null == isMovementAllowed
          ? _value.isMovementAllowed
          : isMovementAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Nature implements _Nature {
  _$_Nature({required this.energy, required this.isMovementAllowed});

  @override
  int energy;
  @override
  final bool isMovementAllowed;

  @override
  String toString() {
    return 'Nature(energy: $energy, isMovementAllowed: $isMovementAllowed)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NatureCopyWith<_$_Nature> get copyWith =>
      __$$_NatureCopyWithImpl<_$_Nature>(this, _$identity);
}

abstract class _Nature implements Nature {
  factory _Nature(
      {required int energy, required final bool isMovementAllowed}) = _$_Nature;

  @override
  int get energy;
  set energy(int value);
  @override
  bool get isMovementAllowed;
  @override
  @JsonKey(ignore: true)
  _$$_NatureCopyWith<_$_Nature> get copyWith =>
      throw _privateConstructorUsedError;
}
