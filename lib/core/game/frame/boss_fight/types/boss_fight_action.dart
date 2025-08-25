import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';

sealed class BossFightAction {}

class SelectCardFromField extends BossFightAction {
  SelectCardFromField({required this.card, required this.index});

  final BossFightGameCard card;
  final int index;
}

class ReplacePlayerEquipmentCard extends BossFightAction {
  ReplacePlayerEquipmentCard({required this.card, required this.index});

  final BossFightGameCard card;
  final int index;
}

class Renew extends BossFightAction {}

class SkipTurn extends BossFightAction {}
