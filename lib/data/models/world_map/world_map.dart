import 'package:flutter/animation.dart';

import '../../data_models/pos/pos.dart';
import '../agent_map/agent_map.dart';
import '../nature_map/nature_map.dart';

class WorldMap {
  late AgentMap agent;
  late NatureMap nature;

  final Size _size;

  Size get size => _size;

  WorldMap(this.agent, this.nature, this._size);

  WorldMap.empty(this._size) {
    agent = AgentMap.empty(_size);
    nature = NatureMap.empty(_size);
  }

  bool isPosInBounds(Pos pos) {
    return pos.x >= 0 &&
        pos.x < _size.width &&
        pos.y >= 0 &&
        pos.y < _size.height;
  }
}
