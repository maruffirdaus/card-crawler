import 'package:card_crawler/core/game/frame/boss_fight/boss/boss.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/models/boss_fight_data.dart';

import '../common/game_stage/game_stage.dart';
import '../common/status_effect/status_effect.dart';

class BossFightFrame {
  BossFightFrame({
    required this.boss,
    required this.data,
    required this.playerGameCards,
    required this.bossGameCards,
    required this.gameStage,
    List<StatusEffect>? statusEffects,
    this.nextId,
  }) {
    if (statusEffects != null) {
      this.statusEffects.addAll(statusEffects);
    }
  }

  final Boss boss;
  final BossFightData data;
  final List<BossFightGameCard> playerGameCards;
  final List<BossFightGameCard> bossGameCards;
  final GameStage gameStage;
  final List<StatusEffect> statusEffects = List.empty(growable: true);
  final String? nextId;
}
