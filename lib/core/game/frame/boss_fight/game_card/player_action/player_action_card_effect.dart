import '../../../common/combat_effect/combat_effect.dart';
import '../../../common/combat_effect/combat_effect_type.dart';

class PlayerActionCardEffect extends CombatEffect {
  PlayerActionCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final example = PlayerActionCardEffect(
    id: 'example',
    name: 'Example',
    description: 'Example',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      //logic here
    },
  );
}
