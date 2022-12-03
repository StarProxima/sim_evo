import '../../data/data_models/pos/pos.dart';
import 'neural_netrork/neural_network.dart';

class AgentBrain {
  late final NeuralNetwork _network;

  AgentBrain([NeuralNetwork? network])
      : _network = network ?? NeuralNetwork(0, [4, 2, 3]);

  AgentBrainOutput think(AgentBrainInput input) {
    return AgentBrainOutput.fromList(_network.feedForward(input.toList()));
  }

  AgentBrain clone() {
    return AgentBrain(NeuralNetwork.clone(_network, 0.01, 0.001));
  }
}

class AgentBrainInput {
  final double energy;
  final double natureEnergy;
  final Pos direction;
  final double mostFoodX;
  final double mostFoodY;

  AgentBrainInput({
    required this.energy,
    required this.natureEnergy,
    required this.direction,
    required this.mostFoodX,
    required this.mostFoodY,
  });

  List<double> toList() => [
        direction.x.toDouble(),
        direction.y.toDouble(),
        mostFoodX,
        mostFoodY,
      ];
}

class AgentBrainOutput {
  final bool move;
  final Pos direction;
  // final bool eat;
  // final bool reproduce;

  AgentBrainOutput({
    required this.move,
    required this.direction,
    // required this.eat,
    // required this.reproduce,
  });

  factory AgentBrainOutput.fromList(List<double> list) {
    return AgentBrainOutput(
      direction: Pos(
        list[0] > 0 ? 1 : -1,
        list[1] > 0 ? 1 : -1,
      ),
      move: list[2] > 0.5,
      // eat: list[3] > 0,
      // reproduce: list[4] > 0,
    );
  }
}
