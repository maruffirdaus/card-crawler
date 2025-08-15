import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:flutter/material.dart';

class GameSceneProvider extends ChangeNotifier {
  late Map<int, GameFrame> _frames;

  int _currentFrameId = 0;
  int get currentFrameId => _currentFrameId;

  GameFrame get currentFrame => _frames[_currentFrameId]!;

  void init({required Map<int, GameFrame> frames}) {
    _frames = frames;
    notifyListeners();
  }

  void nextFrame(int nextId) {
    _currentFrameId = nextId;
    notifyListeners();
  }
}
