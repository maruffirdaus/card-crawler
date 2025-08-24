import 'package:flutter/material.dart';

import '../../common/combat_effect/combat_effect_type.dart';
import '../game_card/consumable/consumable_game_card.dart';
import '../game_card/base/game_card.dart';
import '../game_card/equipment/equipment_game_card_effect.dart';
import '../game_card/equipment/equipment_game_card.dart';
import '../game_card/monster/monster_game_card.dart';
import '../game_card/weapon/weapon_game_card.dart';
import '../../common/game_stage/game_stage.dart';
import '../models/core_game_data.dart';
import '../types/core_game_action.dart';
import '../types/core_game_state.dart';
import '../types/core_game_ui_action.dart';
import '../game_card/consumable/consumable_game_card_effect.dart';
import '../game_card/weapon/weapon_card_effect.dart';
import '../types/game_card_location.dart';

class CoreGameProvider extends ChangeNotifier {
  CoreGameState _state = Playing();
  CoreGameState get state => _state;

  final List<CoreGameState> _pendingStates = List.empty(growable: true);

  CoreGameData _data = CoreGameData();
  List<GameCard> get deck => _data.deck;
  List<GameCard?> get dungeonFieldCards => _data.dungeonFieldCards;
  GameCard? get weaponCard => _data.weaponCard;
  List<GameCard> get accessoryCards => _data.equipmentCards;
  List<GameCard> get graveyardCards => _data.graveyardCards;
  int get round => _data.round;
  int get health => _data.health;
  int get durability => _data.durability;
  bool get canFlee => _data.canFlee;

  late GameStage _gameStage;
  GameStage get gameStage => _gameStage;

  (GameCardLocation?, int) _cardWithVisibleEffectDescription = (null, -1);
  (GameCardLocation?, int) get cardWithVisibleEffectDescription =>
      _cardWithVisibleEffectDescription;

  Future<void> init({
    CoreGameData? data,
    required List<GameCard> gameCards,
    required GameStage gameStage,
  }) async {
    _state = Playing();
    _pendingStates.clear();

    _data =
        data ??
        (CoreGameData(deck: gameCards.toList()..shuffle())
          ..refillDungeonFieldCards());

    _gameStage = gameStage;

    _resetCardWidget();

    for (var card in _data.dungeonFieldCards) {
      if (card != null && card.effect.type == CombatEffectType.onField) {
        card.effect.triggerOnCoreGame!(_data);
        _queueState(CardEffectTriggered(card: card));
      }
    }
    if (_data.burnCounter > 0) {
      _data.reduceHealth(1);
      _data.burnCounter--;
    }

    _triggerPendingState();

    notifyListeners();
  }

