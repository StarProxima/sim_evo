import 'package:flutter/painting.dart';

import '../../../features/agent_map/manager/agent_map_stepper.dart';
import '../../data_models/agent/agent.dart';

class AgentMap {
  late List<List<Agent?>> _list;
  final Size _size;

  Size get size => _size;

  AgentMap(this._list, this._size);

  AgentMap.empty(this._size) {
    _list = List.generate(
      _size.height.toInt(),
      (index) => List.generate(
        _size.width.toInt(),
        (index) => null,
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
