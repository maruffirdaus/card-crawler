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
                character: Character.cole,
                text: 'Resting really is the best after all that. But do you feel this air?',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '2'),
                ],
              ),
              '2': ConversationUnit(
                character: Character.lukas,
                text: 'Yeah it\'s so cold, i\'m practically shivering',
                choices: [
                  ConversationChoice(text: 'I\'ll light a fire in a second.', nextConversationUnitId: '3.1'),
                  ConversationChoice(text: 'I don\'t think its that bad.', nextConversationUnitId: '3.2'),
                ],
              ),
              '3.1': ConversationUnit(
                character: Character.lukas, //n //normal
                text: 'You feel the air getting warmer.',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '4'),
                ],
              ),
              '3.2': ConversationUnit(
                character: Character.lukas, //n //nerf sheer cold kalo fight
                text: 'The cold makes you even more uncomfortable.',
                choices: [
                  ConversationChoice(text: 'next', nextConversationUnitId: '4'),
                ],
              ),
              '4': ConversationUnit(
                character: Character.lukas,
                text: 'So, tell me {MC}, why are you looking for the ring?',
                choices: [
                  ConversationChoice(text: 'Honestly, I just want my wife and my son back. There\'s something i haven\'t told them yet.', nextConversationUnitId: '5.1'),
                  ConversationChoice(text: 'I\'m not comfortable talking about that...')
                ],
              ),
              '5.1': ConversationUnit(
                character: Character.lukas,
                text: 'Secrets have a way of catching up with us. Maybe this is your chance to finally let it out.',
                choices: [
                  ConversationChoice(text: 'How about you?', nextConversationUnitId: '6.1'),
                ],
              ),
              '5.2': ConversationUnit(
                character: Character.lukas,
                text: 'Boring...',
                choices: [
                  ConversationChoice(text: 'How about you?', nextConversationUnitId: '6.2'),
                ],
              ),
              '6.1': ConversationUnit(
                character: Character.lukas,
                text: 'Boring...',
                choices: [
                  ConversationChoice(text: 'How about you?', nextConversationUnitId: '6.2'),
                ],
              ),
              '6.2': ConversationUnit(
                character: Character.lukas,
                text: 'Boring...',
                choices: [
                  ConversationChoice(text: 'How about you?', nextConversationUnitId: '6.2'),
                ],
              ),
            },
            gameStage: GameStage.s1,
          ),
        },
    );
  }
}