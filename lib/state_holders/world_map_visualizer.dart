import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'world_map.dart';

import '../features/app_paint/state_holders/app_paint_state_holders.dart';
import '../features/visualizer/world_map_visualizer.dart';
import '../features/visualizer/models/visualization_type.dart';

final worldMapVisualizer = Provider<WorldMapVisualizer>((ref) {
  return WorldMapVisualizer(
    type: VisualizationType.energy,
    imageNotifier: ref.watch(appPaintImage.notifier),
    worldMapNotifier: ref.watch(worldMap.notifier),
  );
});
