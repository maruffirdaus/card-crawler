import '../../../common/combat_effect/combat_effect.dart';
import '../../../common/combat_effect/combat_effect_type.dart';
import '../../models/boss_fight_data.dart';
import 'dart:math';

class PlayerActionCardEffect extends CombatEffect {
  PlayerActionCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required Function(BossFightData) trigger,
  }) {
    super.triggerOnBossFight = trigger;
  }

  static final knightlyRending = PlayerActionCardEffect(
    id: 'p0',
    name: 'Knightly Rending',
    description: 'Deals 8 damage.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(8));
    },
  );

  static final mistyDodge = PlayerActionCardEffect(
    id: 'p1',
    name: 'Misty Dodge',
    description: 'Dodges the opponent next move.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.bossActions.removeLast();
    },
  );

  static final fancyFootwork = PlayerActionCardEffect(
    id: 'p2',
    name: 'Fancy Footwork',
    description: 'Deals 6 damage, and take only half damage if the opponent attacks next turn.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(6));
      data.playerDefenseMultiplier -= 0.5;
    },
  );

  static final boneChill = PlayerActionCardEffect(
    id: 'p3',
    name: 'Bone Chill',
    description: 'Deals 6 damage, and prevent the opponent from healing if their next action is a heal.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(6));
      data.bossHealingMultiplier = 0;
    },
  );

  static final enhanceWeapon = PlayerActionCardEffect(
    id: 'p4',
    name: 'Enhance Weapon',
    description: 'Do 25% more damage for the rest of the fight.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.playerBaseAttackMultiplier += 0.2;
    },
  );

  static final healingPotion = PlayerActionCardEffect(
    id: 'p5',
    name: 'Healing Potion',
    description: 'Recover 8 health.',
    type: CombatEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(8);
    },
  );

  static final haste = PlayerActionCardEffect(
    id: 'p6',
    name: 'Haste',
    description: 'Take 2 more action before the boss takes theirs.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.bossTurnSkip +=2;
    },
  );

  static final followUp = PlayerActionCardEffect(
    id: 'p7',
    name: 'Follow Up',
    description: 'Deal 5 damage, but if it is not your first action this turn, deal 12 damage.',
    type: CombatEffectType.attack,
    trigger: (data) {
      if (data.bossSkipped){
        data.reduceBossHealth(data.playerDamageCalculator(12));
      } else {
        data.reduceBossHealth(data.playerDamageCalculator(5));
      }
    },
  );

  static final cyclone = PlayerActionCardEffect(
    id: 'p8',
    name: 'Cyclone',
    description: 'Deal 6 damage, refreshes your hand.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(6));
      data.refresh();
    },
  );

  static final ironskinPotion = PlayerActionCardEffect(
    id: 'p9',
    name: 'Ironskin Potion',
    description: 'Recover 6 health, and take half the damage if the opponent attacks next turn.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.increasePlayerHealth(6);
      data.playerDefenseMultiplier -= 0.5;
    },
  );

  //New moves for boss 2

  static final pocketSand = PlayerActionCardEffect(
    id: 'p10',
    name: 'Pocket Sand',
    description: 'Deal 4 damage, take another action',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(4));
      data.bossTurnSkip += 1;
    },
  );

  static final weaken = PlayerActionCardEffect(
    id: 'p11',
    name: 'Weaken',
    description: 'Reduce the opponent\'s attack and defense by 15% for the rest of the fight',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.bossBaseAttackMultiplier -= 0.15;
      data.bossBaseDefenseMultiplier -= 0.15;
    },
  );

  static final allOutAttack = PlayerActionCardEffect(
    id: 'p12',
    name: 'All Out Attack',
    description: 'Deal 18 damage, but you skip your next action, and take 50% more damage if the opponent attacks next turn',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(18));
      data.playerTurnSkip += 2;
      data.playerDefenseMultiplier -= 0.5;
    },
  );

  static final divineSmite = PlayerActionCardEffect(
    id: 'p13',
    name: 'Divine Smite',
    description: 'Deal between 5 to 15 damage.',
    type: CombatEffectType.attack,
    trigger: (data) {
      var rng = Random();
      data.reduceBossHealth(data.playerDamageCalculator(5 + rng.nextInt(11)));
    },
  );

  static final holyPrayers = PlayerActionCardEffect(
    id: 'p14',
    name: 'Holy Prayers',
    description: 'You heal 25% more for the rest of this fight.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.playerBaseHealingMultiplier += 0.25;
    },
  );

  static final massHealingWard = PlayerActionCardEffect(
    id: 'p15',
    name: 'Mass Healing Ward',
    description: 'Heal yourself for 15, but also heals the opponent for 5.',
    type: CombatEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(15);
      data.increaseBossHealth(5);
    },
  );

  static final everbloom = PlayerActionCardEffect(
    id: 'p15',
    name: 'Everbloom',
    description: 'Heal yourself for 4 health across 4 turns.',
    type: CombatEffectType.heal,
    trigger: (data) {
      data.everbloom = 4;
    },
  );

  //new moves for boss 3

  static final bloodBlade = PlayerActionCardEffect(
    id: 'p16',
    name: 'Blood Blade',
    description: 'Deal 13 damage to the enemy, take 6 damage to yourself.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(13));
      data.reducePlayerHealth(6);
    },
  );

  static final darkDetermination = PlayerActionCardEffect(
    id: 'p17',
    name: 'Dark Determination',
    description: 'You deal 2x more damage, and take 2x more damage until the rest of this fight.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.playerBaseAttackMultiplier += 1;
      data.playerBaseDefenseMultiplier += 1;
    },
  );

  static final finishingBlow = PlayerActionCardEffect(
    id: 'p18',
    name: 'Finishing Blow',
    description: 'Deal half of the enemy\'s missing health, unaffected by multipliers',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth((data.bossMaxHealth - data.bossHealth) ~/ 2);
    },
  );

  static final metallica = PlayerActionCardEffect(
    id: 'p19',
    name: 'Metallica',
    description: 'You become invulnerable to damage for 3 turns, but you take 3 damage each of those turn.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.metallica = 3;
    },
  );

  static final singularity = PlayerActionCardEffect(
    id: 'p20',
    name: 'Singularity',
    description: 'You can take 4 turns in a row, after those 4 turns your character dies.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.singularityOn = true;
      data.singularity = 3;
    },
  );

  static final soulEater = PlayerActionCardEffect(
    id: 'p21',
    name: 'Soul Eater',
    description: 'Deal 8 damage, heal half of the damage done from this attack.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reduceBossHealth(data.playerDamageCalculator(8));
      data.increasePlayerHealth(data.playerDamageCalculator(8));
    },
  );

  static final eldritchContract = PlayerActionCardEffect(
    id: 'p22',
    name: 'Eldritch Contract',
    description: 'Become invulnerable for 6 turns, after those 6 turns your character dies.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.playerBaseDefenseMultiplier = 0;
      data.eldritchContract = 7;
    },
  );

  static final divineInterference = PlayerActionCardEffect(
    id: 'p23',
    name: 'Divine Interference',
    description: 'Set your health and max health to 25.',
    type: CombatEffectType.heal,
    trigger: (data) {
      data.playerHealth = 25;
      data.playerMaxHealth = 25;
    },
  );

  static final angelicSlumber = PlayerActionCardEffect(
    id: 'p24',
    name: 'angelicSlumber',
    description: 'Heals you for 18, but skips your next turn.',
    type: CombatEffectType.heal,
    trigger: (data) {
      data.increasePlayerHealth(18);
      data.playerTurnSkip += 2;
    },
  );
}

