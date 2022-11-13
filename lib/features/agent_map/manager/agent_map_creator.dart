import 'dart:math';

import 'package:flutter/rendering.dart';

import '../../../data/data_models/agent/agent.dart';
import '../../../data/models/agent_map/agent_map.dart';
import 'agent_map_stepper.dart';

class AgentMapCreator {
  final _random = Random();

  AgentMap create(Size size) {
    final map = AgentMap.empty(size);
    final width = size.width.toInt();
    final height = size.height.toInt();

    final now = DateTime.now();

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        map[Pos(j, i)] = _random.nextInt(100) < 5
            ? Agent(
                id: i * width + j,
                energy: _random.nextInt(100),
                createdAt: now,
              )
            : null;
      }
    }

    return map;
  }
}
