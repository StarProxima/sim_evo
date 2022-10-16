import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'image_painter.dart';
import 'pixel.dart';

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
  ui.Image? image;

  Random random = Random();
  late Timer timer;

  Future<ui.Image> getRandomImage() {
    const size = Size(650, 350);
    final completer = Completer<ui.Image>();
    final pixels = Int32List((size.width * size.height).toInt());
    for (var i = 0; i < pixels.length; i++) {
      pixels[i] = random.nextInt(0xFFFFFFFF);
    }
    ui.decodeImageFromPixels(
      pixels.buffer.asUint8List(),
      size.width.toInt(),
      size.height.toInt(),
      ui.PixelFormat.rgba8888,
      completer.complete,
    );
    return completer.future;
  }

  void setPixelsPainterTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (_) async {
        pixels = [
          for (int i = 0; i < 400 * 5; i += 5)
            for (int j = 0; j < 200 * 5; j += 5)
              if (true)
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
  }

  void setImagePainterTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (_) async {
        image = await getRandomImage();
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    setImagePainterTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // painter: PixelsPainter(
      //   pixels: pixels,
      // ),
      painter: ImagePainter(
        image: image,
      ),
    );
  }
}
