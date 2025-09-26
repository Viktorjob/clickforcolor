import 'package:clickforcolor/color_generator_screen.dart';
import 'package:flutter/material.dart';

/// The main widget of the application.
class MyApp extends StatelessWidget {
  /// Creates the main application widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ColorGeneratorScreen(),
    );
  }
}

/// The entry point of the application.
void main() {
  runApp(const MyApp());
}
