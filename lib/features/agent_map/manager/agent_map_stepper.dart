import 'dart:math';

import '../../../data/data_models/agent/agent.dart';
import '../../../data/models/agent_map/agent_map.dart';

class AgentMapStepper {
  final _random = Random();

  late AgentMap map;

  AgentMap takeStep(AgentMap agentMap) {
    map = agentMap;
    for (var i = 0; i < map.size.height; i++) {
      for (var j = 0; j < map.size.width; j++) {
        final pos = Pos(j, i);
        if (map[pos] != null) {
          agentStep(pos);
        }
      }
    }
    return map;
  }

  Pos randNearPos(Pos pos) {
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
      return randNearPos(pos);
    }
  }

  void agentStep(Pos pos) {
    final agent = map[pos]!;

    agent.energy--;

    if (_random.nextInt(100) < 10 && agent.energy > 50) {
      final nearPos = randNearPos(pos);
      if (map[nearPos] == null) {
        map[nearPos] = Agent(id: 0, createdAt: DateTime.now(), energy: 100);
        agent.energy -= 30;
      }
    }

    if (true) {
      final nearPos = randNearPos(pos);
      if (map[nearPos] != null) {
        final nearAgent = map[nearPos]!;

        final e = (agent.energy - nearAgent.energy).abs() ~/ 10;

        agent.energy += e;
        nearAgent.energy -= e;
      }
    }

    if (agent.energy <= 0) {
      map[pos] = null;
    }
  }
}

class Pos {
  final int x;
  final int y;

  Pos(this.x, this.y);
}
