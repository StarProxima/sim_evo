import 'package:flutter/painting.dart';

import '../../data_models/agent/agent.dart';
import '../../data_models/pos/pos.dart';

class AgentMap {
  late List<List<Agent?>> _list;
  final Size _size;

  Size get size => _size;

  AgentMap(this._list, this._size);

  AgentMap.empty(this._size) {
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

  Agent? call(int i, int j) => _list[i][j];

  Agent? operator [](Pos pos) {
    return _list[pos.y][pos.x];
  }

  void operator []=(Pos pos, Agent? agent) {
    _list[pos.y][pos.x] = agent;
  }
}
