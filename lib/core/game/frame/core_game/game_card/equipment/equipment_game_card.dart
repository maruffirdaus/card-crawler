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

  static final powerBreastplate = EquipmentGameCard._(
    id: 0,
    value: 5,
    effect: EquipmentGameCardEffect.powerBreastplate,
    sprite: _spritePath('e0.png'),
  );

  static final maximilianPlate = EquipmentGameCard._(
    id: 1,
    value: 4,
    effect: EquipmentGameCardEffect.maximilianPlate,
    sprite: _spritePath('e1.png'),
  );

  static final jackOfPlate = EquipmentGameCard._(
    id: 2,
    value: 5,
    effect: EquipmentGameCardEffect.jackOfPlate,
    sprite: _spritePath('e2.png'),
  );

  static final kalkanBreastplate = EquipmentGameCard._(
    id: 3,
    value: 6,
    effect: EquipmentGameCardEffect.kalkanBreastplate,
    sprite: _spritePath('e3.png'),
  );

  static final armorOfAchilles = EquipmentGameCard._(
    id: 4,
    value: 8,
    effect: EquipmentGameCardEffect.armorOfAchilles,
    sprite: _spritePath('e4.png'),
  );

  static final celestialAegis = EquipmentGameCard._(
    id: 5,
    value: 6,
    effect: EquipmentGameCardEffect.celestialAegis,
    sprite: _spritePath('e5.png'),
  );

  static final sunBlessedAegis = EquipmentGameCard._(
    id: 6,
    value: 8,
    effect: EquipmentGameCardEffect.sunBlessedAegis,
    sprite: _spritePath('e6.png'),
  );

  static final stormPlateOfTempest = EquipmentGameCard._(
    id: 7,
    value: 4,
    effect: EquipmentGameCardEffect.stormPlateOfTempest,
    sprite: _spritePath('e7.png'),
  );

  static final gambeson = EquipmentGameCard._(
    id: 8,
    value: 3,
    effect: EquipmentGameCardEffect.gambeson,
    sprite: _spritePath('e8.png'),
  );

  static final gambelash = EquipmentGameCard._(
    id: 9,
    value: 3,
    effect: EquipmentGameCardEffect.gambelash,
    sprite: _spritePath('e9.png'),
  );

  static final hussitePlate = EquipmentGameCard._(
    id: 10,
    value: 4,
    effect: EquipmentGameCardEffect.hussitePlate,
    sprite: _spritePath('e10.png'),
  );

  static final spiritForgedMail = EquipmentGameCard._(
    id: 11,
    value: 5,
    effect: EquipmentGameCardEffect.spiritForgedMail,
    sprite: _spritePath('e11.png'),
  );

  static final loricaSegmentata = EquipmentGameCard._(
    id: 12,
    value: 5,
    effect: EquipmentGameCardEffect.loricaSegmentata,
    sprite: _spritePath('e12.png'),
  );

  static final stormBreakerCuirass = EquipmentGameCard._(
    id: 13,
    value: 5,
    effect: EquipmentGameCardEffect.stormBreakerCuirass,
    sprite: _spritePath('e13.png'),
  );

  static final pectoralArmor = EquipmentGameCard._(
    id: 14,
    value: 7,
    effect: EquipmentGameCardEffect.pectoralArmor,
    sprite: _spritePath('e14.png'),
  );

  static final lamellarArmor = EquipmentGameCard._(
    id: 15,
    value: 5,
    effect: EquipmentGameCardEffect.lamellarArmor,
    sprite: _spritePath('e15.png'),
  );

  static final oYoroi = EquipmentGameCard._(
    id: 16,
    value: 4,
    effect: EquipmentGameCardEffect.oYoroi,
    sprite: _spritePath('e16.png'),
  );

  static final verdantBreastplate = EquipmentGameCard._(
    id: 17,
    value: 6,
    effect: EquipmentGameCardEffect.verdantBreastplate,
    sprite: _spritePath('e17.png'),
  );

  static final forestWardenArmor = EquipmentGameCard._(
    id: 18,
    value: 6,
    effect: EquipmentGameCardEffect.forestWardenArmor,
    sprite: _spritePath('e18.png'),
  );

  static final easternGuardianPlate = EquipmentGameCard._(
    id: 19,
    value: 2,
    effect: EquipmentGameCardEffect.easternGuardianPlate,
    sprite: _spritePath('e19.png'),
  );

  static final rubyWyrmbarkBreastplate = EquipmentGameCard._(
    id: 20,
    value: 5,
    effect: EquipmentGameCardEffect.rubyWyrmbarkBreastplate,
    sprite: _spritePath('ruby_wyrmbark_breastplate.png'),
  );

  static final entriesSnowy = [
    powerBreastplate,
    maximilianPlate,
    jackOfPlate,
    kalkanBreastplate,
    armorOfAchilles,
    celestialAegis,
    sunBlessedAegis,
    stormPlateOfTempest,
  ];

  static final entriesDesert = [
    gambeson,
    gambelash,
    hussitePlate,
    spiritForgedMail,
    loricaSegmentata,
    stormBreakerCuirass,
    pectoralArmor,
  ];

  static final entriesCastle = [
    pectoralArmor,
    lamellarArmor,
    oYoroi,
    verdantBreastplate,
    forestWardenArmor,
    easternGuardianPlate,
    rubyWyrmbarkBreastplate,
  ];
}
