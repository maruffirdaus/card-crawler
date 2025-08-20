import '../combat_effect/combat_effect.dart';

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
  CombatEffect effect;
  String icon;
  String iconSmall;
  String sprite;
}
