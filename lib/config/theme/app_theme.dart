import 'package:flutter/material.dart';

const Color _customColor = Color(0xff5C11E4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.cyan,
  Colors.teal,
  Colors.lime,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  AppTheme(this.selectedColor)
      : assert(
          selectedColor >= 0 && selectedColor < _colorThemes.length,
          'Colors must be between 0 and ${_colorThemes.length - 1}',
        );

  final int selectedColor;

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
