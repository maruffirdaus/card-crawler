import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/player_action/player_action_game_card_effect.dart';

class PlayerActionGameCard extends BossFightGameCard {
  PlayerActionGameCard._({
    required super.id,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/player_action_32.png',
         iconSmall: 'assets/card_icons/player_action_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/player_action/$fileName';

  static final knightlyRending = PlayerActionGameCard._(
    id: 'ba0',
    effect: PlayerActionGameCardEffect.knightlyRending,
    sprite: _spritePath('c0.png'),
  );
}
