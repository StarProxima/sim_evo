import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/side_panel_skip_frames.dart';
import 'widgets/side_panel_speed.dart';
import '../../../state_holders/simulation_settings.dart';
import '../state_holders/side_panel_view_model.dart';
import 'widgets/side_panel_stats.dart';

import '../manager/side_panel_manager.dart';

class SidePanel extends ConsumerWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(sidePanelManager);
    final settings = ref.watch(simulationSettings);
    final viewModel = ref.watch(sidePanelViewModel);
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          vertical: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('Project SimEvo')),
          const SizedBox(height: 16),
          const SidePanelStats(),
          const SizedBox(height: 16),
          const SidePanelSpeed(),
          const SizedBox(height: 16),
          const SidePanelSkipFrames(),
          const SizedBox(height: 16),
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextField(
          //         controller: viewModel.widthController,
          //         decoration: const InputDecoration(
          //           hintText: 'Width',
          //         ),
          //         keyboardType: TextInputType.number,
          //       ),
          //     ),
          //     const SizedBox(width: 8),
          //     Expanded(
          //       child: TextField(
          //         controller: viewModel.heightController,
          //         decoration: const InputDecoration(
          //           hintText: 'Height',
          //         ),
          //         keyboardType: TextInputType.number,
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 8),
          // ElevatedButton(
          //   onPressed: manager.editSize,
          //   child: const Text('Edit Size'),
          // ),
          //const SizedBox(height: 8),
          ElevatedButton(
            onPressed: manager.initialSpawn,
            child: const Text('initialSpawn'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: manager.toggleActive,
            child: Text(settings.active ? 'Pause' : 'Start'),
          ),
        ],
      ),
    );
  }
}
