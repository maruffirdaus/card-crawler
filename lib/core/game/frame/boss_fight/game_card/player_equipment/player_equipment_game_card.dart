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

  static String _spritePath(String fileName) =>
      'assets/card_sprites/player_equipment/$fileName';

  static final lightArmor = PlayerEquipmentGameCard._(
    id: 'be0',
    effect: PlayerEquipmentGameCardEffect.lightArmor,
    sprite: _spritePath('pe19.png'),
  );

  static final amethystGauntlet = PlayerEquipmentGameCard._(
    id: 'be1',
    effect: PlayerEquipmentGameCardEffect.amethystGauntlet,
    sprite: _spritePath('pe4.png'),
  );

  static final knightsBreastplate = PlayerEquipmentGameCard._(
    id: 'be2',
    effect: PlayerEquipmentGameCardEffect.knightsBreastplate,
    sprite: _spritePath('pe2.png'),
  );

  static final emeraldGauntlet = PlayerEquipmentGameCard._(
    id: 'be3',
    effect: PlayerEquipmentGameCardEffect.emeraldGauntlet,
    sprite: _spritePath('pe1.png'),
  );

  static final swordsmanArmor = PlayerEquipmentGameCard._(
    id: 'be4',
    effect: PlayerEquipmentGameCardEffect.swordsmanArmor,
    sprite: _spritePath('pe9.png'),
  );

  static final superiorArmor = PlayerEquipmentGameCard._(
    id: 'be5',
    effect: PlayerEquipmentGameCardEffect.superiorArmor,
    sprite: _spritePath('pe7.png'),
  );

  static final desertArmor = PlayerEquipmentGameCard._(
    id: 'be6',
    effect: PlayerEquipmentGameCardEffect.desertArmor,
    sprite: _spritePath('pe6.png'),
  );

  static final cursedShield = PlayerEquipmentGameCard._(
    id: 'be7',
    effect: PlayerEquipmentGameCardEffect.cursedShield,
    sprite: _spritePath('pe3.png'),
  );

  static final maddeningShelter = PlayerEquipmentGameCard._(
    id: 'be8',
    effect: PlayerEquipmentGameCardEffect.maddeningShelter,
    sprite: _spritePath('pe5.png'),
  );

  static final vulnerabilityExposer = PlayerEquipmentGameCard._(
    id: 'be9',
    effect: PlayerEquipmentGameCardEffect.vulnerabilityExposer,
    sprite: _spritePath('pe8.png'),
  );

  static final unholyAura = PlayerEquipmentGameCard._(
    id: 'be10',
    effect: PlayerEquipmentGameCardEffect.unholyAura,
    sprite: _spritePath('pe18.png'),
  );

  static final vampiricStrength = PlayerEquipmentGameCard._(
    id: 'be11',
    effect: PlayerEquipmentGameCardEffect.vampiricStrength,
    sprite: _spritePath('pe17.png'),
  );

  static final midasTouch = PlayerEquipmentGameCard._(
    id: 'be12',
    effect: PlayerEquipmentGameCardEffect.midasTouch,
    sprite: _spritePath('pe15.png'),
  );

  static final timelessPiece = PlayerEquipmentGameCard._(
    id: 'be13',
    effect: PlayerEquipmentGameCardEffect.timelessPiece,
    sprite: _spritePath('pe10.png'),
  );

  static final icarusWings = PlayerEquipmentGameCard._(
    id: 'be14',
    effect: PlayerEquipmentGameCardEffect.icarusWings,
    sprite: _spritePath('pe14.png'),
  );

  static final pandorasBox = PlayerEquipmentGameCard._(
    id: 'be15',
    effect: PlayerEquipmentGameCardEffect.pandorasBox,
    sprite: _spritePath('pe20.png'),
  );

  static final monkeysGloves = PlayerEquipmentGameCard._(
    id: 'be16',
    effect: PlayerEquipmentGameCardEffect.monkeysGloves,
    sprite: _spritePath('pe13.png'),
  );

  static final conquerersArmor = PlayerEquipmentGameCard._(
    id: 'be17',
    effect: PlayerEquipmentGameCardEffect.conquerersArmor,
    sprite: _spritePath('pe16.png'),
  );

  static final entries = [
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
