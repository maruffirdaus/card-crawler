import '../../../common/combat_effect/combat_effect.dart';
import '../../../common/combat_effect/combat_effect_type.dart';
import '../../models/boss_fight_data.dart';

class PlayerEquipmentCardEffect extends CombatEffect {
  PlayerEquipmentCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required Function(BossFightData) trigger,
  }) {
    super.triggerOnBossFight = trigger;
  }

  static final example = PlayerEquipmentCardEffect(
    id: 'example',
    name: 'Example',
    description: 'Example',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      //logic here
    },
  );
}
