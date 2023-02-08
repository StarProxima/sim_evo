import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../state_holders/simulation_settings.dart';
import '../../../../state_holders/simulation_stats.dart';
import '../../manager/side_panel_manager.dart';

class SidePanelSpeed extends ConsumerStatefulWidget {
  const SidePanelSpeed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SidePanelSpeedState();
}

class _SidePanelSpeedState extends ConsumerState<SidePanelSpeed> {
  int lastStepCount = 0;

  int currentSpeed = 0;

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(sidePanelManager);
    final speed =
        ref.watch(simulationSettings.select((value) => value.stepPerSec));
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final stepCount =
          ref.read(simulationStats.select((value) => value.stepCount));
      setState(() {
        currentSpeed = stepCount - lastStepCount;
      });

      lastStepCount = stepCount;
    });

    return Column(
      children: [
        Text('Speed: $currentSpeed'),
        const SizedBox(height: 4),
        Text('Target speed: $speed'),
        const SizedBox(height: 4),
        Slider.adaptive(
          value: speed.toDouble(),
          min: 1,
          max: 1000,
          onChanged: (value) => manager.editSpeed(
            value.toInt(),
          ),
        ),
      ],
    );
  }
}
