import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import '../agent_controller/state_holders/agent_controller_state_holders.dart';
import 'agent_visualizers/energy_agent_visualizer.dart';
import 'models/agent_visualizer.dart';
import 'models/visualization_type.dart';

class AgentMapVisualizer {
  late AgentVisualizer _agentVisualizer;

  AgentMapVisualizer(VisualizationType type) {
    switch (type) {
      case VisualizationType.energy:
        _agentVisualizer = EnergyAgentVisualizer();
        break;
      default:
    }
  }

  factory AgentMapVisualizer.energy() {
    return AgentMapVisualizer(VisualizationType.energy);
  }

  Future<ui.Image> visualize(AgentMap agentMap) async {
    final size = agentMap.size;
    final width = size.width.toInt();
    final height = size.height.toInt();
    final length = width * height;

    final pixels = Uint32List(length);

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final agent = agentMap[i][j];
        if (agent != null) {
          pixels[i * width + j] = _agentVisualizer(agent);
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
