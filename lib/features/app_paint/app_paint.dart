import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'image_painter/image_painter.dart';

import 'state_holders/app_paint_state_holders.dart';

class AppPaint extends ConsumerWidget {
  const AppPaint({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(appPaintImage);
    final size = ref.watch(appPaintSize);
    return CustomPaint(
      painter: image != null ? ImagePainter(image: image) : null,
      size: size,
    );
  }
}
