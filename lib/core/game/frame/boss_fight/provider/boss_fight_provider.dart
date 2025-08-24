import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/models/boss_fight_data.dart';
import 'package:card_crawler/core/game/frame/boss_fight/types/boss_fight_action.dart';
import 'package:flutter/material.dart';

import '../../common/game_stage/game_stage.dart';
import '../boss/boss.dart';
import '../types/boss_fight_game_card_location.dart';
import '../types/boss_fight_state.dart';
import '../types/boss_fight_ui_action.dart';

class BossFightProvider extends ChangeNotifier {
  BossFightState _state = Playing();
  BossFightState get state => _state;

  final List<BossFightState> _pendingStates = List.empty(growable: true);

  BossFightData _data = BossFightData();
  List<BossFightGameCard?> get fieldCards => _data.fieldCards;
  List<BossFightGameCard> get equipmentCards => _data.equipmentCards;
  List<BossFightGameCard> get bossActionCards => _data.bossActions;

  late GameStage _gameStage;
  GameStage get gameStage => _gameStage;

  (BossFightGameCardLocation?, int) _cardWithVisibleEffectDescription = (
    null,
    -1,
  );

  (BossFightGameCardLocation?, int) get cardWithVisibleEffectDescription =>
      _cardWithVisibleEffectDescription;

  void init({
    BossFightData? data,
    required Boss boss,
    required List<BossFightGameCard> playerGameCards,
    required List<BossFightGameCard> bossGameCards,
    required GameStage gameStage,
  }) {
    _state = Playing();
    _pendingStates.clear();

    _data =
        data ??
        (BossFightData(
          deck: playerGameCards.toList()..shuffle(),
          bossActions: bossGameCards.toList()..shuffle(),
        )..refillFieldCards());

    _gameStage = gameStage;

    _resetCardWidget();

    notifyListeners();
  }

  void action(BossFightAction action) {
    switch (action) {
      case SelectCardFromField(card: var card, index: var index):
        {}
      case ReplacePlayerEquipmentCard(card: var card, index: var index):
        {}
      case Refresh():
        {}
    }
    if (_data.playerTurnSkip >= 0) {
      _data.playerTurnSkip--;
    }
    if (_data.bossTurnSkip >= 0) {
      _data.bossTurnSkip--;
    }
  }

  void uiAction(BossFightUiAction action) {
    switch (action) {
      case TapCard(location: var location, index: var index):
        {
          _cardWithVisibleEffectDescription == (location, index)
              ? _cardWithVisibleEffectDescription = (null, -1)
              : _cardWithVisibleEffectDescription = (location, index);
        }
      case Pause():
        {
          _queueState(Paused());
          _triggerPendingState();
        }
      case DismissPopup():
        _triggerPendingState();
    }

    notifyListeners();
  }

  void _resetCardWidget() {
    _cardWithVisibleEffectDescription = (null, -1);
  }

  void _queueState(BossFightState state) {
    _pendingStates.add(state);
  }

  void _triggerPendingState() {
    var nextState = (_pendingStates.isNotEmpty)
        ? _pendingStates.removeAt(0)
        : null;
    _state = nextState ?? Playing();
  }
}
