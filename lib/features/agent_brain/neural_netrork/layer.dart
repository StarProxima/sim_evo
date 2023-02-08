class Layer {
  late int size;

  late List<double> neurons;
  late List<List<double>> weights;

  late bool bias;

  Layer(int size, int nextSize, [bool bias = false]) {
    if (bias) {
      this.size = size + 1;
      neurons = List.generate(size, (index) => 0);
      weights = List.generate(
        size + 1,
        (index) => List.generate(nextSize, (index) => 0),
      );
    } else {
      this.size = size;
      neurons = List.generate(size, (index) => 0);
      weights =
          List.generate(size, (index) => List.generate(nextSize, (index) => 0));
    }
  }
}
