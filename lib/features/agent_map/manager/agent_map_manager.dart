import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/agent_map/agent_map.dart';
import '../../app_paint/state_holders/app_paint_state_holders.dart';
import '../../visualizer/agent_map_visualizer.dart';

import '../state_holders/agent_controller_state_holders.dart';

import 'dart:ui' as ui;

import 'agent_map_creator.dart';
import 'agent_map_stepper.dart';

final agentMapManager = Provider<AgentMapManager>((ref) {
  return AgentMapManager(
    agentMapNotifier: ref.watch(agentMap.notifier),
    visualizerNotifier: ref.watch(agentMapVisualizer.notifier),
    imageNotifier: ref.watch(appPaintImage.notifier),
  );
});

class AgentMapManager {
  final AgentMapNotifier agentMapNotifier;
  final AgentMapVisualizerNotifier visualizerNotifier;
  final StateController<ui.Image?> imageNotifier;

  AgentMap get agentMap => agentMapNotifier.state;
  AgentMapVisualizer get visualizer => visualizerNotifier.state;
  ui.Image? get image => imageNotifier.state;

  late final AgentMapCreator _creator;
  late final AgentMapStepper _stepper;

  AgentMapManager({
    required this.agentMapNotifier,
    required this.visualizerNotifier,
    required this.imageNotifier,
  }) {
    _creator = AgentMapCreator();
    _stepper = AgentMapStepper();
  }

  Timer? _timer;

  void initAgentMap() {
    agentMapNotifier.state = _creator.create(agentMap.size);
  }

  void start() {
    if (_timer == null) {
      initAgentMap();
    }
    if (_timer?.isActive == true) {
      _timer!.cancel();
    } else {
      _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        takeStep();
      });
    }
  }

  void takeStep() async {
    final newMap = _stepper.takeStep(agentMap);

    agentMapNotifier.state = newMap;

    imageNotifier.state = await visualizer.visualize(newMap);
  }
}
