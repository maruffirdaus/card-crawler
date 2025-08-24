import 'game_card_effect.dart';

class GameCard {
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

  GameCard copy() {
    return GameCard(
      id: id,
      value: value,
      effect: effect,
      icon: icon,
      iconSmall: iconSmall,
      sprite: sprite,
    );
  }
}
