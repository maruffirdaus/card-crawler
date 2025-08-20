import '../../common/game_card/base/game_card.dart';

sealed class CoreGameAction {}

class SelectCardFromDungeonField extends CoreGameAction {
  SelectCardFromDungeonField({required this.card, required this.index});

  final GameCard card;
  final int index;
}

class ReplaceAccessoryCard extends CoreGameAction {
  ReplaceAccessoryCard({required this.card, required this.index});

  final GameCard card;
  final int index;
}

class Flee extends CoreGameAction {}
