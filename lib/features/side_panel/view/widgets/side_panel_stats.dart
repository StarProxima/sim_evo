import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../state_holders/simulation_stats.dart';

class SidePanelStats extends ConsumerWidget {
  const SidePanelStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(simulationStats);
    final startTime = stats.startTime != null
        ? DateFormat('dd.MM.yyyy HH:mm:ss').format(stats.startTime!)
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start Time: ${startTime ?? ''}',
          maxLines: 1,
        ),
        Text(
          'Step Count: ${stats.stepCount}',
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        Text(
          'Agent Count: ${stats.agentCount}',
          maxLines: 1,
        ),
        Text(
          'Nature Count: ${stats.natureCount}',
          maxLines: 1,
        ),
        Text(
          'Total Count: ${stats.totalCount}',
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        Text(
          'Agent Energy: ${stats.agentEnergy}',
          maxLines: 1,
        ),
        Text(
          'Nature Energy: ${stats.natureEnergy}',
          maxLines: 1,
        ),
        Text(
          'Total Energy: ${stats.totalEnergy}',
          maxLines: 1,
        ),
      ],
    );
  }
}
