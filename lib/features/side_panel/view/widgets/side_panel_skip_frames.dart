import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../state_holders/simulation_settings.dart';
import '../../manager/side_panel_manager.dart';

class SidePanelSkipFrames extends ConsumerWidget {
  const SidePanelSkipFrames({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(sidePanelManager);

    final speed =
        ref.watch(simulationSettings.select((value) => value.stepPerSec));

    final fps =
        ref.watch(simulationSettings.select((value) => value.framePerSec));

    return Column(
      children: [
        Text('Target FPS: $fps'),
        const SizedBox(height: 4),
        Slider.adaptive(
          value: fps.toDouble(),
          min: 0,
          max: 60,
          onChanged: (value) => manager.editFrameSkip(value.toInt()),
        ),
      ],
    );
  }
}
