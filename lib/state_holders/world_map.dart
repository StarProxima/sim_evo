import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/world_map/world_map.dart';
import 'simulation_settings.dart';

final worldMap = StateNotifierProvider<WorldMapNotifier, WorldMap>((ref) {
  final size = ref.watch(simulationSettings.select((value) => value.size));
  return WorldMapNotifier(
    WorldMap.empty(size),
  );
});

class WorldMapNotifier extends StateNotifier<WorldMap> {
  WorldMapNotifier(super.state);

  @override
  set state(WorldMap value) {
    super.state = value;
  }

  @override
  WorldMap get state => super.state;

  @override
  bool updateShouldNotify(old, current) {
    return true;
  }
}
