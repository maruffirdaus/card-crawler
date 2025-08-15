import '../../core_game/types/game_card_effect/game_card_effect.dart';

abstract class GameCard {
  GameCard({
    required this.id,
    required this.value,
    required this.effect,
    required this.icon,
    required this.iconSmall,
    required this.sprite,
  });

  int id;
  int value;
  GameCardEffect effect;
  String icon;
  String iconSmall;
  String sprite;
}
