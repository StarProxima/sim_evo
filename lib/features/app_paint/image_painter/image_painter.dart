import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImagePainter extends CustomPainter {
  final ui.Image image;
  final double scale;

  ImagePainter({
    required this.image,
    this.scale = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.grey.shade900, BlendMode.color);
    canvas.scale(scale);
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
