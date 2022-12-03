import 'dart:math';

import '../../data/data_models/agent/agent.dart';
import '../../data/data_models/pos/pos.dart';
import '../../data/models/world_map/world_map.dart';
import '../../features/agent_brain/agent_brain.dart';

class AgentController {
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

    if (agent.energy <= 0) {
      map.agent[pos] = null;
    }

    final forwardPos = pos + agent.direction;

    final posNorm = map.isPosInBounds(forwardPos);

    double nat = 0;

    if (posNorm && map.nature[forwardPos] != null) {
      nat = map.nature[forwardPos]!.energy / 100.0;
    }

    final input = AgentBrainInput(
      energy: agent.energy / 100.0,
      natureEnergy: nat,
    );

    final output = agent.brain.think(input);

    agent.direction = output.direction;

    if (agent.energy > 0) {
      if (_random.nextInt(100) < 1 && agent.energy > 75) {
        final nearPos = randNearPos(map, pos);
        if (map.agent[nearPos] == null) {
          map.agent[nearPos] = Agent(
            id: 0,
            createdAt: DateTime.now(),
            energy: 20,
            direction: agent.direction,
            brain: AgentBrain(),
          );
          agent.energy -= 50;
        }
      }

      final nearPos = randNearPos(map, pos);
      if (map.agent[nearPos] != null) {
        final nearAgent = map.agent[nearPos]!;

        if (nearAgent.energy > 10) {
          agent.energy += 10;
          nearAgent.energy -= 10;
        }
      }

      if (posNorm && output.eat && map.nature[forwardPos] != null) {
        final natE = map.nature[forwardPos]!.energy;
        //final k = pow((natE > 0 ? natE : 0) / 100.0 + 0.02, 1 / 4) - 0.2;
        final k = ((natE > 0 ? natE : 0) / 100) * 0.5 + 0.25;
        final e = (natE * k + 10).toInt();
        if (agent.energy + e <= 100) {
          agent.energy += (e * k).toInt();
          map.nature[forwardPos]!.energy -= e;
        }
      }

      if (posNorm && output.move) {
        if (posNorm && map.agent[forwardPos] == null) {
          map.agent[forwardPos] = agent;
          map.agent[pos] = null;
        }
      }
    } else {
      //final nearPos = randNearPos(map, pos);

      // if (map.nature[nearPos] != null && map.nature[nearPos]!.energy < 20) {
      //   if (agent.energy < 100) {
      //     //agent.energy += 10;
      //     map.nature[nearPos]!.energy -= 10;
      //   }
      // }
    }
  }
}
