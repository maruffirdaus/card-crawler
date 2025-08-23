import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_choice.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_frame.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:card_crawler/core/game/frame/core_game/core_game_frame.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/weapon/weapon_game_card.dart';
import 'package:card_crawler/core/game/scene/base/game_scene.dart';
import 'package:flutter/material.dart';
import '../../../core/game/frame/core_game/game_card/equipment/equipment_game_card.dart';

import '../../../core/game/frame/conversation/character/character.dart';

class Level3Scene extends StatefulWidget {
  const Level3Scene({super.key, required this.onComplete});

  final Function() onComplete;

  @override
  State<Level3Scene> createState() => _Level3SceneState();
}

class _Level3SceneState extends State<Level3Scene> {
  final bool victory = true; // or false, depending on result

  @override
  Widget build(BuildContext context) {
    return GameScene(
      frames: {
        '0': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole,
              texts: ['Wow this place is huge!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Yeah, agreed. I didn\'t expect that *wizard* was talking the truth about a castle in the desert',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              texts: [
                'That sure is the case, anyway I\'m really tired with all that fighting from before, lets rest up a bit',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: ['Yeah, lets go to that corner'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: ['Both of you decided to rest at the corner.'],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '1')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '1': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: ['Suddenly, the air inside the castle became very cold'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: [
                'Resting really is the best after all that. But do you feel this air?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
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
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '3.2': ConversationUnit(
              //n //nerf sheer cold kalo fight
              texts: ['The cold makes you even more uncomfortable.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.lukas,
              texts: ['So, tell me cole, why are you looking for the ring?'],
              choices: [
                ConversationChoice(
                  text:
                      'Honestly, I just want my wife and my son back. There\'s something i haven\'t told them yet.',
                  nextUnitId: '5.1',
                ),
                ConversationChoice(
                  text: 'I\'m not comfortable talking about that...',
                  nextUnitId: '5.2',
                ),
              ],
            ),
            '5.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Hold on to that. It\'s what will keep you fighting.'],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '5.1.1'),
              ],
            ),
            '5.1.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Since you\'ve already told me your secret, allow me to share mine.',
                'My wife is seriously ill right now. I\'ve tried many medications, but none of them have worked.',
                'They said it\'s a very rare disease, and they haven\'t found a cure yet.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.1.2')],
            ),
            '5.1.2': ConversationUnit(
              character: Character.cole,
              texts: ['Sorry to hear about your wife\'s situation'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '5.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Boring...'],
              choices: [
                ConversationChoice(text: 'How about you?', nextUnitId: '5.2.1'),
              ],
            ),
            '5.2.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Since someone is very secretive...',
                'Actually my wife is seriously ill, so I want to cure her',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.2.2')],
            ),
            '5.2.2': ConversationUnit(
              character: Character.cole,
              texts: [
                'Sorry to hear about your wife\'s situation',
                'Since you opened up, i\'ll tell you.',
                'I just want my wife and my son back. There\'s something i haven\'t told them yet.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.2.3')],
            ),
            '5.2.3': ConversationUnit(
              character: Character.lukas,
              texts: ['You will. We’ll get through this, together.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              texts: ['krk.. krk.. krk..'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.lukas,
              texts: ['What\'s that sound?'],
              choices: [
                ConversationChoice(
                  text: 'One thing\'s for sure that\'s not a good sign.',
                  nextFrameId: '2',
                ),
              ],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '2': CoreGameFrame(
          gameCards: WeaponGameCard.entries,
          gameStage: GameStage.castle,
          nextId: '3',
        ),
        '3': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole,
              texts: ['That was  a close call.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Indeed. What is the deal with these monsters assaulting us?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              texts: ['I think this hallway will lead to something.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: ['That means we have to rush to the end of this castle.'],
              choices: [ConversationChoice(text: 'Agreed.', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                'After defeating waves of monsters, both of you run toward what you believe is the way to the king’s room.',
                'But before you get there, a monster suddenly assaults Lukas.',
              ],
              choices: [
                ConversationChoice(
                  text: '"Push Lukas away"',
                  nextUnitId: '5.1',
                ),
                ConversationChoice(
                  text: '"Hit the monster"',
                  nextUnitId: '5.2',
                ),
              ],
            ),
            '5.1': ConversationUnit(
              character: Character.cole,
              texts: ['ARGHHHH!!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.1.1')],
            ),
            '5.1.1': ConversationUnit(
              texts: [
                'You managed to save Lukas, but you got hit instead. (-3 Health)',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.1.2')],
            ),
            '5.1.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Cole, Are you alright?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.1.3')],
            ),
            '5.1.3': ConversationUnit(
              character: Character.cole,
              texts: ['I\'m alright, what about you?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '5.2': ConversationUnit(
              texts: [
                'The monster almost got a hit on Lukas, you saved him on time',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5.2.1')],
            ),
            '5.2.1': ConversationUnit(
              character: Character.cole,
              texts: ['Are you ok?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              character: Character.lukas,
              texts: [
                'I\'m fine, i didn\'t expect it to jump on me.',
                'Anyway, I think we have more company.',
              ],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '4')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '4': CoreGameFrame(
          gameCards: EquipmentGameCard.entries,
          gameStage: GameStage.castle,
          nextId: '5',
        ),
        '5': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: ['Suddenly, The door creaked open.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'The door opened! Hurry, get inside *cole*.',
                'I\'ll hold them off!',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: ['You run as fast as you can towards the door.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              texts: ['Lukas, Run as fast as you can!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                'Lukas ran as fast as he could toward you.',
                'As soon as he passed, you quickly slammed the door shut.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Remind me why we thought storming a monster-infested castle was a good idea?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              texts: ['GRAAAUUUGH!!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.cole,
              texts: ['We\'re not done yet! Look out, ahead!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              texts: ['"Come closer… let me taste despair"'],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '6')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '6': CoreGameFrame(
          //boss stage
          gameCards: EquipmentGameCard.entries,
          gameStage: GameStage.castle,
          nextId: '7',
        ), // if win go next, if not retry
        '7': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                '"I… will not… FALL!"',
                'The monster’s scream echoed through the hall, then faded into a chilling silence.',
                'From the ashes of the beast, a magic ring appeared',
                'Hovering in the air for a moment before clattering to the floor.',
                'Both of you rush forward to retrieve the ring.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: ['Is that really the magic ring?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: [
                'A chilling voice spilled from the artifact, echoing in both their heads.',
                '"Two stand before me… but only one shall claim my power. Only one wish will be granted."',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: ['Cole... you know my wife is sick right now.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.cole,
              texts: ['But, what about my wish?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.lukas,
              texts: [
                'I know you long to be with them, Cole, but my wife\'s life hangs in the balance.',
                'I can\'t give this up either.',
                // 'Any choice will affect the storyline.'
              ],
              choices: [
                ConversationChoice(
                  text: 'Stand your ground, fight for your wish.',
                  nextUnitId: '6.1',
                ),
                ConversationChoice(
                  text: 'Step back, give up your wish.',
                  nextUnitId: '6.2',
                ),
              ],
            ),
            '6.1': ConversationUnit(
              character: Character.cole,
              texts: ['No, Lukas. You can\'t be selfish, that wish is mine.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6.1.1')],
            ),
            '6.1.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Selfish? You think I\'m selfish?!',
                'I\'m doing this for my family!',
                'Don\'t act like you\'re any different!',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6.1.2')],
            ),
            '6.1.2': ConversationUnit(
              character: Character.cole,
              texts: ['If it’s a fight you want, Lukas… then you’ll get it.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6.1.3')],
            ),
            '6.1.3': ConversationUnit(
              character: Character.lukas,
              texts: ['Then stop talking and try to take it from me.'],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '8')],
            ),
            '6.2': ConversationUnit(
              character: Character.cole,
              texts: [
                'Alright, Lukas. I understand. I won\'t interfere with your wish.',
              ],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '11')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '8': CoreGameFrame(
          // lawan lukas
          gameCards: EquipmentGameCard.entries,
          gameStage: GameStage.castle,
          nextId: victory
              ? '9'
              : '10', //game will auto save here?, 9 if win, 10 if lose var victory ada di paling atas, belum implement datengnya dari mana
        ),
        '9': ConversationFrame(
          //if win
          conversations: {
            '0': ConversationUnit(
              texts: [
                'Lukas collapses, clutching his wounds, eyes filled with disbelief.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: ['…So this… is how it ends…'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              texts: ['…I had no choice.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              texts: [
                'Cole wears the magic ring.',
                '"What do you wish for master?"',
                'I want you to bring back my wife and my son.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                'Cole wears the magic ring.',
                '"What do you wish for master?"',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              texts: ['I want you to bring back my wife and my son.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              texts: [
                '"Then I shall do that."',
                'The ring pulses with a sinister glow, then projects a wavering vision into the air.'
                    'Your wife and son appeared before you.',
                '"Why did you bring us back?"',
                'You froze.',
                '"We were already living peacefully… and now you want us to return to this world?"',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.cole,
              texts: [
                'I… I just wanted to see you again. I thought I was doing the right thing…',
                'Please… don’t hate me. I couldn\'t bear losing you.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              texts: [
                '"You were meant to let go… not to bring us back."',
                'Before you can answer, the castle trembles violently cracks split the walls, and the floor collapses beneath your feet.',
                'Darkness swallows you whole', //ending
              ],
              choices: [ConversationChoice(text: 'End')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '10': ConversationFrame(
          //if lose
          conversations: {
            '0': ConversationUnit(
              character: Character.lukas,
              texts: [
                'You called me selfish… but you’d do the same if it was your family.',
                'This is my choice, Cole.',
                'Mine.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              texts: [
                'You watch as Lukas slips the magic ring onto his finger.',
                '"What do you wish for master?"',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.lukas,
              texts: ['I want you to cure my wife\'s illness. That\'s it.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: [
                'The ring pulses with a sinister glow, then projects a wavering vision into the air.',
                '"Your desire has been heard… your wish shall be granted."',
                'Slowly, the image of a woman appears—Lukas\'s wife.',
                'She looks healthier than he ever remembered, her face radiant and free from pain.',
                'Relief fills Lukas\'s eyes… but it lasts only a moment.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.cole,
              texts: ['Lukas… the castle… it\'s collapsing…'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              texts: [
                //ending le
                'The ground rumbles. Cracks spread across the stone floor.',
                'The ceiling splits open as debris crashes down. Dust and darkness engulf the chamber.',
                'The ancient fortress gives its final roar as it crumbles, burying both of you beneath the ruins.',
              ],
              choices: [ConversationChoice(text: 'End')],
            ),
          },
          gameStage: GameStage.castle,
        ),
        '11': ConversationFrame(
          //if gave up wish
          conversations: {
            '0': ConversationUnit(
              texts: [
                'Cole\'s shoulders sag as he lowers his hand. His voice is hoarse but steady',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: [
                'Alright… Lukas. I won\'t fight you anymore.',
                'If curing your wife is what you truly wish for, then… take it. I\'ll step aside.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: [
                'Lukas stares at Cole in silence for a moment, chest heaving with emotion.',
                'Finally, he grips the ring tightly',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Thank you… my friend. I swear, this wish won’t be wasted.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: ['"What do you wish for master?"'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.lukas,
              texts: ['I wish for my wife to be cured of her illness!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              texts: [
                'The ring pulses with a sinister glow, then projects a wavering vision into the air.',
                '"Your desire has been heard… your wish shall be granted."',
                'Slowly, the image of a woman appears—Lukas\'s wife.',
                'She looks healthier than he ever remembered, her face radiant and free from pain.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.lukas,
              texts: [
                'She\'s… she\'s cured. After all this time…',
                'Cole… I can never repay you for this.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              character: Character.cole,
              texts: [
                'You don\'t need to. Just… take care of her. That\'s more than enough.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '9')],
            ),
            '9': ConversationUnit(
              texts: [
                'The castle begins to crumble.',
                'A doorway appears, leading them back outside.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '10')],
            ),
            '10': ConversationUnit(
              character: Character.cole,
              texts: ['Looks like we’re finally going home.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '11')],
            ),
            '11': ConversationUnit(
              //ending 3
              texts: [
                'Together, the two step forward, leaving the castle behind.',
              ],
              choices: [ConversationChoice(text: 'End')],
            ),
          },
          gameStage: GameStage.castle,
        ),
      },
      onComplete: widget.onComplete,
    );
  }
}
