import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:flutter/material.dart';

class GameSceneProvider extends ChangeNotifier {
  final List<GameFrame> _frames = List.empty(growable: true);

  int _currentFrameIndex = 0;
  int get currentFrameIndex => _currentFrameIndex;

  GameFrame get currentFrame => _frames[_currentFrameIndex];

  void init({required List<GameFrame> frames}) {
    _frames.clear();
    _frames.addAll(frames);
    notifyListeners();
  }

  void nextFrame() {
    if (currentFrameIndex < _frames.length) {
      _currentFrameIndex++;
      notifyListeners();
    }
  }
}
