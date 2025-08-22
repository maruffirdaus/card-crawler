import '../../core_game/game_card/base/game_card.dart';

class BossFightData {
  BossFightData({List<GameCard>? deck, List<GameCard?>? fieldCards}) {
    this.deck = deck ?? List.empty(growable: true);
    this.fieldCards = fieldCards ?? List.filled(4, null);
  }

  List<GameCard> deck = List.empty(growable: true);
  List<GameCard?> fieldCards = List.filled(4, null);
}
