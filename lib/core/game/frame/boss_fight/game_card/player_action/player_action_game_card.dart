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

  @override
  BossFightGameCard copy() =>
      PlayerActionGameCard._(id: id, effect: effect, sprite: sprite);

  static String _spritePath(String fileName) =>
      'assets/card_sprites/player_action/$fileName';

  static final knightlyRending = PlayerActionGameCard._(
    id: 'p0',
    effect: PlayerActionGameCardEffect.knightlyRending,
    sprite: _spritePath('knightly_rending.png'),
  );

  static final mistyDodge = PlayerActionGameCard._(
    id: 'p1',
    effect: PlayerActionGameCardEffect.mistyDodge,
    sprite: _spritePath('misty_dodge.png'),
  );

  static final fancyFootwork = PlayerActionGameCard._(
    id: 'p2',
    effect: PlayerActionGameCardEffect.fancyFootwork,
    sprite: _spritePath('fancy_footwork.png'),
  );

  static final boneChill = PlayerActionGameCard._(
    id: 'p3',
    effect: PlayerActionGameCardEffect.boneChill,
    sprite: _spritePath('bone_chill.png'),
  );

  static final enhanceWeapon = PlayerActionGameCard._(
    id: 'p4',
    effect: PlayerActionGameCardEffect.enhanceWeapon,
    sprite: _spritePath('enhance_weapon.png'),
  );

  static final healingPotion = PlayerActionGameCard._(
    id: 'p5',
    effect: PlayerActionGameCardEffect.healingPotion,
    sprite: _spritePath('healing_potion.png'),
  );

  static final haste = PlayerActionGameCard._(
    id: 'p6',
    effect: PlayerActionGameCardEffect.haste,
    sprite: _spritePath('haste.png'),
  );

  static final followUp = PlayerActionGameCard._(
    id: 'p7',
    effect: PlayerActionGameCardEffect.followUp,
    sprite: _spritePath('follow_up.png'),
  );

  static final cyclone = PlayerActionGameCard._(
    id: 'p8',
    effect: PlayerActionGameCardEffect.cyclone,
    sprite: _spritePath('cyclone.png'),
  );

  static final ironskinPotion = PlayerActionGameCard._(
    id: 'p9',
    effect: PlayerActionGameCardEffect.ironskinPotion,
    sprite: _spritePath('ironskin_potion.png'),
  );

  //new cards for boss 2

  static final pocketSand = PlayerActionGameCard._(
    id: 'p10',
    effect: PlayerActionGameCardEffect.pocketSand,
    sprite: _spritePath('pocket_sand.png'),
  );

  static final weaken = PlayerActionGameCard._(
    id: 'p11',
    effect: PlayerActionGameCardEffect.weaken,
    sprite: _spritePath('weaken.png'),
  );

  static final allOutAttack = PlayerActionGameCard._(
    id: 'p12',
    effect: PlayerActionGameCardEffect.allOutAttack,
    sprite: _spritePath('all_out_attack.png'),
  );

  static final divineSmite = PlayerActionGameCard._(
    id: 'p13',
    effect: PlayerActionGameCardEffect.divineSmite,
    sprite: _spritePath('divine_smite.png'),
  );

  static final holyPrayers = PlayerActionGameCard._(
    id: 'p14',
    effect: PlayerActionGameCardEffect.holyPrayers,
    sprite: _spritePath('holy_prayers.png'),
  );

  static final massHealingWard = PlayerActionGameCard._(
    id: 'p15',
    effect: PlayerActionGameCardEffect.massHealingWard,
    sprite: _spritePath('mass_healing_ward.png'),
  );

  static final everbloom = PlayerActionGameCard._(
    id: 'p16',
    effect: PlayerActionGameCardEffect.everbloom,
    sprite: _spritePath('everbloom.png'),
  );

  static final bloodBlade = PlayerActionGameCard._(
    id: 'p17',
    effect: PlayerActionGameCardEffect.bloodBlade,
    sprite: _spritePath('blood_blade.png'),
  );

  static final darkDetermination = PlayerActionGameCard._(
    id: 'p18',
    effect: PlayerActionGameCardEffect.darkDetermination,
    sprite: _spritePath('dark_determination.png'),
  );

  static final finishingBlow = PlayerActionGameCard._(
    id: 'p19',
    effect: PlayerActionGameCardEffect.finishingBlow,
    sprite: _spritePath('finishing_blow.png'),
  );

  static final metallica = PlayerActionGameCard._(
    id: 'p20',
    effect: PlayerActionGameCardEffect.metallica,
    sprite: _spritePath('metallica.png'),
  );

  static final singularity = PlayerActionGameCard._(
    id: 'p21',
    effect: PlayerActionGameCardEffect.singularity,
    sprite: _spritePath('singularity.png'),
  );

  static final soulEater = PlayerActionGameCard._(
    id: 'p22',
    effect: PlayerActionGameCardEffect.soulEater,
    sprite: _spritePath('soul_eater.png'),
  );

  static final eldritchContract = PlayerActionGameCard._(
    id: 'p23',
    effect: PlayerActionGameCardEffect.eldritchContract,
    sprite: _spritePath('eldritch_contract.png'),
  );

  static final divineInterference = PlayerActionGameCard._(
    id: 'p24',
    effect: PlayerActionGameCardEffect.divineInterference,
    sprite: _spritePath('divine_interference.png'),
  );

  static final angelicRespite = PlayerActionGameCard._(
    id: 'p25',
    effect: PlayerActionGameCardEffect.angelicRespite,
    sprite: _spritePath('angelic_respite.png'),
  );

  static final entries1 = [
    knightlyRending,
    mistyDodge,
    fancyFootwork,
    boneChill,
    enhanceWeapon,
    healingPotion,
    haste,
    followUp,
    cyclone,
    ironskinPotion,
  ];

  static final entries2 = [
    knightlyRending,
    mistyDodge,
    fancyFootwork,
    boneChill,
    enhanceWeapon,
    healingPotion,
    haste,
    followUp,
    cyclone,
    ironskinPotion,
    pocketSand,
    weaken,
    allOutAttack,
    divineSmite,
    holyPrayers,
    massHealingWard,
    everbloom,
    bloodBlade,
  ];

  static final entries3 = [
    knightlyRending,
    mistyDodge,
    fancyFootwork,
    boneChill,
    enhanceWeapon,
    healingPotion,
    haste,
    followUp,
    cyclone,
    ironskinPotion,
    pocketSand,
    weaken,
    allOutAttack,
    divineSmite,
    holyPrayers,
    massHealingWard,
    everbloom,
    bloodBlade,
    darkDetermination,
    finishingBlow,
    metallica,
    singularity,
    soulEater,
    eldritchContract,
    divineInterference,
    angelicRespite,
  ];
}
