import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:ui' as ui;

import '../../data/models/world_map/world_map.dart';
import 'agent_visualizers/energy_agent_visualizer.dart';
import 'models/agent_visualizer.dart';
import 'models/visualization_type.dart';

class WorldMapVisualizer {
  late AgentColorizer _agentColorizer;

  late StateController<ui.Image?> _imageNotifier;

  WorldMapVisualizer({
    required VisualizationType type,
    required StateController<ui.Image?> imageNotifier,
  }) {
    switch (type) {
      case VisualizationType.energy:
        _agentColorizer = EnergyAgentColorizer();
        break;
    }

    _imageNotifier = imageNotifier;
  }

  void visualize(WorldMap agentMap) async {
    final size = agentMap.size;
    final width = size.width.toInt();
    final height = size.height.toInt();
    final length = width * height;

    final pixels = Uint32List(length);

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final agent = agentMap.agent(i, j);
        if (agent != null) {
          pixels[i * width + j] = _agentColorizer.colorize(agent);
        }
      }
    }

    final image = await _imageByUint32List(
      size: size,
      pixels: pixels,
    );

    _imageNotifier.state = image;
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
