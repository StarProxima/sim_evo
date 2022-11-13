import 'dart:ui';

import 'package:flutter/material.dart';
import 'pixel.dart';

class PixelsPainter extends CustomPainter {
  final List<Pixel> pixels;

  PixelsPainter({required this.pixels});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.grey.shade900, BlendMode.color);

    for (final pixel in pixels) {
      canvas.drawPoints(
        PointMode.points,
        [pixel.offset],
        Paint()
          ..color = pixel.color
          ..strokeWidth = 4.5
          ..style = PaintingStyle.stroke,
      );
    }

    //  canvas.drawPoints(
    //   PointMode.points,
    //   [for (final pixel in pixels) pixel.offset],
    //   Paint()
    //     ..color = pixels.first.color
    //     ..strokeWidth = 5,
    // );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
