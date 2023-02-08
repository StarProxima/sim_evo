import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/side_panel_view_model.dart';

final sidePanelViewModel =
    StateNotifierProvider<SidePanelViewModelNotifier, SidePanelViewModel>(
        (ref) {
  return SidePanelViewModelNotifier(
    SidePanelViewModel(
      widthController: TextEditingController(),
      heightController: TextEditingController(),
    ),
  );
});

class SidePanelViewModelNotifier extends StateNotifier<SidePanelViewModel> {
  SidePanelViewModelNotifier(super.state);

  void edit(Size size) {
    state = state.copyWith(
      widthController:
          TextEditingController(text: size.width.toInt().toString()),
      heightController:
          TextEditingController(text: size.height.toInt().toString()),
    );
  }
}
