import 'package:flutter/material.dart';
import 'router.dart';

class LoomApp extends StatelessWidget {
  const LoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Loom',
      routerConfig: router,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
    );
  }
}
