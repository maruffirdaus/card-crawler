import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';

class ConversationFrame extends GameFrame {
  ConversationFrame({required this.conversations, required this.gameStage});

  final Map<String, ConversationUnit> conversations;
  final GameStage gameStage;
}
