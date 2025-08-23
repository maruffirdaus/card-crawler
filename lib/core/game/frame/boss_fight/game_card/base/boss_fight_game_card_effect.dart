import 'package:card_crawler/core/game/frame/boss_fight/types/boss_fight_game_card_effect_type.dart';

import '../../models/boss_fight_data.dart';

class BossFightGameCardEffect {
  BossFightGameCardEffect({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.trigger,
  });

  String id;
  String name;
  String description;
  BossFightGameCardEffectType type;
  Function(BossFightData) trigger;
}