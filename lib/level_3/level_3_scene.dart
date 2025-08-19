import 'package:card_crawler/core/game/frame/common/game_card/consumable_game_card.dart';
import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_choice.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_frame.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:card_crawler/core/game/frame/core_game/core_game_frame.dart';
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
              texts: ['Both of you decided to rest at the corner.'],
              choices: [ConversationChoice(text: 'next', nextFrameId: '1')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '1': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
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
              //n //normal
              texts: ['You feel the air getting warmer.'],
              choices: [ConversationChoice(text: 'next', nextUnitId: '4')],
            ),
            '3.2': ConversationUnit(
              //n //nerf sheer cold kalo fight
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
                ConversationChoice(text: 'How about you?', nextUnitId: '5.1.1'),
              ],
            ),
            '5.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Boring...'],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '5.2.1'),
              ],
            ),
            '5.1.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Since you\'ve already told me your secret, allow me to share mine.','My wife is seriously ill right now. I\'ve tried many medications, but none of them have worked.','They said it\'s a very rare disease, and they haven\'t found a cure yet.'],
              choices: [
                ConversationChoice(text: 'Next', nextUnitId: '6'),
              ],
            ),
            '5.2.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Since someone is very secretive...','I will tell you...', 'Actually my wife is seriously ill, so I want to cure her'],
              choices: [
                ConversationChoice(text: 'Next', nextUnitId: '6'),
              ],
            ),
            '6': ConversationUnit(
              character: Character.cole,
              texts: ['Sorry to hear about your wife\'s situation'],
              choices: [
                ConversationChoice(text: 'Next', nextUnitId: '7'),
              ],
            ),
            '7': ConversationUnit(
              texts: ['krk.. krk.. krk..'],
              choices: [
                ConversationChoice(text: 'Next', nextUnitId: '8'),
              ],
            ),
            '8': ConversationUnit(
              character: Character.lukas,
              texts: ['What\'s that sound?'],
              choices: [
                ConversationChoice(text: 'One thing\'s for sure that\'s not a good sign.', nextFrameId: '2'),
              ],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '2': CoreGameFrame(
          gameCards: ConsumableGameCard.entries,
          gameStage: GameStage.castle,
          nextId: '3',
        ),
        '3': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole,
              texts: ['That was  a close call.'],
              choices: [
                ConversationChoice(text: 'Next', nextUnitId: '1'),
              ],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: ['Indeed. What is the deal with these monsters assaulting us?'],
              choices: [
                ConversationChoice(text: 'One thing\'s for sure that\'s not a good sign.', nextUnitId: '1'),
              ],
            ),
          },
          gameStage: GameStage.castle,
        )
      },
    );
  }
}
