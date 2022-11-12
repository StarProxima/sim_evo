import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui' as ui;

final appPaintImage = StateProvider<ui.Image?>((ref) {
  return null;
});

final appPaintSize = StateProvider<Size>((ref) {
  return const Size(600, 350);
});
