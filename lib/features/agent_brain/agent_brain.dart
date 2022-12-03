import '../../data/data_models/pos/pos.dart';
import 'neural_netrork/neural_network.dart';

class AgentBrain {
  final _perceptron = NeuralNetwork(0, [2, 4, 5]);

  AgentBrainOutput think(AgentBrainInput input) {
    return AgentBrainOutput.fromList(_perceptron.feedForward(input.toList()));
  }
}

class AgentBrainInput {
  final double energy;
  final double natureEnergy;

  AgentBrainInput({
    required this.energy,
    required this.natureEnergy,
  });

  List<double> toList() => [energy, natureEnergy];
}

class AgentBrainOutput {
  final bool move;
  final Pos direction;
  final bool eat;
  final bool reproduce;

  AgentBrainOutput({
    required this.move,
    required this.direction,
    required this.eat,
    required this.reproduce,
  });

  factory AgentBrainOutput.fromList(List<double> list) {
    return AgentBrainOutput(
      move: list[0] > 0,
      direction: Pos(
        list[1] > 0 ? 1 : -1,
        list[2] > 0 ? 1 : -1,
      ),
      eat: list[2] > 0,
      reproduce: list[3] > 0,
    );
  }
}
