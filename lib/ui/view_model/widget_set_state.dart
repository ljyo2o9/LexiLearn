import 'package:flutter/material.dart';

class WidgetSetState extends ChangeNotifier {
  int _cnt = 1;

  int get cnt => _cnt;

  selectWord() {
    _cnt = 1;
    notifyListeners();
  }

  selectWiki() {
    _cnt = 0;
    notifyListeners();
  }

  onlyZero() {
    if (_cnt == 0) {
      _cnt = 1;
    }

    notifyListeners();
  }
}
