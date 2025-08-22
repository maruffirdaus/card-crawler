import '../../core_game/models/core_game_data.dart';
import 'combat_effect_type.dart';

class CombatEffect {
  CombatEffect({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.trigger,
  });

  String id;
  String name;
  String description;
  CombatEffectType type;
  Function(CoreGameData) trigger;

  static final example = CombatEffect(
    id: 'example',
    name: 'Example',
    description: 'Example',
    type: CombatEffectType.onUse,
    trigger: (data) {
      //do something
    },
  );
}
