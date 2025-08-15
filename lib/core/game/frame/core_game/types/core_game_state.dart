import '../../common/game_card/game_card.dart';

sealed class CoreGameState {}

class Playing extends CoreGameState {}

class ReplacingAccessoryCard extends CoreGameState {}

class CardEffectTriggered extends CoreGameState {
  CardEffectTriggered({required this.card});

  final GameCard card;
}

class GraveyardShown extends CoreGameState {}

class Finished extends CoreGameState {
  Finished({required this.isWin});

  final bool isWin;
}

class Paused extends CoreGameState {}
