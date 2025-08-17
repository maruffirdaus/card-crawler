import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:flutter/material.dart';

class GameSceneProvider extends ChangeNotifier {
  late Map<String, GameFrame> _frames;

  late String _currentFrameId;
  String get currentFrameId => _currentFrameId;

  GameFrame get currentFrame => _frames[_currentFrameId]!;

  void init({required Map<String, GameFrame> frames}) {
    _frames = frames;
    _currentFrameId = frames.keys.first;
    notifyListeners();
  }

  void nextFrame(String nextId) {
    _currentFrameId = nextId;
    notifyListeners();
  }
}
