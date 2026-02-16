import 'package:flutter/material.dart';
import 'package:w4_practice/1_color_app/color_app.dart';

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _tapCountMap = {};

  void increment(CardType cardType) {
    _tapCountMap[cardType] = (_tapCountMap[cardType] ?? 0) + 1;
    notifyListeners();
  }

  int getTapCount(CardType type) {
    return _tapCountMap[type] ?? 0;
  }
}
