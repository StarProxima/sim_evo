import 'package:flutter/material.dart';

import '../../agent_controller/agent/agent.dart';
import '../models/agent_visualizer.dart';

class EnergyAgentVisualizer implements AgentVisualizer {
  static const color1 = Colors.yellow;
  static const color2 = Colors.orange;

  @override
  int call(Agent? agent) {
    if (agent == null) return Colors.black.value;
    return Color.lerp(color1, color2, agent.energy / 100)!.value;
  }
}
