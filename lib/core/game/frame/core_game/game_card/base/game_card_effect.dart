import 'package:card_crawler/core/game/frame/core_game/game_card/base/game_card_effect_type.dart';

import '../../models/core_game_data.dart';

class GameCardEffect {
  GameCardEffect({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.trigger,
  });

  String id;
  String name;
  String description;
  GameCardEffectType type;
  Function(CoreGameData) trigger;
}