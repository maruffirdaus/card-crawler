import 'equipment_card_effect.dart';
import '../base/game_card.dart';

class EquipmentGameCard extends GameCard {
  EquipmentGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/equipment_32.png',
         iconSmall: 'assets/card_icons/equipment_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/equipment/$fileName';

  static final a0 = EquipmentGameCard._(
    id: 9,
    value: 0,
    effect: EquipmentCardEffect.spectreBoots,
    sprite: _spritePath('a0.png'),
  );

  static final a1 = EquipmentGameCard._(
    id: 10,
    value: 0,
    effect: EquipmentCardEffect.powerBreastplate,
    sprite: _spritePath('a1.png'),
  );

  static final a2 = EquipmentGameCard._(
    id: 11,
    value: 0,
    effect: EquipmentCardEffect.commanderHelmet,
    sprite: _spritePath('a2.png'),
  );

  static final a3 = EquipmentGameCard._(
    id: 12,
    value: 0,
    effect: EquipmentCardEffect.ringOfMending,
    sprite: _spritePath('a3.png'),
  );

  static final a4 = EquipmentGameCard._(
    id: 13,
    value: 0,
    effect: EquipmentCardEffect.healingAmulet,
    sprite: _spritePath('a4.png'),
  );

  static final a5 = EquipmentGameCard._(
    id: 14,
    value: 0,
    effect: EquipmentCardEffect.heroCape,
    sprite: _spritePath('a5.png'),
  );

  static final a6 = EquipmentGameCard._(
    id: 15,
    value: 0,
    effect: EquipmentCardEffect.emperorCrown,
    sprite: _spritePath('a6.png'),
  );

  static final entries = [a0, a1, a2, a3, a4, a5, a6];
}
