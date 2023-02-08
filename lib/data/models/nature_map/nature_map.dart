import 'package:flutter/painting.dart';

import '../../data_models/nature/nature.dart';
import '../../data_models/pos/pos.dart';

class NatureMap {
  late List<List<Nature?>> _list;
  final Size _size;

  Size get size => _size;

  NatureMap(this._list, this._size);

  NatureMap.empty(this._size) {
    _list = List.generate(
      _size.height.toInt(),
      growable: false,
      (index) => List.generate(
        _size.width.toInt(),
        (index) => null,
        growable: false,
      ),
    );
  }

  Nature? call(int i, int j) => _list[i][j];

  Nature? operator [](Pos pos) {
    return _list[pos.y][pos.x];
  }

  void operator []=(Pos pos, Nature? nature) {
    _list[pos.y][pos.x] = nature;
  }
}
