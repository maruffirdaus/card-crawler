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

  @override
  BossFightGameCard copy() =>
      BossActionGameCard._(id: id, effect: effect, sprite: sprite);

  static String _spritePath(String fileName) =>
      'assets/card_sprites/boss_action/$fileName';

  // Gorilla
  static final slam = BossActionGameCard._(
    id: 'g0',
    effect: BossActionGameCardEffect.slam,
    sprite: _spritePath('slam.png'),
  );

  static final secondWind = BossActionGameCard._(
    id: 'g1',
    effect: BossActionGameCardEffect.secondWind,
    sprite: _spritePath('second_wind.png'),
  );

  static final rally = BossActionGameCard._(
    id: 'g2',
    effect: BossActionGameCardEffect.rally,
    sprite: _spritePath('rally.png'),
  );

  static final freezingBreath = BossActionGameCard._(
    id: 'g3',
    effect: BossActionGameCardEffect.freezingBreath,
    sprite: _spritePath('freezing_breath.png'),
  );

  static final recklessAttack = BossActionGameCard._(
    id: 'g4',
    effect: BossActionGameCardEffect.recklessAttack,
    sprite: _spritePath('reckless_attack.png'),
  );

  static final intimidationTactic = BossActionGameCard._(
    id: 'g5',
    effect: BossActionGameCardEffect.intimidationTactic,
    sprite: _spritePath('intimidation_tactic.png'),
  );

  // Alligator
  static final meltingChomp = BossActionGameCard._(
    id: 'g6',
    effect: BossActionGameCardEffect.meltingChomp,
    sprite: _spritePath('melting_chomp.png'),
  );

  static final acidBelch = BossActionGameCard._(
    id: 'g7',
    effect: BossActionGameCardEffect.acidBelch,
    sprite: _spritePath('acid_belch.png'),
  );

  static final metalScale = BossActionGameCard._(
    id: 'g8',
    effect: BossActionGameCardEffect.metalScale,
    sprite: _spritePath('metal_scale.png'),
  );

  static final photosynthesis = BossActionGameCard._(
    id: 'g9',
    effect: BossActionGameCardEffect.photosynthesis,
    sprite: _spritePath('photosynthesis.png'),
  );

  static final tailSwipe = BossActionGameCard._(
    id: 'g10',
    effect: BossActionGameCardEffect.tailSwipe,
    sprite: _spritePath('tail_swipe.png'),
  );

  static final relentlessBites = BossActionGameCard._(
    id: 'g11',
    effect: BossActionGameCardEffect.relentlessBites,
    sprite: _spritePath('relentless_bites.png'),
  );

  static final toxicBreath = BossActionGameCard._(
    id: 'g12',
    effect: BossActionGameCardEffect.toxicBreath,
    sprite: _spritePath('toxic_breath.png'),
  );

  // Spirit
  static final cursedBells = BossActionGameCard._(
    id: 'g13',
    effect: BossActionGameCardEffect.cursedBells,
    sprite: _spritePath('cursed_bells.png'),
  );

  static final lifeDrain = BossActionGameCard._(
    id: 'g14',
    effect: BossActionGameCardEffect.lifeDrain,
    sprite: _spritePath('life_drain.png'),
  );

  static final phantomAttack = BossActionGameCard._(
    id: 'g15',
    effect: BossActionGameCardEffect.phantomAttack,
    sprite: _spritePath('phantom_attack.png'),
  );

  static final hauntingDreams = BossActionGameCard._(
    id: 'g16',
    effect: BossActionGameCardEffect.hauntingDreams,
    sprite: _spritePath('haunting_dreams.png'),
  );

  static final poisonousMiasma = BossActionGameCard._(
    id: 'g17',
    effect: BossActionGameCardEffect.poisonousMiasma,
    sprite: _spritePath('poisonous_miasma.png'),
  );

  static final bodyPossession = BossActionGameCard._(
    id: 'g18',
    effect: BossActionGameCardEffect.bodyPossession,
    sprite: _spritePath('body_possession.png'),
  );

  static final necroticRebirth = BossActionGameCard._(
    id: 'g19',
    effect: BossActionGameCardEffect.necroticRebirth,
    sprite: _spritePath('necrotic_rebirth.png'),
  );

  static final ectoplasmSlam = BossActionGameCard._(
    id: 'g20',
    effect: BossActionGameCardEffect.ectoplasmSlam,
    sprite: _spritePath('ectoplasm_slam.png'),
  );

  // Lukas
  static final divineSmite = BossActionGameCard._(
    id: 'g21',
    effect: BossActionGameCardEffect.divineSmite,
    sprite: _spritePath('divine_smite.png'),
  );

  static final massHealingWard = BossActionGameCard._(
    id: 'g22',
    effect: BossActionGameCardEffect.massHealingWard,
    sprite: _spritePath('mass_healing_ward.png'),
  );

  static final finishingBlow = BossActionGameCard._(
    id: 'g23',
    effect: BossActionGameCardEffect.finishingBlow,
    sprite: _spritePath('finishing_blow.png'),
  );

  static final angelicRespite = BossActionGameCard._(
    id: 'g24',
    effect: BossActionGameCardEffect.angelicRespite,
    sprite: _spritePath('angelic_respite.png'),
  );

  static final quickAttack = BossActionGameCard._(
    id: 'g25',
    effect: BossActionGameCardEffect.quickAttack,
    sprite: _spritePath('quick_attack.png'),
  );

  static final mistyFootwork = BossActionGameCard._(
    id: 'g26',
    effect: BossActionGameCardEffect.mistyFootwork,
    sprite: _spritePath('misty_footwork.png'),
  );

  static final enhanceWeapon = BossActionGameCard._(
    id: 'g27',
    effect: BossActionGameCardEffect.enhanceWeapon,
    sprite: _spritePath('enhance_weapon.png'),
  );

  static final soulEater = BossActionGameCard._(
    id: 'g28',
    effect: BossActionGameCardEffect.soulEater,
    sprite: _spritePath('soul_eater.png'),
  );

  static final allOutAttack = BossActionGameCard._(
    id: 'g29',
    effect: BossActionGameCardEffect.allOutAttack,
    sprite: _spritePath('all_out_attack.png'),
  );

  static final cyclone = BossActionGameCard._(
    id: 'g30',
    effect: BossActionGameCardEffect.cyclone,
    sprite: _spritePath('cyclone.png'),
  );

  static final riposte = BossActionGameCard._(
    id: 'g31',
    effect: BossActionGameCardEffect.riposte,
    sprite: _spritePath('riposte.png'),
  );

  static final amomongoEnemyEntries = [
    slam,
    secondWind,
    rally,
    freezingBreath,
    recklessAttack,
    intimidationTactic,
  ];

  static final buwayaEnemyEntries = [
    meltingChomp,
    acidBelch,
    metalScale,
    photosynthesis,
    tailSwipe,
    relentlessBites,
    toxicBreath,
  ];

  static final spiritEnemyEntries = [
    cursedBells,
    lifeDrain,
    phantomAttack,
    hauntingDreams,
    poisonousMiasma,
    bodyPossession,
    necroticRebirth,
    ectoplasmSlam,
  ];

  static final lukasEnemyEntries = [
    divineSmite,
    massHealingWard,
    finishingBlow,
    angelicRespite,
    quickAttack,
    mistyFootwork,
    enhanceWeapon,
    soulEater,
    allOutAttack,
    cyclone,
    riposte,
  ];
}
