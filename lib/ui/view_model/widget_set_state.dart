import 'package:flutter/material.dart';

class WidgetSetState extends ChangeNotifier {
  int _cnt = 0;

  int get cnt => _cnt;

  toggle() {
    if (_cnt == 0) {
      _cnt = 1;
    } else if (_cnt == 1) {
      _cnt = 0;
    }

    notifyListeners();
  }

  onlyZero() {
    if (_cnt == 1) {
      _cnt = 0;
    }

    notifyListeners();
  }
}
