import 'package:card_crawler/core/game/frame/core_game/models/core_game_data.dart';
import 'package:card_crawler/core/game/frame/base/game_frame.dart';

import '../common/game_card/game_card.dart';
import '../common/game_stage/game_stage.dart';

class CoreGameFrame extends GameFrame {
  CoreGameFrame({
    this.data,
    required this.gameCards,
    required this.gameStage,
    this.nextId,
  });

  final CoreGameData? data;
  final List<GameCard> gameCards;
  final GameStage gameStage;
  final String? nextId;
}
