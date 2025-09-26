
import 'dart:math';

import 'package:clickforcolor/textmanager.dart';

import 'package:flutter/material.dart';

/// Screen for generating random color and displaying text.
class ColorGeneratorScreen extends StatefulWidget {
  /// Creates the color generator screen.
  const ColorGeneratorScreen({super.key});

  @override
  State<ColorGeneratorScreen> createState() => _ColorGeneratorScreenState();
}

/// State of the random color generation screen.
class _ColorGeneratorScreenState extends State<ColorGeneratorScreen> {
  Color _backgroundColor = Colors.white;
  final TextManager _textManager = TextManager();

  /// Generates a random color.
  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  /// Changes the background color.
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _generateRandomColor();
    });
  }

  /// Changes the text.
  void _changeText() {
    setState(() {
      _textManager.changeText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          onPressed: _changeText, // Исправлено: используем метод с setState
          tooltip: 'Change text',
          child: const Icon(Icons.refresh),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeBackgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _textManager.currentText,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: _getTextColor(_backgroundColor),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  /// Determines the text color depending on the background brightness.
  Color _getTextColor(Color backgroundColor) {
    final brightness = backgroundColor.computeLuminance();
    return brightness > 0.5 ? Colors.black : Colors.white;
  }
}
