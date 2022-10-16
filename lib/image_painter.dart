import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImagePainter extends CustomPainter {
  final ui.Image? image;

  ImagePainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.grey.shade900, BlendMode.color);
    if (image != null) {
      canvas.scale(3);
      canvas.drawImage(image!, Offset.zero, Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
