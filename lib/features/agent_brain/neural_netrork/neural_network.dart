import 'dart:math';

import 'layer.dart';

class NeuralNetwork {
  late List<Layer> layers = [];
  late int biasCount;

  final _random = Random();

  NeuralNetwork(this.biasCount, List<int> sizes) {
    for (int i = 0; i < sizes.length; i++) {
      int nextSize = 0;
      int isBiasLayer = 0;
      if (i < sizes.length - 1) {
        nextSize = sizes[i + 1];
      }

      if (i < biasCount) {
        layers.add(Layer(sizes[i], nextSize, true));
        isBiasLayer = 1;
      } else {
        layers.add(Layer(sizes[i], nextSize));
      }

      for (int j = 0; j < sizes[i] + isBiasLayer; j++) {
        for (int k = 0; k < nextSize; k++) {
          layers[i].weights[j][k] = _random.nextDouble() * 2 - 1;
        }
      }
    }
  }

  NeuralNetwork.clone(
    NeuralNetwork neural, [
    double mutationWeights = 0,
    double mutationNeurons = 0,
  ]) {
    final List<int> sizes = [];
    for (int i = 0; i < neural.layers.length; i++) {
      sizes.add(neural.layers[i].size);
    }

    double rand = _random.nextDouble();

    int randNeuron;
    if (rand > mutationWeights) {
      mutationWeights = 0;
    }

    biasCount = neural.biasCount;
    for (int i = 0; i < neural.layers.length; i++) {
      randNeuron = 0;
      int nextSize = 0;
      int isBiasLayer = 0;

      if (i < neural.layers.length - 1) {
        if (i + 1 < biasCount) {
          nextSize = sizes[i + 1] - 1;
        } else {
          nextSize = sizes[i + 1];
        }
      }

      if (i < neural.biasCount) {
        isBiasLayer = 1;
        layers.add(Layer(sizes[i] - 1, nextSize, true));
      } else {
        layers.add(Layer(sizes[i], nextSize, false));
      }

      for (int j = 0; j < sizes[i] - 1 + isBiasLayer; j++) {
        for (int k = 0; k < nextSize; k++) {
          if (randNeuron != 1 && j < sizes[i] - 1 + isBiasLayer - 1) {
            layers[i].weights[j][k] = neural.layers[i].weights[j][k];
          } else {
            layers[i].weights[j][k] = (_random.nextInt(200) - 100) / 100.0;
          }

          rand = _random.nextDouble();

          if (rand < 1 * mutationWeights) {
            layers[i].weights[j][k] += (_random.nextDouble() - 0.5) * 0.5;
          }

          if (rand < 0.2 * mutationWeights) {
            layers[i].weights[j][k] += (_random.nextDouble() - 0.5) * 2;
          }
        }
      }
    }
  }

  List<double> feedForward(List<double> inputs) {
    for (int i = 0; i < inputs.length; i++) {
      layers[0].neurons[i] = inputs[i];
    }
    if (biasCount > 0) {
      layers[0].neurons[inputs.length] = 0.1;
    }

    for (int i = 1; i < layers.length; i++) {
      int isBiasLayer = 0;
      if (i < biasCount) {
        isBiasLayer = 1;
      }

      for (int j = 0; j < layers[i].size; j++) {
        if (j < layers[i].size - isBiasLayer) {
          layers[i].neurons[j] = 0;
          for (int k = 0; k < layers[i - 1].size; k++) {
            layers[i].neurons[j] +=
                layers[i - 1].neurons[k] * layers[i - 1].weights[k][j];
          }
          layers[i].neurons[j] = min(1, max(-1, layers[i].neurons[j]));
        } else {
          layers[i].neurons[j] = 0.1;
        }
      }
    }
    return layers[layers.length - 1].neurons;
  }
}
