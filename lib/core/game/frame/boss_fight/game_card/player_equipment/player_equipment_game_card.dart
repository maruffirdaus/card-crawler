import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/player_equipment/player_equipment_game_card_effect.dart';

class PlayerEquipmentGameCard extends BossFightGameCard {
  PlayerEquipmentGameCard._({
    required super.id,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/player_equipment_32.png',
         iconSmall: 'assets/card_icons/player_equipment_16.png',
       );

  @override
  BossFightGameCard copy() =>
      PlayerEquipmentGameCard._(id: id, effect: effect, sprite: sprite);

  static String _spritePath(String fileName) =>
      'assets/card_sprites/player_equipment/$fileName';

  static final lightArmor = PlayerEquipmentGameCard._(
    id: 'be0',
    effect: PlayerEquipmentGameCardEffect.lightArmor,
    sprite: _spritePath('light_armor.png'),
  );

  static final amethystGauntlet = PlayerEquipmentGameCard._(
    id: 'be1',
    effect: PlayerEquipmentGameCardEffect.amethystGauntlet,
    sprite: _spritePath('amethyst_gauntlet.png'),
  );

  static final knightsBreastplate = PlayerEquipmentGameCard._(
    id: 'be2',
    effect: PlayerEquipmentGameCardEffect.knightsBreastplate,
    sprite: _spritePath('knights_breastplate.png'),
  );

  static final emeraldGauntlet = PlayerEquipmentGameCard._(
    id: 'be3',
    effect: PlayerEquipmentGameCardEffect.emeraldGauntlet,
    sprite: _spritePath('emerald_gauntlet.png'),
  );

  static final swordsmanArmor = PlayerEquipmentGameCard._(
    id: 'be4',
    effect: PlayerEquipmentGameCardEffect.swordsmanArmor,
    sprite: _spritePath('swordsman_armor.png'),
  );

  static final superiorArmor = PlayerEquipmentGameCard._(
    id: 'be5',
    effect: PlayerEquipmentGameCardEffect.superiorArmor,
    sprite: _spritePath('superior_armor.png'),
  );

  static final desertArmor = PlayerEquipmentGameCard._(
    id: 'be6',
    effect: PlayerEquipmentGameCardEffect.desertArmor,
    sprite: _spritePath('desert_armor.png'),
  );

  static final cursedShield = PlayerEquipmentGameCard._(
    id: 'be7',
    effect: PlayerEquipmentGameCardEffect.cursedShield,
    sprite: _spritePath('cursed_shield.png'),
  );

  static final maddeningShelter = PlayerEquipmentGameCard._(
    id: 'be8',
    effect: PlayerEquipmentGameCardEffect.maddeningShelter,
    sprite: _spritePath('maddening_shelter.png'),
  );

  static final vulnerabilityExposer = PlayerEquipmentGameCard._(
    id: 'be9',
    effect: PlayerEquipmentGameCardEffect.vulnerabilityExposer,
    sprite: _spritePath('vulnerability_exposer.png'),
  );

  static final unholyAura = PlayerEquipmentGameCard._(
    id: 'be10',
    effect: PlayerEquipmentGameCardEffect.unholyAura,
    sprite: _spritePath('unholy_aura.png'),
  );

  static final vampiricStrength = PlayerEquipmentGameCard._(
    id: 'be11',
    effect: PlayerEquipmentGameCardEffect.vampiricStrength,
    sprite: _spritePath('vampiric_strength.png'),
  );

  static final midasTouch = PlayerEquipmentGameCard._(
    id: 'be12',
    effect: PlayerEquipmentGameCardEffect.midasTouch,
    sprite: _spritePath('midas_touch.png'),
  );

  static final timelessPiece = PlayerEquipmentGameCard._(
    id: 'be13',
    effect: PlayerEquipmentGameCardEffect.timelessPiece,
    sprite: _spritePath('timeless_piece.png'),
  );

  static final icarusWings = PlayerEquipmentGameCard._(
    id: 'be14',
    effect: PlayerEquipmentGameCardEffect.icarusWings,
    sprite: _spritePath('icarus_wings.png'),
  );

  static final pandorasBox = PlayerEquipmentGameCard._(
    id: 'be15',
    effect: PlayerEquipmentGameCardEffect.pandorasBox,
    sprite: _spritePath('pandoras_box.png'),
  );

  static final monkeysGloves = PlayerEquipmentGameCard._(
    id: 'be16',
    effect: PlayerEquipmentGameCardEffect.monkeysGloves,
    sprite: _spritePath('monkeys_gloves.png'),
  );

  static final conquerersArmor = PlayerEquipmentGameCard._(
    id: 'be17',
    effect: PlayerEquipmentGameCardEffect.conquerersArmor,
    sprite: _spritePath('conquerers_armor.png'),
  );

  static final entries1 = [
    lightArmor,
    amethystGauntlet,
    knightsBreastplate,
    emeraldGauntlet,
    swordsmanArmor,
    superiorArmor,
  ];

  static final entries2 = [
    lightArmor,
    amethystGauntlet,
    knightsBreastplate,
    emeraldGauntlet,
    swordsmanArmor,
    superiorArmor,
    desertArmor,
    cursedShield,
    maddeningShelter,
    vulnerabilityExposer,
    unholyAura,
    vampiricStrength,
  ];

  static final entries3 = [
    lightArmor,
    amethystGauntlet,
    knightsBreastplate,
    emeraldGauntlet,
    swordsmanArmor,
    superiorArmor,
    desertArmor,
    cursedShield,
    maddeningShelter,
    vulnerabilityExposer,
    unholyAura,
    vampiricStrength,
    midasTouch,
    timelessPiece,
    icarusWings,
    pandorasBox,
    monkeysGloves,
    conquerersArmor,
  ];
}
