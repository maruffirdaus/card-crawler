import '../../types/boss_fight_game_card_effect_type.dart';
import '../base/boss_fight_game_card_effect.dart';

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
      data.reducePlayerHealth(data.bossDamageCalculator(4));
    },
  );

  static final secondWind = BossActionGameCardEffect(
    id: 'g1',
    name: 'SecondWind',
    description: 'Heals 5 damage.',
    type: BossFightGameCardEffectType.heal,
    trigger: (data) {
      data.increaseBossHealth((3).toInt());
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
      data.reducePlayerHealth(data.bossDamageCalculator(2));
      data.playerTurnSkip += 2;
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
}
