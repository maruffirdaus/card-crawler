import 'package:card_crawler/core/game/frame/conversation/character/character.dart';

import 'conversation_choice.dart';

class ConversationUnit {
  ConversationUnit({
    required this.character,
    required this.text,
    required this.choices,
  });

  Character character;
  String text;
  List<ConversationChoice> choices;
}
