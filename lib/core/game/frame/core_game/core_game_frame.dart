import 'package:card_crawler/core/game/frame/core_game/models/core_game_data.dart';
import 'package:card_crawler/core/game/frame/base/game_frame.dart';

import '../common/combat_effect/combat_effect.dart';
import 'game_card/base/game_card.dart';
import '../common/game_stage/game_stage.dart';

class CoreGameFrame extends GameFrame {
  CoreGameFrame({
    this.data,
    required this.gameCards,
    required this.gameStage,
    List<CombatEffect>? combatEffects,
    this.nextId,
  }) {
    if (combatEffects != null) {
      this.combatEffects.addAll(combatEffects);
    }
  }

  final CoreGameData? data;
  final List<GameCard> gameCards;
  final GameStage gameStage;
  final List<CombatEffect> combatEffects = List.empty(growable: true);
  final String? nextId;

  void addAllCombatEffects(List<CombatEffect> combatEffects) {
    this.combatEffects.addAll(combatEffects);
  }
}
