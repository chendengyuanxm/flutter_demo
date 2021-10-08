import 'package:flutter/material.dart';
import 'package:flutter_demo/common/index.dart';

class ThemeProvider extends ChangeNotifier {
  MaterialColor _primaryColor = ColorConfig.primaryColor;
  MaterialColor get primaryColor => _primaryColor;
  set primaryColor(MaterialColor color) {
    _primaryColor = color;
    notifyListeners();
  }

  MaterialColor _accentColor = ColorConfig.accentColor;
  MaterialColor get accentColor => _accentColor;
  set accentColor(MaterialColor color) {
    _accentColor = color;
    notifyListeners();
  }

  setPrimaryColor(MaterialColor color) {
    this._primaryColor = color;
    notifyListeners();
  }
}