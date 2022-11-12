import 'dart:collection';
import 'dart:ui';

import '../agent/agent.dart';

class AgentMap extends ListBase<List<Agent?>> {
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

  @override
  set length(int newLength) => _list.length = newLength;
  @override
  int get length => _list.length;

  @override
  List<Agent?> operator [](int index) {
    return _list[index];
  }

  @override
  void operator []=(int index, List<Agent?> value) {
    _list[index] = value;
  }
}
