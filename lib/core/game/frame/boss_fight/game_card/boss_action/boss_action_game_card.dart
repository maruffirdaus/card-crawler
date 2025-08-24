import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/boss_action/boss_action_game_card_effect.dart';

class BossActionGameCard extends BossFightGameCard {
  BossActionGameCard._({
    required super.id,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/boss_action_32.png',
         iconSmall: 'assets/card_icons/boss_action_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/boss_action/$fileName';

  // Gorilla
  static final slam = BossActionGameCard._(
    id: 'g0',
    effect: BossActionGameCardEffect.slam,
    sprite: _spritePath('ba16.png'),
  );

  static final secondWind = BossActionGameCard._(
    id: 'g1',
    effect: BossActionGameCardEffect.secondWind,
    sprite: _spritePath('ba22.png'),
  );

  static final rally = BossActionGameCard._(
    id: 'g2',
    effect: BossActionGameCardEffect.rally,
    sprite: _spritePath('ba17.png'),
  );

  static final freezingBreath = BossActionGameCard._(
    id: 'g3',
    effect: BossActionGameCardEffect.freezingBreath,
    sprite: _spritePath('ba24.png'),
  );

  static final recklessAttack = BossActionGameCard._(
    id: 'g4',
    effect: BossActionGameCardEffect.recklessAttack,
    sprite: _spritePath('ba3.png'),
  );

  static final intimidationTactic = BossActionGameCard._(
    id: 'g5',
    effect: BossActionGameCardEffect.intimidationTactic,
    sprite: _spritePath('ba26.png'),
  );

// Alligator
  static final meltingChomp = BossActionGameCard._(
    id: 'g6',
    effect: BossActionGameCardEffect.meltingChomp,
    sprite: _spritePath('ba23.png'),
  );

  static final acidBelch = BossActionGameCard._(
    id: 'g7',
    effect: BossActionGameCardEffect.acidBelch,
    sprite: _spritePath('ba22.png'),
  );

  static final metalScale = BossActionGameCard._(
    id: 'g8',
    effect: BossActionGameCardEffect.metalScale,
    sprite: _spritePath('ba14.png'),
  );

  static final photosynthesis = BossActionGameCard._(
    id: 'g9',
    effect: BossActionGameCardEffect.photosynthesis,
    sprite: _spritePath('ba19.png'),
  );

  static final tailSwipe = BossActionGameCard._(
    id: 'g10',
    effect: BossActionGameCardEffect.tailSwipe,
    sprite: _spritePath('ba17.png'),
  );

  static final relentlessBites = BossActionGameCard._(
    id: 'g11',
    effect: BossActionGameCardEffect.relentlessBites,
    sprite: _spritePath('ba7.png'),
  );

  static final toxicBreath = BossActionGameCard._(
    id: 'g12',
    effect: BossActionGameCardEffect.toxicBreath,
    sprite: _spritePath('ba8.png'),
  );

// Spirit
  static final cursedBells = BossActionGameCard._(
    id: 'g13',
    effect: BossActionGameCardEffect.cursedBells,
    sprite: _spritePath('ba1.png'),
  );

  static final lifeDrain = BossActionGameCard._(
    id: 'g14',
    effect: BossActionGameCardEffect.lifeDrain,
    sprite: _spritePath('ba3.png'),
  );

  static final phantomAttack = BossActionGameCard._(
    id: 'g15',
    effect: BossActionGameCardEffect.phantomAttack,
    sprite: _spritePath('ba0.png'),
  );

  static final hauntingDreams = BossActionGameCard._(
    id: 'g16',
    effect: BossActionGameCardEffect.hauntingDreams,
    sprite: _spritePath('ba12.png'),
  );

  static final poisonousMiasma = BossActionGameCard._(
    id: 'g17',
    effect: BossActionGameCardEffect.poisonousMiasma,
    sprite: _spritePath('ba7.png'),
  );

  static final bodyPossession = BossActionGameCard._(
    id: 'g18',
    effect: BossActionGameCardEffect.bodyPossession,
    sprite: _spritePath('ba13.png'),
  );

  static final necroticRebirth = BossActionGameCard._(
    id: 'g19',
    effect: BossActionGameCardEffect.necroticRebirth,
    sprite: _spritePath('ba8.png'),
  );

  static final ectoplasmSlam = BossActionGameCard._(
    id: 'g20',
    effect: BossActionGameCardEffect.ectoplasmSlam,
    sprite: _spritePath('ba2.png'),
  );

// Lukas
  static final divineSmite = BossActionGameCard._(
    id: 'g21',
    effect: BossActionGameCardEffect.divineSmite,
    sprite: _spritePath('trident.png'),
  );

  static final massHealingWard = BossActionGameCard._(
    id: 'g22',
    effect: BossActionGameCardEffect.massHealingWard,
    sprite: _spritePath('ba9.png'),
  );

  static final finishingBlow = BossActionGameCard._(
    id: 'g23',
    effect: BossActionGameCardEffect.finishingBlow,
    sprite: _spritePath('greatsword.png'),
  );

  static final angelicRespite = BossActionGameCard._(
    id: 'g24',
    effect: BossActionGameCardEffect.angelicRespite,
    sprite: _spritePath('ba5.png'),
  );

  static final quickAttack = BossActionGameCard._(
    id: 'g25',
    effect: BossActionGameCardEffect.quickAttack,
    sprite: _spritePath('rapier_2.png'),
  );

  static final mistyFootwork = BossActionGameCard._(
    id: 'g26',
    effect: BossActionGameCardEffect.mistyFootwork,
    sprite: _spritePath('ba10.png'),
  );

  static final enhanceWeapon = BossActionGameCard._(
    id: 'g27',
    effect: BossActionGameCardEffect.enhanceWeapon,
    sprite: _spritePath('ba20.png'),
  );

  static final soulEater = BossActionGameCard._(
    id: 'g28',
    effect: BossActionGameCardEffect.soulEater,
    sprite: _spritePath('scythe.png'),
  );

  static final allOutAttack = BossActionGameCard._(
    id: 'g29',
    effect: BossActionGameCardEffect.allOutAttack,
    sprite: _spritePath('greatsword_2.png'),
  );

  static final cyclone = BossActionGameCard._(
    id: 'g30',
    effect: BossActionGameCardEffect.cyclone,
    sprite: _spritePath('sickle.png'),
  );

  static final riposte = BossActionGameCard._(
    id: 'g31',
    effect: BossActionGameCardEffect.riposte,
    sprite: _spritePath('katana_2.png'),
  );


}
