import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/player_equipment/player_equipment_card_effect.dart';

class PlayerEquipmentGameCard extends BossFightGameCard {
  PlayerEquipmentGameCard._({
    required super.id,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/player_equipment_32.png',
         iconSmall: 'assets/card_icons/player_equipment_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/player_equipment/$fileName';

  static final ba0 = PlayerEquipmentGameCard._(
    id: 'ba0',
    effect: PlayerEquipmentCardEffect.example,
    sprite: _spritePath('c0.png'),
  );
}
