import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'side_panel_view_model.freezed.dart';

@freezed
class SidePanelViewModel with _$SidePanelViewModel {
  factory SidePanelViewModel({
    required TextEditingController widthController,
    required TextEditingController heightController,
  }) = _SidePanelViewModel;
}
