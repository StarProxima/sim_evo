import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perceptron/perceptron.dart';
import 'features/app_paint/app_paint.dart';
import 'features/side_panel/view/side_panel.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InteractiveViewer(
              maxScale: 50,
              minScale: 0.1,
              constrained: true,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: AppPaint(),
              ),
            ),
          ),
          const SidePanel(),
        ],
      ),
    );
  }
}
