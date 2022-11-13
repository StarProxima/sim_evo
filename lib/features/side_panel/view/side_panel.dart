import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../manager/side_panel_manager.dart';

class SidePanel extends ConsumerWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(sidePanelManager);
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
        children: [
          const Text('Side Panel'),
          ElevatedButton(
            onPressed: manager.start,
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
