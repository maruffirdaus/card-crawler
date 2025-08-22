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

  static final example = BossActionCardEffect(
    id: 'example',
    name: 'Example',
    description: 'Example',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      //logic here
    },
  );
}
