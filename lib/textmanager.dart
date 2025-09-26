/// Class for text management
class TextManager {
  int _textIndex = 0;

  final List<String> _texts = [
    'Hello there',
    'I hope that all fine',
    'Goodbye',
    'Have a nice day!',
  ];

  /// Current text
  String get currentText => _texts[_textIndex];

  /// Switches text to the next one
  void changeText() {
    _textIndex = (_textIndex + 1) % _texts.length;
  }

  /// Number of available texts
  int get textCount => _texts.length;
}
