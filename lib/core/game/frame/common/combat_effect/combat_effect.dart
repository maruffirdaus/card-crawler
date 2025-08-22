import 'package:card_crawler/core/game/frame/boss_fight/models/boss_fight_data.dart';

import '../../core_game/models/core_game_data.dart';
import 'combat_effect_type.dart';

class CombatEffect {
  CombatEffect({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.triggerOnCoreGame,
    this.triggerOnBossFight
  });

  String id;
  String name;
  String description;
  CombatEffectType type;
  Function(CoreGameData)? triggerOnCoreGame;
  Function(BossFightData)? triggerOnBossFight;

  static final example = CombatEffect(
    id: 'example',
    name: 'Example',
    description: 'Example',
    type: CombatEffectType.onUse,
    triggerOnCoreGame: (data) {
      //do something
    },
  );
}
