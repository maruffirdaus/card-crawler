import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';

sealed class BossFightState {}

class Playing extends BossFightState {}

class ReplacingPlayerEquipmentGameCard extends BossFightState {}

class BossFightGameCardEffectTriggered extends BossFightState {
  BossFightGameCardEffectTriggered({required this.card});

  final BossFightGameCard card;
}

class Finished extends BossFightState {
  Finished({required this.isWin});

  final bool isWin;
}

class Paused extends BossFightState {}