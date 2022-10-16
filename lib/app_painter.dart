import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'pixel.dart';

class AppPainter extends CustomPainter {
  final List<Pixel> pixels;

  AppPainter({required this.pixels});

  @override
  void paint(Canvas canvas, Size size) {
    for (final pixel in pixels) {
      canvas.drawPoints(
        PointMode.points,
        [pixel.offset],
        Paint()
          ..color = pixel.color
          ..strokeWidth = 5,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
