import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'pixel.dart';

import 'app_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pixel> pixels = [];

  Random random = Random();
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) {
        pixels = [
          for (int i = 0; i < 400 * 5; i += 5)
            for (int j = 0; j < 200 * 5; j += 5)
              Pixel(
                offset: Offset(
                  i.toDouble(),
                  j.toDouble(),
                ),
                color: Color.fromARGB(
                  255,
                  random.nextInt(255),
                  random.nextInt(255),
                  random.nextInt(255),
                ),
              ),
        ];
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AppPainter(
        pixels: pixels,
      ),
    );
  }
}
