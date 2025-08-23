import 'package:flutter/material.dart';

class GameplayProvider extends ChangeNotifier {
  late int _currentLevel;
  int get currentLevel => _currentLevel;

  late int _maxLevel;

  void init({required int maxLevel}) {
    _currentLevel = 1;
    _maxLevel = maxLevel;
    notifyListeners();
  }

  void nextLevel() {
    _currentLevel++;
    notifyListeners();
  }

  bool isGameplayFinished() {
    return _currentLevel == _maxLevel;
  }
}
