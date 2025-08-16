import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:flutter/material.dart';

class ConversationProvider extends ChangeNotifier {
  late Map<String, ConversationUnit> _conversations;

  late String _currentConversationUnitId;
  String get currentConversationUnitId => _currentConversationUnitId;

  ConversationUnit get currentConversationUnit =>
      _conversations[_currentConversationUnitId]!;

  late GameStage _gameStage;

  GameStage get gameStage => _gameStage;

  void init({
    required Map<String, ConversationUnit> conversations,
    required GameStage gameStage,
  }) {
    _conversations = conversations;
    _currentConversationUnitId = conversations.keys.first;
    _gameStage = gameStage;
  }

  void nextConversation(String nextId) {
    _currentConversationUnitId = nextId;
    notifyListeners();
  }
}