  void action(CoreGameAction action) {
    _resetCardWidget();

    for (var card in _data.equipmentCards) {
      if (card.effect == EquipmentCardEffect.celestialAegis) {
        _data.canFlee = true;
      }
    }

    switch (action) {
      case SelectCardFromDungeonField(card: var card, index: var index):
        {
          _data.pickedCard = card;
          _data.removeCardFromDungeonField(index);

          for (var acc in _data.equipmentCards) {
            if (acc.effect is EquipmentCardEffect) {
              acc.effect.triggerOnCoreGame!(_data);
            }
          }

          if (card.effect.type == CombatEffectType.onPicked) {
            card.effect.triggerOnCoreGame!(_data);
            _queueState(CardEffectTriggered(card: card));
          }

          switch (card) {
            case ConsumableGameCard():
              {
                if (!_data.hasHealed) {
                  _data.health += card.value;
                  _data.hasHealed = true;
                }
                _data.graveyardCards.add(card);
              }
            case WeaponGameCard():
              {
                if (_data.weaponCard == null) {
                  _data.weaponCard = card;
                } else {
                  _data.graveyardCards.add(_data.weaponCard!);
                  _data.weaponCard = card;
                }
                _data.durability = 15;
              }
            case MonsterGameCard():
              {
                card.value += _data.tempBuff;
                _data.buff = 0;
                _data.tempBuff = 0;

                if (_data.durability > card.value) {
                  if (_data.weaponCard?.effect.type == CombatEffectType.onUse) {
                    _data.weaponCard?.effect.triggerOnCoreGame!(_data);
                    _queueState(CardEffectTriggered(card: _data.weaponCard!));
                  }

                  _data.weaponCard?.value += _data.buff;
                  _data.weaponCard?.value += _data.tempBuff;

                  if (card.value > (_data.weaponCard?.value ?? 0)) {
                    _data.reduceHealth(card.value - _data.weaponCard!.value);
                  }

                  _data.durability = card.value;
                } else {
                  _data.reduceHealth(card.value);
                }

                _data.graveyardCards.add(card);

                _data.weaponCard?.value -= _data.tempBuff;

                if (card.effect.type == CombatEffectType.onKill) {
                  card.effect.triggerOnCoreGame!(_data);
                  _queueState(CardEffectTriggered(card: card));
                }
                if (_data.weaponCard?.effect == WeaponCardEffect.cursedAxe) {
                  _data.cursedAxeCounter++;
                  if (_data.cursedAxeCounter % 2 != 0) {
                    _data.durability = 0;
                  } else {
                    _data.durability = 15;
                  }
                }

                if (_data.weaponCard?.effect == WeaponCardEffect.starForgedHammer) {
                  _data.weaponCard?.effect.triggerOnCoreGame!(_data);
                }
              }
            case EquipmentGameCard():
              {
                if (_data.equipmentCards.length < 3) {
                  _data.equipmentCards.add(card);
                } else {
                  _queueState(ReplacingEquipmentCard());
                }
              }
          }

          if (_data.health == 0) {
            _queueState(Finished(isWin: false));
          } else if (_data.isDungeonFieldCardsEmpty() && _data.deck.isEmpty) {
            _queueState(Finished(isWin: true));
          }

          if (_data.health > 20) _data.health = 20;

          _data.buff = 0;
          _data.tempBuff = 0;

          if (_data.pickedCard!.effect == ConsumableCardEffect.temporalDew) {
            _data.hasHealed = false;
          }

          if (_data.isDungeonFieldCardsLow()) {
            _data.refillDungeonFieldCards();
            _data.round++;
            _data.canFlee = true;
            _data.hasHealed = false;
          }
        }
      case ReplaceEquipmentCard(card: var card, index: var index):
        {
          _data.graveyardCards.add(card);
          _data.equipmentCards[index] = _data.pickedCard!;
          _queueState(Playing());
        }
      case Flee():
        {
          _data.dungeonFieldCards.shuffle();
          for (int i = 0; i < _data.dungeonFieldCards.length; i++) {
            var card = _data.dungeonFieldCards[i];
            _data.dungeonFieldCards[i] = null;
            if (card != null) _data.deck.insert(0, card);
          }
          _data.refillDungeonFieldCards();
          _data.canFlee = false;
        }
    }

    for (var card in _data.dungeonFieldCards) {
      if (card != null && card.effect.type == CombatEffectType.onField) {
        card.effect.triggerOnCoreGame!(_data);
        _queueState(CardEffectTriggered(card: card));
      }
    }

    _triggerPendingState();

    notifyListeners();
  }

  void uiAction(CoreGameUiAction action) {
    switch (action) {
      case TapCard(location: var location, index: var index):
        {
          _cardWithVisibleEffectDescription == (location, index)
              ? _cardWithVisibleEffectDescription = (null, -1)
              : _cardWithVisibleEffectDescription = (location, index);
        }
      case ShowGraveyard():
        {
          _queueState(GraveyardShown());
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

  void _queueState(CoreGameState state) {
    _pendingStates.add(state);
  }

  void _triggerPendingState() {
    var nextState = (_pendingStates.isNotEmpty)
        ? _pendingStates.removeAt(0)
        : null;
    _state = nextState ?? Playing();
  }
}
