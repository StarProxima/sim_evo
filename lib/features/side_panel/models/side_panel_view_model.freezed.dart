// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'side_panel_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SidePanelViewModel {
  TextEditingController get widthController =>
      throw _privateConstructorUsedError;
  TextEditingController get heightController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SidePanelViewModelCopyWith<SidePanelViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidePanelViewModelCopyWith<$Res> {
  factory $SidePanelViewModelCopyWith(
          SidePanelViewModel value, $Res Function(SidePanelViewModel) then) =
      _$SidePanelViewModelCopyWithImpl<$Res, SidePanelViewModel>;
  @useResult
  $Res call(
      {TextEditingController widthController,
      TextEditingController heightController});
}

/// @nodoc
class _$SidePanelViewModelCopyWithImpl<$Res, $Val extends SidePanelViewModel>
    implements $SidePanelViewModelCopyWith<$Res> {
  _$SidePanelViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widthController = null,
    Object? heightController = null,
  }) {
    return _then(_value.copyWith(
      widthController: null == widthController
          ? _value.widthController
          : widthController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      heightController: null == heightController
          ? _value.heightController
          : heightController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SidePanelViewModelCopyWith<$Res>
    implements $SidePanelViewModelCopyWith<$Res> {
  factory _$$_SidePanelViewModelCopyWith(_$_SidePanelViewModel value,
          $Res Function(_$_SidePanelViewModel) then) =
      __$$_SidePanelViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController widthController,
      TextEditingController heightController});
}

/// @nodoc
class __$$_SidePanelViewModelCopyWithImpl<$Res>
    extends _$SidePanelViewModelCopyWithImpl<$Res, _$_SidePanelViewModel>
    implements _$$_SidePanelViewModelCopyWith<$Res> {
  __$$_SidePanelViewModelCopyWithImpl(
      _$_SidePanelViewModel _value, $Res Function(_$_SidePanelViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widthController = null,
    Object? heightController = null,
  }) {
    return _then(_$_SidePanelViewModel(
      widthController: null == widthController
          ? _value.widthController
          : widthController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      heightController: null == heightController
          ? _value.heightController
          : heightController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_SidePanelViewModel implements _SidePanelViewModel {
  _$_SidePanelViewModel(
      {required this.widthController, required this.heightController});

  @override
  final TextEditingController widthController;
  @override
  final TextEditingController heightController;

  @override
  String toString() {
    return 'SidePanelViewModel(widthController: $widthController, heightController: $heightController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SidePanelViewModel &&
            (identical(other.widthController, widthController) ||
                other.widthController == widthController) &&
            (identical(other.heightController, heightController) ||
                other.heightController == heightController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, widthController, heightController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SidePanelViewModelCopyWith<_$_SidePanelViewModel> get copyWith =>
      __$$_SidePanelViewModelCopyWithImpl<_$_SidePanelViewModel>(
          this, _$identity);
}

abstract class _SidePanelViewModel implements SidePanelViewModel {
  factory _SidePanelViewModel(
          {required final TextEditingController widthController,
          required final TextEditingController heightController}) =
      _$_SidePanelViewModel;

  @override
  TextEditingController get widthController;
  @override
  TextEditingController get heightController;
  @override
  @JsonKey(ignore: true)
  _$$_SidePanelViewModelCopyWith<_$_SidePanelViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
