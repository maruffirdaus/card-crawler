import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_choice.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_frame.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:card_crawler/core/game/frame/core_game/core_game_frame.dart';
import 'package:card_crawler/core/game/scene/base/game_scene.dart';
import 'package:flutter/material.dart';

import '../core/game/frame/common/game_card/accessory_game_card.dart';
import '../core/game/frame/common/game_card/consumable_game_card.dart';
import '../core/game/frame/conversation/character/character.dart';

class Level3Scene extends StatelessWidget {
  const Level3Scene({super.key});

  @override
  Widget build(BuildContext context) {
    return GameScene(
        frames: {
          0: ConversationFrame(
            conversations: {
              '0': ConversationUnit(
                character: Character.cole,
                text: 'Wow this place is huge!',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '1'),
                ],
              ),
              '1': ConversationUnit(
                character: Character.lukas,
                text: 'Yeah, agreed. I didn\'t expect that *wizard* was talking the truth about a castle in the desert',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '2'),
                ],
              ),
              '2': ConversationUnit(
                character: Character.cole,
                text: 'That sure is the case, anyway I\'m really tired with all that fighting from before, lets rest up a bit',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '3'),
                ],
              ),
              '3': ConversationUnit(
                character: Character.lukas,
                text: 'Yeah, lets go to that corner',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '4'),
                ],
              ),
              '4': ConversationUnit(
                character: Character.lukas, //n
                text: 'Both of you decided to rest at the corner.',
                choices: [
                  ConversationChoice(text: 'next', nextFrameId: 1),
                ],
              ),
            },
            gameStage: GameStage.s1,
          ),
          1: ConversationFrame(
            conversations: {
              '0': ConversationUnit(
                character: Character.lukas, //n
                text: 'Suddenly, the air inside the castle became very cold',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '1'),
                ],
              ),
              '1': ConversationUnit(
                character: Character.lukas,
                text: 'Resting really is the best after all that. But do you feel this air?',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '2'),
                ],
              ),
              '2': ConversationUnit(
                character: Character.lukas,
                text: 'Wow this place is huge!',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '3'),
                ],
              ),
              '3': ConversationUnit(
                character: Character.lukas,
                text: 'Wow this place is huge!',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '2'),
                ],
              ),
            },
            gameStage: GameStage.s1,
          ),
        },
    );
  }
}