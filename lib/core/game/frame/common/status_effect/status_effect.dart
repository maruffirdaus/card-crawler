import 'package:card_crawler/core/game/frame/boss_fight/models/boss_fight_data.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card_effect_type.dart';

import '../../core_game/models/core_game_data.dart';
import 'status_effect_type.dart';

class StatusEffect {
  StatusEffect({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.triggerOnCoreGame,
    this.triggerOnBossFight,
  });

  String id;
  String name;
  String description;
  StatusEffectType type;
  Function(CoreGameData)? triggerOnCoreGame;
  Function(BossFightData)? triggerOnBossFight;

  static final gorillaBossFight = StatusEffect(
    id: 'bf0',
    name: 'Gorilla Boss Fight',
    description:
        'You are fighting the Palemane Gorilla, it will deal 50% more damage when it\'s hp is 10 or lower',
    type: StatusEffectType.idle,
    triggerOnBossFight: (data) {
      if (data.gorillaRally == true &&
          data.bossPickedCard!.effect.type == BossFightGameCardEffectType.attack) {
        data.bossAttackMultiplier += data.bossAttackMultiplier;
        data.gorillaRally = false;
      }
      if (data.gorillaTactic == true) {
        data.gorillaTactic = false;
        data.bossBaseDefenseMultiplier = 1;
      }
      if (data.bossHealth >= 10) {
        data.bossBaseAttackMultiplier += 0.5;
      }
    },
  );

  static final alligatorBossFight = StatusEffect(
    id: 'bf1',
    name: 'Alligator Boss Fight',
    description:
    'You are fighting the Desert Alligator, it increases it\'s attacks the lower your defense is',
    type: StatusEffectType.idle,
    triggerOnBossFight: (data) {
      if (data.playerDefenseMultiplier > 1){
        data.bossAttackMultiplier += (data.playerDefenseMultiplier - 1) / 2;
      }
    },
  );

  static final spiritBossFight = StatusEffect(
    id: 'bf2',
    name: 'Spirit Boss Fight',
    description:
    'You are fighting the Spirit of the Mausoleum, it slowly lowers your healing capability.',
    type: StatusEffectType.idle,
    triggerOnBossFight: (data) {
      if (data.playerHealingMultiplier - 0.1 < 0){
        data.playerHealingMultiplier -= 0.1;
      }
    },
  );
}
