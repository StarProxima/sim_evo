import 'dart:math';

import '../../data/data_models/nature/nature.dart';
import '../../data/data_models/pos/pos.dart';
import '../../data/models/world_map/world_map.dart';

class NatureController {
  final _random = Random();

  WorldMap takeStep(WorldMap map) {
    // for (var i = 0; i < map.size.height; i++) {
    //   for (var j = 0; j < map.size.width; j++) {
    //     final pos = Pos(j, i);
    //     if (map.nature[pos] != null) {
    //       natureStep(map, pos);
    //     }
    //   }
    // }
    final width = map.size.width.toInt();
    final height = map.size.height.toInt();

    final count = 0.005 * width * height;

    for (int i = 0; i < count; i++) {
      final pos = Pos(
        _random.nextInt(width),
        _random.nextInt(height),
      );
      if (map.nature[pos] != null) {
        natureStep(map, pos);
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

  void natureStep(WorldMap map, Pos pos) {
    final nature = map.nature[pos]!;

    // if (_random.nextInt(100) < 1) {
    final nearPos = randNearPos(map, pos);
    if (map.nature[nearPos] == null) {
      map.nature[nearPos] = Nature(energy: 5);
    } else {
      final e = (nature.energy * 0.1).toInt();
      final otherNature = map.nature[nearPos]!;
      if (otherNature.energy + e < 100) {
        map.nature[nearPos]!.energy += e;
      }
    }
    // }

    // if (_random.nextInt(100) < 5) {
    if (nature.energy < 100) {
      nature.energy += _random.nextInt(5) + 2;
    }
    //}

    if (nature.energy <= 0) {
      map.nature[pos] = null;
    }
  }
}
