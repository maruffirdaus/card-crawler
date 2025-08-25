import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card_effect_type.dart';
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

  late Boss _boss;
  Boss get boss => _boss;

  BossFightData _data = BossFightData();
  List<BossFightGameCard?> get fieldCards => _data.fieldCards;
  List<BossFightGameCard> get playerEquipmentCards =>
      _data.playerEquipmentCards;
  List<BossFightGameCard> get bossActionCards => _data.bossActions;
  int get playerHealth => _data.playerHealth;
  int get bossHealth => _data.bossHealth;

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

    _boss = boss;

    _data =
        data ??
        (BossFightData(
          deck: playerGameCards.toList()..shuffle(),
          bossActions: bossGameCards.toList()..shuffle(),
          bossHealth: boss.health,
          bossMaxHealth: boss.health,
        )..refillFieldCards());

    _gameStage = gameStage;

    _resetCardWidget();

    notifyListeners();
  }

  void action(BossFightAction action) {
    for (var acc in _data.playerEquipmentCards) {
      if (acc.effect.type == BossFightGameCardEffectType.equipmentCard) {
        acc.effect.trigger(_data);
      }
    }
    if (!_data.playerSkipped) {
      switch (action) {
        case SelectCardFromField(card: var card, index: var index):
          {
            _data.playerPickedCard = card;
            _data.deck.insert(0, _data.playerPickedCard!);
            _data.removeCardFromField(index);
            if (card.effect.type == BossFightGameCardEffectType.equipmentCard) {
              if (_data.playerEquipmentCards.length < 3) {
                _data.playerEquipmentCards.add(card);
                card.effect.trigger(_data);
                _queueState(BossFightGameCardEffectTriggered(card: card));
              } else {
                _queueState(ReplacingPlayerEquipmentGameCard());
              }
            } else {
              card.effect.trigger(_data);
              _queueState(BossFightGameCardEffectTriggered(card: card));
            }
            if (_data.isFieldCardsLow()) {
              _data.refillFieldCards();
            }
          }
        case ReplacePlayerEquipmentCard(card: var card, index: var index):
          {
            _data.playerEquipmentCards[index] = card;
            _queueState(Playing());
          }
        case Renew():
          {
            _data.renew();
          }
        case SkipTurn():
          {}
      }
    } else {
      //_queueState(TurnSkipped());
    }
    /*for (var status in _data.playerEquipmentCards) { // NOT EQUIPMENT, CHANGE TO STATUS
      if (status.effect.type == BossFightGameCardEffectType.equipmentCard) {
        status.effect.trigger(_data);
        _queueState(BossFightGameCardEffectTriggered(card: status));
      }
    }*/

    if (_data.playerHealth <= 0) {
      _queueState(Finished(isWin: false));
    } else if (_data.bossHealth <= 0) {
      _queueState(Finished(isWin: true));
    }

    if (_data.gorillaTactic) {
      _data.gorillaTactic = false;
      _data.bossBaseDefenseMultiplier = 1;
    }

    if (_data.gorillaRally) {
      _data.gorillaRally = false;
      _data.bossAttackMultiplier += _data.bossAttackMultiplier;
    }

    if (!_data.bossSkipped) {
      _data.bossPickedCard = _data.bossActions.removeLast();
      _data.bossActions.insert(0, _data.bossPickedCard!);
      _data.bossPickedCard!.effect.trigger(_data);
      _queueState(
        BossFightGameCardEffectTriggered(card: _data.bossPickedCard!),
      );
    } else {
      //_queueState(TurnSkipped());
    }

    if (_data.poison > 0) {
      _data.reducePlayerHealth(4);
      _data.poison--;
    }

    if (_data.bossHealth <= 0) {
      _queueState(Finished(isWin: true));
    } else if (_data.playerHealth <= 0) {
      _queueState(Finished(isWin: false));
    }

    _data.playerAttackMultiplier = _data.playerBaseAttackMultiplier;
    _data.playerDefenseMultiplier = _data.playerBaseDefenseMultiplier;
    _data.playerHealingMultiplier = _data.playerBaseHealingMultiplier;
    _data.bossAttackMultiplier = _data.bossBaseAttackMultiplier;
    _data.bossDefenseMultiplier = _data.bossBaseDefenseMultiplier;
    _data.bossHealingMultiplier = _data.bossBaseHealingMultiplier;

    if (_data.playerSkipped) {
      _data.playerTurnSkip--;
      if (_data.playerTurnSkip == 0) {
        _data.playerSkipped = false;
      }
    }

    if (_data.bossSkipped) {
      _data.bossTurnSkip--;
      if (_data.bossTurnSkip == 0) {
        _data.bossSkipped = false;
      }
    }

    if (_data.everbloom > 0) _data.everbloom--;

    if (_data.metallica > 0) {
      _data.metallica--;
      _data.reducePlayerHealth(3);
    }

    if (_data.singularityOn) {
      _data.singularity--;
      if (_data.singularity == 0) _queueState(Finished(isWin: false));
    }

    if (_data.eldritchContractOn) {
      _data.eldritchContract--;
      if (_data.eldritchContract == 0) _queueState(Finished(isWin: false));
    }

    if (_data.cursedCount > 0) {
      _data.cursedCount--;
      _data.playerAttackMultiplier -= _data.cursedModifier;
    }

    if (_data.phantom > 0) {
      _data.phantom--;
      _data.bossDefenseMultiplier = 0;
      if (_data.phantom == 0) {
        _data.reducePlayerHealth(_data.bossDamageCalculator(5));
      }
    }

    _triggerPendingState();
    notifyListeners();
  }

  void uiAction(BossFightUiAction action) {
    switch (action) {
      case TapCard(location: var location, index: var index):
        {
          _cardWithVisibleEffectDescription == (location, index)
              ? _cardWithVisibleEffectDescription = (null, -1)
              : _cardWithVisibleEffectDescription = (location, index);
        }
      case ShowPlayerEquipments():
        {
          _queueState(PlayerEquipmentsShown());
          _triggerPendingState();
        }
      case ShowBossActions():
        {
          _queueState(BossActionsShown());
          _triggerPendingState();
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
