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
    id: 'p0',
    effect: PlayerActionGameCardEffect.knightlyRending,
    sprite: _spritePath('sword.png'),
  );

  static final mistyDodge = PlayerActionGameCard._(
    id: 'p1',
    effect: PlayerActionGameCardEffect.mistyDodge,
    sprite: _spritePath('ba24.png'),
  );

  static final fancyFootwork = PlayerActionGameCard._(
    id: 'p2',
    effect: PlayerActionGameCardEffect.fancyFootwork,
    sprite: _spritePath('rapier_2.png'),
  );

  static final boneChill = PlayerActionGameCard._(
    id: 'p3',
    effect: PlayerActionGameCardEffect.boneChill,
    sprite: _spritePath('ba22.png'),
  );

  static final enhanceWeapon = PlayerActionGameCard._(
    id: 'p4',
    effect: PlayerActionGameCardEffect.enhanceWeapon,
    sprite: _spritePath('ba20.png'),
  );

  static final healingPotion = PlayerActionGameCard._(
    id: 'p5',
    effect: PlayerActionGameCardEffect.healingPotion,
    sprite: _spritePath('c3.png'),
  );

  static final haste = PlayerActionGameCard._(
    id: 'p6',
    effect: PlayerActionGameCardEffect.haste,
    sprite: _spritePath('ba25.png'),
  );

  static final followUp = PlayerActionGameCard._(
    id: 'p7',
    effect: PlayerActionGameCardEffect.followUp,
    sprite: _spritePath('scimitar_2.png'),
  );

  static final cyclone = PlayerActionGameCard._(
    id: 'p8',
    effect: PlayerActionGameCardEffect.cyclone,
    sprite: _spritePath('sickle.png'),
  );

  static final ironskinPotion = PlayerActionGameCard._(
    id: 'p9',
    effect: PlayerActionGameCardEffect.ironskinPotion,
    sprite: _spritePath('c5.png'),
  );

  static final pocketSand = PlayerActionGameCard._(
    id: 'p10',
    effect: PlayerActionGameCardEffect.pocketSand,
    sprite: _spritePath('knife.png'),
  );

  static final weaken = PlayerActionGameCard._(
    id: 'p11',
    effect: PlayerActionGameCardEffect.weaken,
    sprite: _spritePath('ba15.png'),
  );

  static final allOutAttack = PlayerActionGameCard._(
    id: 'p12',
    effect: PlayerActionGameCardEffect.allOutAttack,
    sprite: _spritePath('greatsword_2.png'),
  );

  static final divineSmite = PlayerActionGameCard._(
    id: 'p13',
    effect: PlayerActionGameCardEffect.divineSmite,
    sprite: _spritePath('trident.png'),
  );

  static final holyPrayers = PlayerActionGameCard._(
    id: 'p14',
    effect: PlayerActionGameCardEffect.holyPrayers,
    sprite: _spritePath('ba8.png'),
  );

  static final massHealingWard = PlayerActionGameCard._(
    id: 'p15',
    effect: PlayerActionGameCardEffect.massHealingWard,
    sprite: _spritePath('ba9.png'),
  );

  static final everbloom = PlayerActionGameCard._(
    id: 'p16',
    effect: PlayerActionGameCardEffect.everbloom,
    sprite: _spritePath('ba7.png'),
  );

  static final bloodBlade = PlayerActionGameCard._(
    id: 'p17',
    effect: PlayerActionGameCardEffect.bloodBlade,
    sprite: _spritePath('katana_2.png'),
  );

  static final darkDetermination = PlayerActionGameCard._(
    id: 'p18',
    effect: PlayerActionGameCardEffect.darkDetermination,
    sprite: _spritePath('ba1.png'),
  );

  static final finishingBlow = PlayerActionGameCard._(
    id: 'p19',
    effect: PlayerActionGameCardEffect.finishingBlow,
    sprite: _spritePath('greatsword.png'),
  );

  static final metallica = PlayerActionGameCard._(
    id: 'p20',
    effect: PlayerActionGameCardEffect.metallica,
    sprite: _spritePath('ba0.png'),
  );

  static final singularity = PlayerActionGameCard._(
    id: 'p21',
    effect: PlayerActionGameCardEffect.singularity,
    sprite: _spritePath('ba11.png'),
  );

  static final soulEater = PlayerActionGameCard._(
    id: 'p22',
    effect: PlayerActionGameCardEffect.soulEater,
    sprite: _spritePath('scythe.png'),
  );

  static final eldritchContract = PlayerActionGameCard._(
    id: 'p23',
    effect: PlayerActionGameCardEffect.eldritchContract,
    sprite: _spritePath('ba3.png'),
  );

  static final divineInterference = PlayerActionGameCard._(
    id: 'p24',
    effect: PlayerActionGameCardEffect.divineInterference,
    sprite: _spritePath('ba6.png'),
  );

  static final angelicRespite = PlayerActionGameCard._(
    id: 'p25',
    effect: PlayerActionGameCardEffect.angelicRespite,
    sprite: _spritePath('ba5.png'),
  );

  static final entries = [
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
