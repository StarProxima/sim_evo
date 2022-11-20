import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:ui' as ui;

import '../../state_holders/world_map.dart';
import 'agent_visualizers/energy_agent_visualizer.dart';
import 'models/agent_visualizer.dart';
import 'models/visualization_type.dart';

class WorldMapVisualizer {
  late AgentColorizer _agentColorizer;

  final StateController<ui.Image?> imageNotifier;

  final WorldMapNotifier worldMapNotifier;

  WorldMapVisualizer({
    required VisualizationType type,
    required this.imageNotifier,
    required this.worldMapNotifier,
  }) {
    switch (type) {
      case VisualizationType.energy:
        _agentColorizer = EnergyAgentColorizer();
        break;
    }
  }

  void visualize() async {
    final map = worldMapNotifier.state;
    final size = map.size;
    final width = size.width.toInt();
    final height = size.height.toInt();
    final length = width * height;

    final pixels = Uint32List(length);

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final agent = map.agent(i, j);
        if (agent != null) {
          pixels[i * width + j] = _agentColorizer.colorize(agent);
        }
      }
    }

    final image = await _imageByUint32List(
      size: size,
      pixels: pixels,
    );

    imageNotifier.state = image;
  }

  Future<ui.Image> _imageByUint32List({
    required Size size,
    required Uint32List pixels,
  }) async {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      pixels.buffer.asUint8List(),
      size.width.toInt(),
      size.height.toInt(),
      ui.PixelFormat.bgra8888,
      completer.complete,
    );
    return completer.future;
  }
}
