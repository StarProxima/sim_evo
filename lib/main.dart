import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proxima_logger/proxima_logger.dart';
import 'features/app_paint/app_paint.dart';
import 'features/side_panel/view/side_panel.dart';
import 'logger.dart';

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
    logger.log(
      Log.info,
      title: 'HomePage',
    );
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
