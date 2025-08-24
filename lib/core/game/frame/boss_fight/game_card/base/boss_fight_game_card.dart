import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card_effect.dart';

class BossFightGameCard {
  BossFightGameCard({
    required this.id,
    required this.effect,
    required this.icon,
    required this.iconSmall,
    required this.sprite,
  });

  String id;
  BossFightGameCardEffect effect;
  String icon;
  String iconSmall;
  String sprite;

  BossFightGameCard copy() {
    return BossFightGameCard(
      id: id,
      effect: effect,
      icon: icon,
      iconSmall: iconSmall,
      sprite: sprite,
    );
  }
}
