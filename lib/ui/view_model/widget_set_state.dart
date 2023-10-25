import 'package:flutter/material.dart';

class WidgetSetState extends ChangeNotifier {
  int _cnt = 0;
  int _cnt2 = 0;

  int get cnt => _cnt;

  int get cnt2 => _cnt2;

  toggle() {
    if (_cnt == 0) {
      _cnt = 1;
    } else if (_cnt == 1) {
      _cnt = 0;
    }

    notifyListeners();
  }

  toggle2() {
    if (_cnt2 == 0) {
      _cnt2 = 1;
    } else if (_cnt2 == 1) {
      _cnt2 = 0;
    }

    notifyListeners();
  }

  onlyZero() {
    if (_cnt == 1) {
      _cnt = 0;
    }

    notifyListeners();
  }

  onlyZero2() {
    if (_cnt2 == 1) {
      _cnt2 = 0;
    }

    notifyListeners();
  }
}
