import 'package:card_crawler/constant/achievement.dart';
import 'package:card_crawler/constant/effect/effect.dart';
import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/constant/game_cards/accessory_game_cards.dart';
import 'package:card_crawler/constant/game_cards/game_cards.dart';
import 'package:card_crawler/constant/game_cards/weapon_game_cards.dart';
import 'package:card_crawler/model/game_card.dart';
import 'package:card_crawler/model/game_data.dart';
import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/constant/card_location.dart';
import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/provider/gameplay/ui_action.dart';
import 'package:flutter/cupertino.dart';

import 'gameplay_action.dart';

class GameplayProvider extends ChangeNotifier {
  User _user = User();

  GameplayState _state = Playing();

  GameplayState get state => _state;

  final List<GameplayState> _pendingStates = List.empty(growable: true);

  GameData _data = GameData();

  List<GameCard> get deck => _data.deck;

  List<GameCard?> get dungeonField => _data.dungeonField;

  GameCard? get weapon => _data.weapon;

  List<GameCard> get accessories => _data.accessories;

  bool get canReplaceAcc => _data.canReplaceAcc;

  List<GameCard> get graveyard => _data.graveyard;

  (CardLocation?, int) _cardEffectDetailsToShow = (null, -1);

  (CardLocation?, int) get cardEffectDetailsToShow => _cardEffectDetailsToShow;

  int get round => _data.round;

  int get health => _data.health;

  int get durability => _data.durability;

  bool get canFlee => _data.canFlee;

  void init({required User user, required int level}) {
    _user = user;

    _state = Playing();
    _pendingStates.clear();

    _data = GameData(
      deck: gameCards..shuffle(),
    )..refillDungeonField();

    _resetCardView();

    notifyListeners();
  }

  void action(GameplayAction action) {
    _resetCardView();
    for (var card in _data.dungeonField){
      if (card != null && card.effect is OnField){
        card.effect.trigger(_data);
        _queueState(EffectTriggered(card: card));
      }
    }

    switch (action) {
      case SelectCardFromDungeonField(card: var card, index: var index):
        {
          _data.pickedCard = card;
          _data.removeCardFromDungeonField(index);
          if (card.effect is OnPicked){
            card.effect.trigger(_data);
            _queueState(EffectTriggered(card: card));
          }
          switch (card.type){
            case GameCardType.consumable:{
              if (!_data.hasHealed) {
                if (_data.health + card.value > 20){
                  _data.health = 20;
                } else {
                  _data.health += card.value;
                  _data.hasHealed = true;
                }
              }
              _data.graveyard.add(card);
            }
            case GameCardType.weapon:{
              if (_data.weapon == null){
                _data.weapon = card;
              } else {
                _data.graveyard.add(_data.weapon!);
                _data.weapon = card;
              }
              _data.durability = 15;
            }
            case GameCardType.monster:{
              //card.effect.trigger(_data);
              //_queueState(EffectTriggered(card: card));
              card.value += _data.tempBuff;
              if (_data.weapon != null) {
                _data.buff = 0;
                _data.tempBuff = 0;
                _data.weapon!.effect.trigger(_data);
                _queueState(EffectTriggered(card: _data.weapon!));
                _data.weapon?.value += _data.buff;
                _data.weapon?.value += _data.tempBuff;
                _data.buff = 0;
                _data.tempBuff = 0;
              }
              if (_data.durability > card.value){
                if (card.value > _data.weapon!.value){
                  _data.health -= (card.value - _data.weapon!.value);
                }
                _data.durability = card.value;
              } else {
                _data.health -= card.value;
              }
              _data.graveyard.add(card);
              _data.weapon?.value -= _data.tempBuff;
            }
            case GameCardType.accessory:{
              if (_data.accessories.length < 3){
                _data.accessories.add(card);
              } else {
                _data.canReplaceAcc = true;
              }
            }
          }

          if (_data.health <= 0){
            _queueState(Finished(isWin: false));
          } else if (_data.isDungeonFieldEmpty() && _data.deck.isEmpty){
            _queueState(Finished(isWin: true));
          }
          _data.buff = 0;

          if (_data.isDungeonFieldLow()){
            _data.refillDungeonField();
            _data.round++;
            _data.canFlee = true;
          }
          _triggerPendingState();
        }
      case SelectCardFromAccessories(card: var card, index: var index):
        {
          if (_data.canReplaceAcc){
            _data.graveyard.add(card);
            _data.accessories[index] = _data.pickedCard!;
            _data.canReplaceAcc = false;
          }
        }
      case Flee():
        {
          _data.dungeonField.shuffle();
          for (int i = 0; i < _data.dungeonField.length; i++) {
            var card = _data.dungeonField[i];
            _data.dungeonField[i] = null;
            if (card != null) _data.deck.insert(0, card);
          }
          _data.refillDungeonField();
          _data.canFlee = false;
        }
    }

    notifyListeners();
  }

  void uiAction(UiAction action) {
    switch (action) {
      case TapCard(location: var location, index: var index):
        {
          _cardEffectDetailsToShow == (location, index)
              ? _cardEffectDetailsToShow = (null, -1)
              : _cardEffectDetailsToShow = (location, index);
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
      case DismissDialog():
        _triggerPendingState();
    }

    notifyListeners();
  }

  void _resetCardView() {
    _cardEffectDetailsToShow = (null, -1);
  }

  void _queueState(GameplayState state) {
    _pendingStates.add(state);
  }

  void _triggerPendingState() {
    var nextState =
        (_pendingStates.isNotEmpty) ? _pendingStates.removeAt(0) : null;
    _state = nextState ?? Playing();
  }
}
