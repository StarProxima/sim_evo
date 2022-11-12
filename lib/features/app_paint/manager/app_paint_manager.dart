import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui' as ui;

import '../state_holders/app_paint_state_holders.dart';

final appPaintManager = Provider<AppPaintManager>((ref) {
  return AppPaintManager(
    imageNotifier: ref.watch(appPaintImage.notifier),
    sizeNotifier: ref.watch(appPaintSize.notifier),
  );
});

class AppPaintManager {
  final StateController<ui.Image?> imageNotifier;
  final StateController<Size> sizeNotifier;

  ui.Image? get image => imageNotifier.state;
  Size get size => sizeNotifier.state;

  AppPaintManager({
    required this.imageNotifier,
    required this.sizeNotifier,
  });

  void setImage(ui.Image? image) {
    imageNotifier.state = image;
  }

  void setSize(Size size) {
    sizeNotifier.state = size;
  }
}
