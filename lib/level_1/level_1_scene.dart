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

class Level1Scene extends StatelessWidget {
  const Level1Scene({super.key});

  @override
  Widget build(BuildContext context) {
    return GameScene(
      frames: {
        0: ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole, //n
              text: 'You walk through a thick plane of snow',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '1'),
              ],
            ),
            '1': ConversationUnit(
              character: Character.cole, //n
              text: 'There had been a storm the previous night; you could tell the creatures of the mountain were still resting.',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '2',),
              ],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              text: '...',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '3'),
              ],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              text: 'It\'s so cold',
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextConversationUnitId: '4',
                ),
              ],
            ),
            '4': ConversationUnit(
              character: Character.cole,
              text: 'I can\'t believe that guy would live here' ,
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextConversationUnitId: '5',
                ),
              ],
            ),
            '5': ConversationUnit(
              character: Character.cole, //n
              text: 'Your footsteps crunched louder than you expected in the quiet, and you weren’t the only one who noticed. Somewhere beyond the snow covered trees, something shifted.',
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextConversationUnitId: '6',
                ),
              ],
            ),
            '6': ConversationUnit(
              character: Character.cole,
              text: 'You weren’t alone out here. From between the trees, a shadow moved, slow at first, then breaking free of the snow and stepping into view.' ,
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextConversationUnitId: '7',
                ),
              ],
            ),
            '7': ConversationUnit(
              character: Character.cole,
              text: '...Time to see if my practice had paid off' ,
              choices: [
                ConversationChoice(
                  text: 'Fight',
                  nextFrameId: 1
                ),
              ],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
        1: CoreGameFrame(
          gameCards: AccessoryGameCard.entries,
          gameStage: GameStage.snowyMountainForest,
          nextId: 2,
        ),
        2: ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole, //n
              text: 'As you slay the last of the beasts, you hear footsteps frantically moving towards you' ,
              choices: [
                ConversationChoice(
                  text: 'Raise your sword, prepare to strike down your next target',
                  nextConversationUnitId: '1,1',
                ),
                ConversationChoice(
                    text: 'Hold your ground, analyze the threat first',
                    nextConversationUnitId: '1.2',
                ),
              ],
            ),
            '1,1': ConversationUnit(
              character: Character.lukas, //n
              text: 'Whoa relax i\'m a friend',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '2',),
              ],
            ),
            '1,2': ConversationUnit(
              character: Character.lukas,
              text: 'Hey are you okay?',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '2',),
              ],
            ),
            '2': ConversationUnit(
              character: Character.lukas,
              text: 'I saw those creatures were ganging up on you, so I rushed as soon as I could. Though it seems you took care of it just fine',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '3',),
              ],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              text: 'Who are you exactly?',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '4',),
              ],
            ),
            '4': ConversationUnit(
              character: Character.lukas,
              text: 'Ah sorry for not introducing myself, I\'m Lukas!',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '5',),
              ],
            ),
            '5': ConversationUnit(
              character: Character.cole,
              text: 'What are you doing here? Seems hardly a place for a casual walk',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '6',),
              ],
            ),
            '6': ConversationUnit(
              character: Character.lukas,
              text: 'Err I\'m visiting a relative that lives in this mountain, in a village near here',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '7',),
              ],
            ),
            '7': ConversationUnit(
              character: Character.cole, //n
              text: 'Could he be going to the same village as you? Someone to accompany your trek does sounds good...',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '8',),
              ],
            ),
            '8': ConversationUnit(
              character: Character.cole, //n
              text: '...But is it actually safer to go with a stranger?',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '9',),
              ],
            ),
            '9': ConversationUnit(
              character: Character.lukas,
              text: 'How about you? you haven\'t introduced yourself yet',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '10',),
              ],
            ),
            '10': ConversationUnit(
              character: Character.cole,
              text: 'I\'m Cole...',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '11',),
              ],
            ),
            '11': ConversationUnit(
              character: Character.cole,
              text: '...and I think we are headed to the same place',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '12',),
              ],
            ),
            '12': ConversationUnit(
              character: Character.lukas,
              text: 'Oh is that so? then we should go together! This area is not really safe to go through alone after all',
              choices: [
                ConversationChoice(text: 'Yeah, I think that\'d be best', nextConversationUnitId: '13.1',),
                ConversationChoice(text: 'I think I would rather continue alone', nextConversationUnitId: '13.2'),
              ],
            ),
            '13.1': ConversationUnit(
              character: Character.lukas,
              text: 'Sweet, I\'d be less worried with you accompanying me!',
              //Get status "Fighting with Lukas"
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '14.1',),
              ],
            ),
            '13.2': ConversationUnit(
              character: Character.lukas,
              text: 'Seriously? Wouldn\'t it be safer to go together?',
              choices: [
                ConversationChoice(text: 'On second thought, I think we should go together', nextConversationUnitId: '13.1',),
                ConversationChoice(text: 'Yeah, I\'d rather go alone', nextConversationUnitId: '13.2.1'),
              ],
            ),
            '13.2.1': ConversationUnit(
              character: Character.lukas,
              text: 'Well safe travels then friend!',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '14.2',),
              ],
            ),
            '14.1': ConversationUnit(
              character: Character.cole, //n
              text: 'Snow crunches steadily underfoot as you continue on your way. The woods grow quieter the deeper you go, only the wind slipping through the trees to keep you company.',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '14.1.1',),
              ],
            ),
            '14.1.1': ConversationUnit(
              character: Character.cole, //n
              text: 'Your companion Lucas fills the silence with the occasional comment, his voice standing out against the stillness.',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '15',),
              ],
            ),
            '14.2': ConversationUnit(
              character: Character.cole, //n
              text: 'Snow crunches steadily underfoot as you continue on your way. The woods grow quieter the deeper you go, only the wind slipping through the trees to keep you company.',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '15',),
              ],
            ),
            '15': ConversationUnit(
              character: Character.cole, //n
              text: 'Before long, the calm breaks—branches snap ahead, and something stirs in the snow once again.',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '16',),
              ],
            ),
            '16': ConversationUnit(
              character: Character.cole, //n
              text: 'From the shadow of the pines, something massive lumbers forward. A beast far larger than the ones before, its eyes burning with hunger.',
              choices: [
                ConversationChoice(text: 'Next', nextConversationUnitId: '17',),
              ],
            ),
            '17': ConversationUnit(
              character: Character.cole,
              text: 'Shit, this one seems troublesome...!',
              choices: [
                ConversationChoice(text: 'Fight', nextFrameId: 3),
              ],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
        3: CoreGameFrame(
          gameCards: ConsumableGameCard.entries,
          gameStage: GameStage.snowyMountainForest,
        ),
      },
    );
  }
}
