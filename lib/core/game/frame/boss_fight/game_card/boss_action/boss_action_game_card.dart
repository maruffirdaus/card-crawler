import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/boss_action/boss_action_card_effect.dart';

class BossActionGameCard extends BossFightGameCard {
  BossActionGameCard._({
    required super.id,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/boss_action_32.png',
         iconSmall: 'assets/card_icons/boss_action_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/boss_action/$fileName';

  static final ba0 = BossActionGameCard._(
    id: 'ba0',
    effect: BossActionCardEffect.example,
    sprite: _spritePath('c0.png'),
  );
}
