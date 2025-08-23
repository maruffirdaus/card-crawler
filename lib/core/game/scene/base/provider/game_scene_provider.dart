import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:card_crawler/core/game/frame/common/combat_effect/combat_effect.dart';
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
    List<CombatEffect>? nextCombatEffects,
  }) {
    if (nextCombatEffects != null && _frames[nextId] is CoreGameFrame) {
      (_frames[nextId] as CoreGameFrame).addAllCombatEffects(nextCombatEffects);
    }
    _currentFrameId = nextId;
    notifyListeners();
  }
}
