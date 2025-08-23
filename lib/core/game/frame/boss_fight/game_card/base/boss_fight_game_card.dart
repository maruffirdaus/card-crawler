import '../../../common/combat_effect/combat_effect.dart';

class BossFightGameCard {
  BossFightGameCard({
    required this.id,
    required this.effect,
    required this.icon,
    required this.iconSmall,
    required this.sprite,
  });

  String id;
  CombatEffect effect;
  String icon;
  String iconSmall;
  String sprite;
}
