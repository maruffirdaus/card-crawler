import '../base/boss_fight_game_card_effect_type.dart';
import '../base/boss_fight_game_card_effect.dart';
import 'dart:math';

class BossActionGameCardEffect extends BossFightGameCardEffect {
  BossActionGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final slam = BossActionGameCardEffect(
    id: 'g0',
    name: 'Slam',
    description: 'Deals 8 damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(8));
    },
  );

  static final secondWind = BossActionGameCardEffect(
    id: 'g1',
    name: 'SecondWind',
    description: 'Heals 5 damage.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth(5);
    },
  );

  static final rally = BossActionGameCardEffect(
    id: 'g2',
    name: 'Rally',
    description: 'Palemane Gorilla\'s next attack will deal double damage.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.gorillaRally = true;
    },
  );

  static final freezingBreath = BossActionGameCardEffect(
    id: 'g3',
    name: 'Freezing Breath',
    description: 'Deal 4 damage, also skips the player\'s turn',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(4));
      data.playerTurnSkip += 2;
      data.playerSkipped = true;
    },
  );

  static final recklessAttack = BossActionGameCardEffect(
    id: 'g4',
    name: 'Reckless Attack',
    description: 'Deal 10 damage to the player, and the boss takes 5 damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(6));
      data.reduceBossHealth(3);
    },
  );

  static final intimidationTactic = BossActionGameCardEffect(
    id: 'g5',
    name: 'Intimidation Tactic',
    description: 'If the player attacks next turn, it would deal 0 damage.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.bossBaseDefenseMultiplier = 0;
      data.gorillaTactic = true;
    },
  );

  //boss moves for the alligator

  static final meltingChomp = BossActionGameCardEffect(
    id: 'g6',
    name: 'Melting Chomp',
    description:
        'Deals 8 damage, and reduce the base defense of the player by 10%.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(8));
      data.playerBaseDefenseMultiplier += 0.1;
    },
  );

  static final acidBelch = BossActionGameCardEffect(
    id: 'g7',
    name: 'Acid Belch',
    description:
        'Deals 6 damage, and reduce the base defense of the player by 20%.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(6));
      data.playerBaseDefenseMultiplier += 0.2;
    },
  );

  static final metalScale = BossActionGameCardEffect(
    id: 'g8',
    name: 'Metal Scale',
    description: 'Permanently increase the boss\'s defense by 10%.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      if (data.bossBaseDefenseMultiplier - 0.2 <= 0.1) {
        data.bossBaseDefenseMultiplier -= 0.2;
      }
    },
  );

  static final photosynthesis = BossActionGameCardEffect(
    id: 'g9',
    name: 'Photosynthesis',
    description: 'The boss heals itself for 7 damage.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth(7);
    },
  );

  static final tailSwipe = BossActionGameCardEffect(
    id: 'g10',
    name: 'Tail Swipe',
    description: 'Deal 5 damage, also skips the player\'s turn',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(5));
      data.playerTurnSkip += 2;
      data.playerSkipped = true;
    },
  );

  static final relentlessBites = BossActionGameCardEffect(
    id: 'g11',
    name: 'Relentless Bites',
    description: 'Attacks 1-3 times, dealing 5 damage each.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      var rng = Random();
      data.reduceBossHealth(
        data.playerDamageCalculator(5 + (5 * rng.nextInt(3))),
      );
    },
  );

  static final toxicBreath = BossActionGameCardEffect(
    id: 'g12',
    name: 'Toxic Breath',
    description: 'Deal 4 damage over 3 turns at the end of your turn.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.poison += 3;
    },
  );

  //boss moves for the spirit
  static final cursedBells = BossActionGameCardEffect(
    id: 'g13',
    name: 'Cursed Bells',
    description: 'Deal 8 damage, your next attack will do 10% less damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(8));
      data.cursedCount += 2;
      data.cursedModifier += 0.1;
    },
  );

  static final lifeDrain = BossActionGameCardEffect(
    id: 'g14',
    name: 'Life Drain',
    description: 'Deal 6 damage, heals the boss for 3 health.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(6));
      data.increaseBossHealth(3);
    },
  );

  static final phantomAttack = BossActionGameCardEffect(
    id: 'g15',
    name: 'Phantom Attack',
    description:
        'Vanishes for a turn, being immune to damage, and then deal 5 damage next turn.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.phantom += 2;
    },
  );

  static final hauntingDreams = BossActionGameCardEffect(
    id: 'g16',
    name: 'Haunting Dreams',
    description: 'Envelopes you with nightmares, skipping your turn twice.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.playerTurnSkip += 3;
      data.playerSkipped = true;
    },
  );

  static final poisonousMiasma = BossActionGameCardEffect(
    id: 'g17',
    name: 'Poisonous Miasma',
    description: 'Deal 4 damage over 4 turns at the end of your turn.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.poison += 4;
    },
  );

  static final bodyPossession = BossActionGameCardEffect(
    id: 'g18',
    name: 'Body Possession',
    description:
        'The spirit possesses you, healing itself for 6 and stunning you.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth(6);
      data.playerTurnSkip += 2;
      data.playerSkipped = true;
    },
  );

  static final necroticRebirth = BossActionGameCardEffect(
    id: 'g19',
    name: 'Necrotic Rebirth',
    description:
        'Recovers 8 HP, and removing any debuff on the boss\'s attacks and defense.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth(8);
      data.bossBaseDefenseMultiplier = 1;
      data.bossBaseAttackMultiplier = 1;
    },
  );

  static final ectoplasmSlam = BossActionGameCardEffect(
    id: 'g20',
    name: 'Ectoplasm Slam',
    description:
        'Dealing 10 damage, and your next 2 attacks will do 10% less damage',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.cursedCount += 3;
      data.cursedModifier += 0.1;
    },
  );

  //moves for lukas boss fight
  static final divineSmite = BossActionGameCardEffect(
    id: 'g21',
    name: 'Divine Smite',
    description: 'Deal between 5 to 15 damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      var rng = Random();
      data.reducePlayerHealth(data.bossDamageCalculator(5 + rng.nextInt(11)));
    },
  );

  static final massHealingWard = BossActionGameCardEffect(
    id: 'g22',
    name: 'Mass Healing Ward',
    description: 'Heals for 15, but also heals you for 5.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(5);
      data.increaseBossHealth(15);
    },
  );

  static final finishingBlow = BossActionGameCardEffect(
    id: 'g23',
    name: 'Finishing Blow',
    description: 'Deal half of your missing health, unaffected by multipliers',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth((data.playerMaxHealth - data.playerHealth) ~/ 2);
    },
  );

  static final angelicRespite = BossActionGameCardEffect(
    id: 'g24',
    name: 'Angelic Respite',
    description: 'Heals for 18, but the boss skips it\'s next turn.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth(18);
      data.bossTurnSkip += 2;
      data.bossSkipped = true;
    },
  );

  static final quickAttack = BossActionGameCardEffect(
    id: 'g25',
    name: 'Quick Attack',
    description: 'Deal 6 damage, take another action',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(4));
      data.playerTurnSkip += 2;
      data.playerSkipped = true;
    },
  );

  static final mistyFootwork = BossActionGameCardEffect(
    id: 'g26',
    name: 'Misty Footwork',
    description:
        'Dodges if your next action is an attack, and deal 5 damage next turn.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.phantom += 2;
    },
  );

  static final enhanceWeapon = BossActionGameCardEffect(
    id: 'g27',
    name: 'Enhance Weapon',
    description: 'Do 20% more damage for the rest of the fight.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.bossBaseAttackMultiplier += 0.2;
    },
  );

  static final soulEater = BossActionGameCardEffect(
    id: 'g28',
    name: 'Soul Eater',
    description:
        'Deal 8 damage, heal half of the damage done from this attack.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(8));
      data.increaseBossHealth(data.bossDamageCalculator(8));
    },
  );

  static final allOutAttack = BossActionGameCardEffect(
    id: 'g29',
    name: 'All Out Attack',
    description: 'Deal 18 damage, but the boss skips it\'s next action.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(18));
      data.bossTurnSkip += 2;
      data.playerSkipped = true;
    },
  );

  static final cyclone = BossActionGameCardEffect(
    id: 'g30',
    name: 'Cyclone',
    description: 'Deals 8 damage, and renews the player\'s hand.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(8));
      data.renew();
    },
  );

  static final riposte = BossActionGameCardEffect(
    id: 'g31',
    name: 'Riposte',
    description:
        'Deals 8 damage, if the players last move was an attack deals double damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      if (data.playerPickedCard!.effect.type ==
          BossFightGameCardEffectType.attack) {
        data.reducePlayerHealth(data.bossDamageCalculator(16));
      } else {
        data.reducePlayerHealth(data.bossDamageCalculator(8));
      }
    },
  );
}
