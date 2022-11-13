import 'package:freezed_annotation/freezed_annotation.dart';

part 'nature.freezed.dart';

@unfreezed
class Nature with _$Nature {
  factory Nature({
    required int energy,
    required final bool isMovementAllowed,
  }) = _Nature;
}
