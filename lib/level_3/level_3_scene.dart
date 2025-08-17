import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_choice.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_frame.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:card_crawler/core/game/scene/base/game_scene.dart';
import 'package:flutter/material.dart';

import '../core/game/frame/conversation/character/character.dart';

class Level3Scene extends StatelessWidget {
  const Level3Scene({super.key});

  @override
  Widget build(BuildContext context) {
    return GameScene(
      frames: {
        '0': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole,
              texts: ['Wow this place is huge!'],
              choices: [ConversationChoice(text: 'next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Yeah, agreed. I didn\'t expect that *wizard* was talking the truth about a castle in the desert',
              ],
              choices: [ConversationChoice(text: 'next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              texts: [
                'That sure is the case, anyway I\'m really tired with all that fighting from before, lets rest up a bit',
              ],
              choices: [ConversationChoice(text: 'next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: ['Yeah, lets go to that corner'],
              choices: [ConversationChoice(text: 'next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.lukas, //n
              texts: ['Both of you decided to rest at the corner.'],
              choices: [ConversationChoice(text: 'next', nextFrameId: '1')],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
        '1': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.lukas, //n
              texts: ['Suddenly, the air inside the castle became very cold'],
              choices: [ConversationChoice(text: 'next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: [
                'Resting really is the best after all that. But do you feel this air?',
              ],
              choices: [ConversationChoice(text: 'next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.lukas,
              texts: ['Yeah it\'s so cold, i\'m practically shivering'],
              choices: [
                ConversationChoice(
                  text: 'I\'ll light a fire in a second.',
                  nextUnitId: '3.1',
                ),
                ConversationChoice(
                  text: 'I don\'t think its that bad.',
                  nextUnitId: '3.2',
                ),
              ],
            ),
            '3.1': ConversationUnit(
              character: Character.lukas, //n //normal
              texts: ['You feel the air getting warmer.'],
              choices: [ConversationChoice(text: 'next', nextUnitId: '4')],
            ),
            '3.2': ConversationUnit(
              character: Character.lukas, //n //nerf sheer cold kalo fight
              texts: ['The cold makes you even more uncomfortable.'],
              choices: [ConversationChoice(text: 'next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.lukas,
              texts: ['So, tell me {MC}, why are you looking for the ring?'],
              choices: [
                ConversationChoice(
                  text:
                      'Honestly, I just want my wife and my son back. There\'s something i haven\'t told them yet.',
                  nextUnitId: '5.1',
                ),
                ConversationChoice(
                  text: 'I\'m not comfortable talking about that...',
                ),
              ],
            ),
            '5.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Secrets have a way of catching up with us. Maybe this is your chance to finally let it out.',
              ],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '6.1'),
              ],
            ),
            '5.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Boring...'],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '6.2'),
              ],
            ),
            '6.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Boring...'],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '6.2'),
              ],
            ),
            '6.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Boring...'],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '6.2'),
              ],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
      },
    );
  }
}
