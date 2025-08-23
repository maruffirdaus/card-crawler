import 'package:card_crawler/core/game/frame/boss_fight/models/boss_fight_data.dart';

import '../../../common/combat_effect/combat_effect.dart';
import '../../../common/combat_effect/combat_effect_type.dart';

class BossActionCardEffect extends CombatEffect {
  BossActionCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required Function(BossFightData) trigger,
  }) {
    super.triggerOnBossFight = trigger;
  }

  static final slam = BossActionCardEffect(
    id: 'g0',
    name: 'Slam',
    description: 'Deals 8 damage.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(4));
    },
  );

  static final secondWind = BossActionCardEffect(
    id: 'g1',
    name: 'SecondWind',
    description: 'Heals 5 damage.',
    type: CombatEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth((3).toInt());
    },
  );

  static final rally = BossActionCardEffect(
    id: 'g2',
    name: 'Rally',
    description: 'Palemane Gorilla\'s next attack will deal double damage.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.gorillaRally = true;
    },
  );

  static final freezingBreath = BossActionCardEffect(
    id: 'g3',
    name: 'Freezing Breath',
    description: 'Deal 4 damage, also skips the player\'s turn',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(2));
      data.playerTurnSkip += 2;
    },
  );

  static final recklessAttack = BossActionCardEffect(
    id: 'g4',
    name: 'Reckless Attack',
    description: 'Deal 10 damage to the player, and the boss takes 5 damage.',
    type: CombatEffectType.attack,
    trigger: (data) {
      data.reducePlayerHealth(data.bossDamageCalculator(6));
      data.reduceBossHealth(3);
    },
  );

  static final intimidationTactic = BossActionCardEffect(
    id: 'g5',
    name: 'Intimidation Tactic',
    description: 'If the player attacks next turn, it would deal 0 damage.',
    type: CombatEffectType.buff,
    trigger: (data) {
      data.bossBaseDefenseMultiplier = 0;
      data.gorillaTactic = true;
    },
  );
}
