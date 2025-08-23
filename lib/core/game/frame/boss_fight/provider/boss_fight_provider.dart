import 'package:card_crawler/core/game/frame/boss_fight/models/boss_fight_data.dart';
import 'package:card_crawler/core/game/frame/boss_fight/types/boss_fight_action.dart';
import 'package:flutter/material.dart';

class BossFightProvider extends ChangeNotifier {
  BossFightData _data = BossFightData();

  void action(BossFightAction action) {
    switch (action) {
      case SelectCardFromField(card: var card, index: var index):
        {}
      case ReplacePlayerEquipmentCard(card: var card, index: var index):
        {}
      case Refresh():
        {}
    }
    if (_data.playerTurnSkip >= 0){
      _data.playerTurnSkip--;
    }
    if (_data.bossTurnSkip >= 0){
      _data.bossTurnSkip--;
    }
  }
}
