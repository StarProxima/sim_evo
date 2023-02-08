import 'package:flutter/material.dart';

import '../../../data/data_models/agent/agent.dart';
import '../../../data/data_models/nature/nature.dart';
import '../models/colorizer.dart';

class EnergyColorizer implements Colorizer {
  static const _agentColor1 = Colors.yellow;
  static const _agentColor2 = Colors.orange;

  static final _natureColor1 = Colors.green.shade50;
  static final _natureColor2 = Colors.green.shade400;

  @override
  int agent(Agent agent) {
    final color = Color.lerp(_agentColor1, _agentColor2, agent.energy / 100)!;
    return color.value;
  }

  @override
  int nature(Nature nature) {
    final color =
        Color.lerp(_natureColor1, _natureColor2, nature.energy / 100)!;
    return color.value;
  }
}
