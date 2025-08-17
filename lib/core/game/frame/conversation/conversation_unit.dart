import 'package:card_crawler/core/game/frame/conversation/character/character.dart';

import 'conversation_choice.dart';

class ConversationUnit {
  ConversationUnit({
    this.character,
    required this.texts,
    required this.choices,
  });

  Character? character;
  List<String> texts;
  List<ConversationChoice> choices;
}
