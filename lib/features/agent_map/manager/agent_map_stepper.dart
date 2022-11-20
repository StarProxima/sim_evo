import 'dart:math';

import '../../../data/data_models/agent/agent.dart';
import '../../../data/data_models/pos/pos.dart';
import '../../../data/models/world_map/world_map.dart';

class AgentStepper {
  final _random = Random();

  WorldMap takeStep(WorldMap map) {
    for (var i = 0; i < map.size.height; i++) {
      for (var j = 0; j < map.size.width; j++) {
        final pos = Pos(j, i);
        if (map.agent[pos] != null) {
          agentStep(map, pos);
        }
      }
    }
    return map;
  }

  Pos randNearPos(WorldMap map, Pos pos) {
    final x = pos.x + _random.nextInt(3) - 1;
    final y = pos.y + _random.nextInt(3) - 1;
    if (x >= 0 &&
        x < map.size.width &&
        y >= 0 &&
        y < map.size.height &&
        x != 0 &&
        y != 0) {
      return Pos(x, y);
    } else {
      return randNearPos(map, pos);
    }
  }

  void agentStep(WorldMap map, Pos pos) {
    final agent = map.agent[pos]!;

    agent.energy--;

    if (_random.nextInt(100) < 10 && agent.energy > 50) {
      final nearPos = randNearPos(map, pos);
      if (map.agent[nearPos] == null) {
        map.agent[nearPos] =
            Agent(id: 0, createdAt: DateTime.now(), energy: 100);
        agent.energy -= 30;
      }
    }

    if (true) {
      final nearPos = randNearPos(map, pos);
      if (map.agent[nearPos] != null) {
        final nearAgent = map.agent[nearPos]!;

        final e = (agent.energy - nearAgent.energy).abs() ~/ 10;

        agent.energy += e;
        nearAgent.energy -= e;
      }
    }

    if (agent.energy <= 0) {
      map.agent[pos] = null;
    }
  }
}
