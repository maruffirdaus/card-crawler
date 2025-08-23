import '../base/game_card.dart';
import 'equipment_game_card_effect.dart';

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

  static final e0 = EquipmentGameCard._(
    id: 0,
    value: 5,
    effect: EquipmentCardEffect.powerBreastplate,
    sprite: _spritePath('e0.png'),
  );

  static final e1 = EquipmentGameCard._(
    id: 0,
    value: 4,
    effect: EquipmentCardEffect.maximilianPlate,
    sprite: _spritePath('e1.png'),
  );

  static final e2 = EquipmentGameCard._(
    id: 0,
    value: 5,
    effect: EquipmentCardEffect.jackOfPlate,
    sprite: _spritePath('e2.png'),
  );

  static final e3 = EquipmentGameCard._(
    id: 0,
    value: 6,
    effect: EquipmentCardEffect.kalkanBreastplate,
    sprite: _spritePath('e3.png'),
  );

  static final e4 = EquipmentGameCard._(
    id: 0,
    value: 8,
    effect: EquipmentCardEffect.armorOfAchilles,
    sprite: _spritePath('e4.png'),
  );

  static final e5 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.celestialAegis,
    sprite: _spritePath('e5.png'),
  );

  static final e6 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.sunBlessedAegis,
    sprite: _spritePath('e6.png'),
  );

  static final e7 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.stormPlateOfTempest,
    sprite: _spritePath('e7.png'),
  );

  static final e8 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.gambeson,
    sprite: _spritePath('e8.png'),
  );

  static final e9 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.gambelash,
    sprite: _spritePath('e9.png'),
  );

  static final e10 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.hussitePlate,
    sprite: _spritePath('e10.png'),
  );

  static final e11 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.spiritForgedMail,
    sprite: _spritePath('e11.png'),
  );

  static final e12 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.loricaSegmentata,
    sprite: _spritePath('e12.png'),
  );

  static final e13 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.stormBreakerCuirass,
    sprite: _spritePath('e13.png'),
  );

  static final e14 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.pectoralArmor,
    sprite: _spritePath('e14.png'),
  );

  static final e15 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.lamellarArmor,
    sprite: _spritePath('e15.png'),
  );

  static final e16 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.oYoroi,
    sprite: _spritePath('e16.png'),
  );

  static final e17 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.verdantBreastplate,
    sprite: _spritePath('e17.png'),
  );

  static final e18 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.forestWardenArmor,
    sprite: _spritePath('e18.png'),
  );

  static final e19 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.easternGuardianPlate,
    sprite: _spritePath('e19.png'),
  );

  static final e20 = EquipmentGameCard._(
    id: 0,
    value: 0,
    effect: EquipmentCardEffect.rubyWyrmbarkBreastplate,
    sprite: _spritePath('e20.png'),
  );

  static final entries = [
    e0,
    e1,
    e2,
    e3,
    e4,
    e5,
    e6,
    e7,
    e8,
    e9,
    e10,
    e11,
    e12,
    e13,
    e14,
    e15,
    e16,
    e17,
    e18,
    e19,
    e20,
  ];
}
