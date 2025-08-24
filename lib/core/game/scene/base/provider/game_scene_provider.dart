import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:card_crawler/core/game/frame/common/status_effect/status_effect.dart';
import 'package:flutter/material.dart';

import '../../../frame/core_game/core_game_frame.dart';

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

  void nextFrame({
    required String nextId,
    List<StatusEffect>? nextStatusEffects,
  }) {
    if (nextStatusEffects != null && _frames[nextId] is CoreGameFrame) {
      (_frames[nextId] as CoreGameFrame).addAllStatusEffects(nextStatusEffects);
    }
    _currentFrameId = nextId;
    notifyListeners();
  }
}
