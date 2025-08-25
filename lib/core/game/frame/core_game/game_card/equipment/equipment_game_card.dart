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
    sprite: _spritePath('power_breastplate.png'),
  );

  static final maximilianPlate = EquipmentGameCard._(
    id: 1,
    value: 4,
    effect: EquipmentGameCardEffect.maximilianPlate,
    sprite: _spritePath('maximilian_plate.png'),
  );

  static final jackOfPlate = EquipmentGameCard._(
    id: 2,
    value: 5,
    effect: EquipmentGameCardEffect.jackOfPlate,
    sprite: _spritePath('jack_of_plate.png'),
  );

  static final kalkanBreastplate = EquipmentGameCard._(
    id: 3,
    value: 6,
    effect: EquipmentGameCardEffect.kalkanBreastplate,
    sprite: _spritePath('kalkan_breastplate.png'),
  );

  static final armorOfAchilles = EquipmentGameCard._(
    id: 4,
    value: 8,
    effect: EquipmentGameCardEffect.armorOfAchilles,
    sprite: _spritePath('armor_of_achilles.png'),
  );

  static final celestialAegis = EquipmentGameCard._(
    id: 5,
    value: 6,
    effect: EquipmentGameCardEffect.celestialAegis,
    sprite: _spritePath('celestial_aegis.png'),
  );

  static final sunBlessedAegis = EquipmentGameCard._(
    id: 6,
    value: 8,
    effect: EquipmentGameCardEffect.sunBlessedAegis,
    sprite: _spritePath('sun_blessed_aegis.png'),
  );

  static final stormPlateOfTempest = EquipmentGameCard._(
    id: 7,
    value: 4,
    effect: EquipmentGameCardEffect.stormPlateOfTempest,
    sprite: _spritePath('storm_plate_of_tempest.png'),
  );

  static final gambeson = EquipmentGameCard._(
    id: 8,
    value: 3,
    effect: EquipmentGameCardEffect.gambeson,
    sprite: _spritePath('gambeson.png'),
  );

  static final gambelash = EquipmentGameCard._(
    id: 9,
    value: 3,
    effect: EquipmentGameCardEffect.gambelash,
    sprite: _spritePath('gambelash.png'),
  );

  static final hussitePlate = EquipmentGameCard._(
    id: 10,
    value: 4,
    effect: EquipmentGameCardEffect.hussitePlate,
    sprite: _spritePath('hussite_plate.png'),
  );

  static final spiritForgedMail = EquipmentGameCard._(
    id: 11,
    value: 5,
    effect: EquipmentGameCardEffect.spiritForgedMail,
    sprite: _spritePath('spirit_forged_mail.png'),
  );

  static final loricaSegmentata = EquipmentGameCard._(
    id: 12,
    value: 5,
    effect: EquipmentGameCardEffect.loricaSegmentata,
    sprite: _spritePath('lorica_segmentata.png'),
  );

  static final stormBreakerCuirass = EquipmentGameCard._(
    id: 13,
    value: 5,
    effect: EquipmentGameCardEffect.stormBreakerCuirass,
    sprite: _spritePath('storm_breaker_cuirass.png'),
  );

  static final pectoralArmor = EquipmentGameCard._(
    id: 14,
    value: 7,
    effect: EquipmentGameCardEffect.pectoralArmor,
    sprite: _spritePath('pectoral_armor.png'),
  );

  static final lamellarArmor = EquipmentGameCard._(
    id: 15,
    value: 5,
    effect: EquipmentGameCardEffect.lamellarArmor,
    sprite: _spritePath('lamellar_armor.png'),
  );

  static final oYoroi = EquipmentGameCard._(
    id: 16,
    value: 4,
    effect: EquipmentGameCardEffect.oYoroi,
    sprite: _spritePath('o_yoroi.png'),
  );

  static final verdantBreastplate = EquipmentGameCard._(
    id: 17,
    value: 6,
    effect: EquipmentGameCardEffect.verdantBreastplate,
    sprite: _spritePath('verdant_breastplate.png'),
  );

  static final forestWardenArmor = EquipmentGameCard._(
    id: 18,
    value: 6,
    effect: EquipmentGameCardEffect.forestWardenArmor,
    sprite: _spritePath('forest_warden_armor.png'),
  );

  static final easternGuardianPlate = EquipmentGameCard._(
    id: 19,
    value: 2,
    effect: EquipmentGameCardEffect.easternGuardianPlate,
    sprite: _spritePath('eastern_guardian_plate.png'),
  );

  static final rubyWyrmbarkBreastplate = EquipmentGameCard._(
    id: 20,
    value: 5,
    effect: EquipmentGameCardEffect.rubyWyrmbarkBreastplate,
    sprite: _spritePath('ruby_wyrmbark_breastplate.png'),
  );

  static final snowyEntries = [
    powerBreastplate,
    maximilianPlate,
    jackOfPlate,
    kalkanBreastplate,
    armorOfAchilles,
    celestialAegis,
    sunBlessedAegis,
    stormPlateOfTempest,
  ];

  static final desertEntries = [
    gambeson,
    gambelash,
    hussitePlate,
    spiritForgedMail,
    loricaSegmentata,
    stormBreakerCuirass,
    pectoralArmor,
  ];

  static final castleEntries = [
    pectoralArmor,
    lamellarArmor,
    oYoroi,
    verdantBreastplate,
    forestWardenArmor,
    easternGuardianPlate,
    rubyWyrmbarkBreastplate,
  ];
}
