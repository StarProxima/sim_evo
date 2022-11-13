import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:ui' as ui;

import '../../data/models/agent_map/agent_map.dart';
import 'agent_visualizers/energy_agent_visualizer.dart';
import 'models/agent_visualizer.dart';
import 'models/visualization_type.dart';

final agentMapVisualizer =
    StateNotifierProvider<AgentMapVisualizerNotifier, AgentMapVisualizer>(
        (ref) {
  return AgentMapVisualizerNotifier();
});

class AgentMapVisualizerNotifier extends StateNotifier<AgentMapVisualizer> {
  AgentMapVisualizerNotifier()
      : super(AgentMapVisualizer(VisualizationType.energy));

  @override
  AgentMapVisualizer get state => super.state;
}

class AgentMapVisualizer {
  late AgentColorizer _agentColorizer;

  AgentMapVisualizer(VisualizationType type) {
    switch (type) {
      case VisualizationType.energy:
        _agentColorizer = EnergyAgentColorizer();
        break;
      default:
    }
  }

  Future<ui.Image> visualize(AgentMap agentMap) async {
    final size = agentMap.size;
    final width = size.width.toInt();
    final height = size.height.toInt();
    final length = width * height;

    final pixels = Uint32List(length);

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final agent = agentMap(i, j);
        if (agent != null) {
          pixels[i * width + j] = _agentColorizer.colorize(agent);
        }
      }
    }

    final image = await _imageByUint32List(
      size: size,
      pixels: pixels,
    );

    return image;
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
