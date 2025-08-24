import 'dart:math';

import '../base/boss_fight_game_card_effect_type.dart';
import '../base/boss_fight_game_card_effect.dart';

class PlayerActionGameCardEffect extends BossFightGameCardEffect {
  PlayerActionGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final knightlyRending = PlayerActionGameCardEffect(
    id: 'p0',
    name: 'Knightly Rending',
    description: 'Deals 8 damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(8));
    },
  );

  static final mistyDodge = PlayerActionGameCardEffect(
    id: 'p1',
    name: 'Misty Dodge',
    description: 'Dodges the opponent next move, making your opponent skips his next move.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.bossActions.removeLast();
    },
  );

  static final fancyFootwork = PlayerActionGameCardEffect(
    id: 'p2',
    name: 'Fancy Footwork',
    description:
        'Deals 6 damage, and take only half damage if the opponent attacks next turn.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(6));
      data.playerDefenseMultiplier -= 0.5;
    },
  );

  static final boneChill = PlayerActionGameCardEffect(
    id: 'p3',
    name: 'Bone Chill',
    description:
        'Deals 6 damage, and prevent the opponent from healing if their next action is a heal.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(6));
      data.bossHealingMultiplier = 0;
    },
  );

  static final enhanceWeapon = PlayerActionGameCardEffect(
    id: 'p4',
    name: 'Enhance Weapon',
    description: 'Do 25% more damage for the rest of the fight.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.playerBaseAttackMultiplier += 0.2;
    },
  );

  static final healingPotion = PlayerActionGameCardEffect(
    id: 'p5',
    name: 'Healing Potion',
    description: 'Recover 8 health.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(8);
    },
  );

  static final haste = PlayerActionGameCardEffect(
    id: 'p6',
    name: 'Haste',
    description: 'Take 2 more action before the boss takes theirs.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.bossTurnSkip += 2;
      data.bossSkipped = true;
    },
  );

  static final followUp = PlayerActionGameCardEffect(
    id: 'p7',
    name: 'Follow Up',
    description:
        'Deal 5 damage, but if it is not your first action this turn, deal 12 damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      if (data.bossSkipped) {
        data.reduceBossHealth(data.playerDamageCalculator(12));
      } else {
        data.reduceBossHealth(data.playerDamageCalculator(5));
      }
    },
  );

  static final cyclone = PlayerActionGameCardEffect(
    id: 'p8',
    name: 'Cyclone',
    description: 'Deal 6 damage, renews your hand.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(6));
      data.refresh();
    },
  );

  static final ironskinPotion = PlayerActionGameCardEffect(
    id: 'p9',
    name: 'Ironskin Potion',
    description:
        'Recover 6 health, and take half the damage if the opponent attacks next turn.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.increasePlayerHealth(6);
      data.playerDefenseMultiplier -= 0.5;
    },
  );

  //New moves for boss 2

  static final pocketSand = PlayerActionGameCardEffect(
    id: 'p10',
    name: 'Pocket Sand',
    description: 'Deal 4 damage, take another action',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(4));
      data.bossTurnSkip += 1;
      data.bossSkipped = true;
    },
  );

  static final weaken = PlayerActionGameCardEffect(
    id: 'p11',
    name: 'Weaken',
    description:
        'Reduce the opponent\'s attack and defense by 15% for the rest of the fight',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.bossBaseAttackMultiplier -= 0.15;
      data.bossBaseDefenseMultiplier += 0.15;
    },
  );

  static final allOutAttack = PlayerActionGameCardEffect(
    id: 'p12',
    name: 'All Out Attack',
    description:
        'Deal 18 damage, but you skip your next action, and take 50% more damage if the opponent attacks next turn',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(18));
      data.playerTurnSkip += 2;
      data.playerDefenseMultiplier -= 0.5;
      data.playerSkipped = true;
    },
  );

  static final divineSmite = PlayerActionGameCardEffect(
    id: 'p13',
    name: 'Divine Smite',
    description: 'Deal between 5 to 15 damage.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      var rng = Random();
      data.reduceBossHealth(data.playerDamageCalculator(5 + rng.nextInt(11)));
    },
  );

  static final holyPrayers = PlayerActionGameCardEffect(
    id: 'p14',
    name: 'Holy Prayers',
    description: 'You heal 25% more for the rest of this fight.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.playerBaseHealingMultiplier += 0.25;
    },
  );

  static final massHealingWard = PlayerActionGameCardEffect(
    id: 'p15',
    name: 'Mass Healing Ward',
    description: 'Heal yourself for 15, but also heals the opponent for 5.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(15);
      data.increaseBossHealth(5);
    },
  );

  static final everbloom = PlayerActionGameCardEffect(
    id: 'p16',
    name: 'Everbloom',
    description: 'Heal yourself for 4 health at the end of the turn across 4 turns.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.everbloom = 4;
    },
  );

  //new moves for boss 3

  static final bloodBlade = PlayerActionGameCardEffect(
    id: 'p17',
    name: 'Blood Blade',
    description: 'Deal 13 damage to the enemy, take 6 damage to yourself.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(13));
      data.reducePlayerHealth(6);
    },
  );

  static final darkDetermination = PlayerActionGameCardEffect(
    id: 'p18',
    name: 'Dark Determination',
    description:
        'You deal 2x more damage, and take 2x more damage until the rest of this fight.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.playerBaseAttackMultiplier += 1;
      data.playerBaseDefenseMultiplier += 1;
    },
  );

  static final finishingBlow = PlayerActionGameCardEffect(
    id: 'p19',
    name: 'Finishing Blow',
    description:
        'Deal half of the enemy\'s missing health, unaffected by multipliers',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth((data.bossMaxHealth - data.bossHealth) ~/ 2);
    },
  );

  static final metallica = PlayerActionGameCardEffect(
    id: 'p20',
    name: 'Metallica',
    description:
        'You become invulnerable to damage for 3 turns, but you take 3 damage each of those turn.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.metallica = 3;
    },
  );

  static final singularity = PlayerActionGameCardEffect(
    id: 'p21',
    name: 'Singularity',
    description:
        'You can take 4 turns in a row, after those 4 turns your character dies.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.singularityOn = true;
      data.singularity = 4;
      data.bossTurnSkip += 4;
      data.bossSkipped;
    },
  );

  static final soulEater = PlayerActionGameCardEffect(
    id: 'p22',
    name: 'Soul Eater',
    description: 'Deal 8 damage, heal half of the damage done from this attack.',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(8));
      data.increasePlayerHealth(data.playerDamageCalculator(8));
    },
  );

  static final eldritchContract = PlayerActionGameCardEffect(
    id: 'p23',
    name: 'Eldritch Contract',
    description:
        'Become invulnerable for 6 turns, after those 6 turns your character dies.',
    type: BossFightGameCardEffectType.buff,
    trigger: (data) {
      data.playerBaseDefenseMultiplier = 0;
      data.eldritchContract = 6;
      data.eldritchContractOn = true;
    },
  );

  static final divineInterference = PlayerActionGameCardEffect(
    id: 'p24',
    name: 'Divine Interference',
    description: 'Set your health and max health to 25.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.playerHealth = 25;
      data.playerMaxHealth = 25;
    },
  );

  static final angelicRespite = PlayerActionGameCardEffect(
    id: 'p25',
    name: 'Angelic Respite',
    description: 'Heals you for 18, but skips your next turn.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(18);
      data.playerTurnSkip += 2;
      data.playerSkipped = true;
    },
  );
}
