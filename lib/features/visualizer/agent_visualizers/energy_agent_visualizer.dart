import 'package:flutter/material.dart';

import '../../../data/data_models/agent/agent.dart';
import '../models/agent_visualizer.dart';

class EnergyAgentColorizer implements AgentColorizer {
  static const color1 = Colors.yellow;
  static const color2 = Colors.orange;

  @override
  int colorize(Agent agent) {
    return Color.lerp(color1, color2, agent.energy / 100)!.value;
  }
}
