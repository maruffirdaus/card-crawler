import '../game_card/base/game_card.dart';

sealed class CoreGameState {}

class Playing extends CoreGameState {}

class ReplacingEquipmentGameCard extends CoreGameState {}

class GameCardEffectTriggered extends CoreGameState {
  GameCardEffectTriggered({required this.card});

  final GameCard card;
}

class GraveyardShown extends CoreGameState {}

class Finished extends CoreGameState {
  Finished({required this.isWin});

  final bool isWin;
}

class Paused extends CoreGameState {}
