import 'package:flutter/material.dart';

enum ThemeModeType { light, dark }

class ThemeProvider with ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.light;

  ThemeModeType get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    notifyListeners();
  }

  ThemeData getTheme() {
    return _themeMode == ThemeModeType.light ? lightTheme : darkTheme;
  }

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // Outras propriedades do tema claro
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Outras propriedades do tema escuro
  );
}
