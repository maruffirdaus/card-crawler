import 'package:card_crawler/core/game/frame/common/status_effect/status_effect.dart';
import 'package:card_crawler/core/game/frame/core_game/models/core_game_data.dart';
import 'package:card_crawler/core/game/frame/base/game_frame.dart';

import 'game_card/base/game_card.dart';
import '../common/game_stage/game_stage.dart';

class CoreGameFrame extends GameFrame {
  CoreGameFrame({
    this.data,
    required this.gameCards,
    required this.gameStage,
    List<StatusEffect>? statusEffects,
    this.nextId,
  }) {
    if (statusEffects != null) {
      this.statusEffects.addAll(statusEffects);
    }
  }

  final CoreGameData? data;
  final List<GameCard> gameCards;
  final GameStage gameStage;
  final List<StatusEffect> statusEffects = List.empty(growable: true);
  final String? nextId;

  void addAllStatusEffects(List<StatusEffect> statusEffects) {
    this.statusEffects.addAll(statusEffects);
  }
}
