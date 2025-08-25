import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/character/character.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_choice.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:flutter/material.dart';

class ConversationProvider extends ChangeNotifier {
  late Map<String, ConversationUnit> _conversations;

  late String _currentId;

  int _currentTextIndex = 0;

  Character? get currentCharacter => _conversations[_currentId]!.character;

  String get currentText =>
      _conversations[_currentId]!.texts[_currentTextIndex];

  List<ConversationChoice> get currentChoices =>
      _conversations[_currentId]!.choices;

  GameStage? _gameStage;
  GameStage? get gameStage => _gameStage;

  void init({
    required Map<String, ConversationUnit> conversations,
    required GameStage? gameStage,
  }) {
    _conversations = conversations;
    _currentId = conversations.keys.first;
    _currentTextIndex = 0;
    _gameStage = gameStage;
  }

  bool isConversationFinished() =>
      _currentTextIndex + 1 == _conversations[_currentId]!.texts.length;

  void nextTextIndex() {
    _currentTextIndex++;
    notifyListeners();
  }

  void nextUnit(String nextId) {
    _currentId = nextId;
    _currentTextIndex = 0;
    notifyListeners();
  }
}
