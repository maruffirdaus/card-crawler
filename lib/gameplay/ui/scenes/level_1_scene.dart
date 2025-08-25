import 'package:card_crawler/core/game/frame/boss_fight/boss/boss.dart';
import 'package:card_crawler/core/game/frame/boss_fight/boss_fight_frame.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/boss_action/boss_action_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/player_action/player_action_game_card.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/player_equipment/player_equipment_game_card.dart';
import 'package:card_crawler/core/game/frame/common/game_stage/game_stage.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_choice.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_frame.dart';
import 'package:card_crawler/core/game/frame/conversation/conversation_unit.dart';
import 'package:card_crawler/core/game/frame/core_game/core_game_frame.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/equipment/equipment_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/monster/monster_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/weapon/weapon_game_card.dart';
import 'package:card_crawler/core/game/scene/base/ui/game_scene.dart';
import 'package:flutter/material.dart';

import '../../../core/game/frame/core_game/game_card/consumable/consumable_game_card.dart';
import '../../../core/game/frame/conversation/character/character.dart';

class Level1Scene extends StatefulWidget {
  const Level1Scene({super.key, required this.onComplete});

  final Function() onComplete;

  @override
  State<Level1Scene> createState() => _Level1SceneState();
}

class _Level1SceneState extends State<Level1Scene> {
  bool withLukas = false;

  @override
  Widget build(BuildContext context) {
    return GameScene(
      frames: {
        '0': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                'You walk through a thick plane of snow.',
                'There had been a storm the previous night; you could tell the creatures of the mountain were still resting.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: [
                '...',
                'It\'s so cold.',
                'I can\'t believe anyone would live here.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: [
                'Your footsteps crunched louder than you expected in the quiet, and you weren’t the only one who noticed. Somewhere beyond the snow covered trees, something shifted.',
                'You weren’t alone out here. From between the trees, a shadow moved, slow at first, then breaking free of the snow and stepping into view.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              texts: ['...Time to see if my practice had paid off.'],
              choices: [ConversationChoice(text: 'Fight', nextFrameId: '1')],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
        '1': CoreGameFrame(
          gameCards: [
            ...WeaponGameCard.snowyEntries,
            ...MonsterGameCard.snowyEntries,
            ...EquipmentGameCard.snowyEntries,
            ...ConsumableGameCard.snowyEntries,
          ],
          gameStage: GameStage.snowyMountainForest,
          nextId: '2',
        ),
        '2': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                'As you slay the last of the beasts, you hear footsteps frantically moving towards you.',
              ],
              choices: [
                ConversationChoice(
                  text:
                      'Raise your sword, prepare to strike down your next target',
                  nextUnitId: '1.1',
                ),
                ConversationChoice(
                  text: 'Hold your ground, analyze the threat first',
                  nextUnitId: '1.2',
                ),
              ],
            ),
            '1.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Whoa relax i\'m a friend.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '1.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Hey are you okay?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.lukas,
              texts: [
                'I saw those creatures were ganging up on you, so I rushed as soon as I could. Though it seems you took care of it just fine.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              texts: ['Who are you exactly?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.lukas,
              texts: ['Ah sorry for not introducing myself, I\'m Lukas!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.cole,
              texts: [
                'What are you doing here? Seems hardly a place for a casual walk.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Err I\'m visiting a relative that lives in this mountain, in a village near here.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              texts: [
                'Could he be going to the same village as you? Someone to accompany your trek does bgms good...',
                '...But is it actually safer to go with a stranger?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              character: Character.lukas,
              texts: ['How about you? you haven\'t introduced yourself yet.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '9')],
            ),
            '9': ConversationUnit(
              character: Character.cole,
              texts: [
                'I\'m Cole...',
                '...and I think we are headed to the same place.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '10')],
            ),
            '10': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Oh is that so? then we should go together! This area is not really safe to go through alone after all.',
              ],
              choices: [
                ConversationChoice(
                  text: 'Yeah, I think that\'d be best',
                  nextUnitId: '11.1',
                  onSelected: () {
                    setState(() {
                      withLukas = true;
                    });
                  },
                ),
                ConversationChoice(
                  text: 'I think I would rather continue alone.',
                  nextUnitId: '11.2',
                ),
              ],
            ),
            '11.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Sweet, I\'d be less worried with you accompanying me!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '12')],
            ),
            '11.2': ConversationUnit(
              character: Character.lukas,
              texts: ['Seriously? Wouldn\'t it be safer to go together?'],
              choices: [
                ConversationChoice(
                  text: 'On second thought, I think we should go together.',
                  nextUnitId: '11.1',
                ),
                ConversationChoice(
                  text: 'Yeah, I\'d rather go alone.',
                  nextUnitId: '11.2.1',
                ),
              ],
            ),
            '11.2.1': ConversationUnit(
              character: Character.lukas,
              texts: ['Well safe travels then friend!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '12')],
            ),
            '12': ConversationUnit(
              texts: [
                'Snow crunches steadily underfoot as you continue on your way. The woods grow quieter the deeper you go, only the wind slipping through the trees to keep you company.',
              ],
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextUnitId: withLukas ? '12.1' : '13',
                ),
              ],
            ),
            '12.1': ConversationUnit(
              texts: [
                'Your companion Lucas fills the silence with the occasional comment, his voice standing out against the stillness.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '13')],
            ),
            '13': ConversationUnit(
              texts: [
                'Before long, the calm breaks—branches snap ahead, and something stirs in the snow once again.',
                'From the shadow of the pines, something massive lumbers forward. A beast far larger than the ones before.',
                'A giant ape reveals itself, its skin and fur pale white, body built fully on muscle.',
                'You could see scars of it\'s previous battles, spears lodged into its hind.',
                'A Palemane Gorilla, an extremely dangerous beast.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '14')],
            ),
            '14': ConversationUnit(
              character: Character.cole,
              texts: ['Shit, this one seems troublesome...!'],
              choices: [ConversationChoice(text: 'Fight', nextFrameId: '3')],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
        '3': BossFightFrame(
          boss: Boss.amomongoEnemy,
          playerGameCards: [
            ...PlayerActionGameCard.entries1,
            ...PlayerEquipmentGameCard.entries1,
          ],
          bossGameCards: [...BossActionGameCard.amomongoEnemyEntries],
          gameStage: GameStage.snowyMountainForest,
          nextId: '4',
        ),
        '4': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                'You throw everything you have at the beast, hacking and slashing at it\'s limbs. You fight as if a man with no care for his life',
                'Finally, you stab the beast at it\'s core, the beast tumbles down, shaking the ground as it falls',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: [
                'That was close, Wasn\'t sure if I would\'ve made it out of that one',
              ],
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextUnitId: withLukas ? '1.1' : '2',
                ),
              ],
            ),
            '1.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Mannn am I glad to have you with me, we make a pretty good team eh?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: [
                'You continued your journey towards the village, after a couple more hours you finally arrived at your destination',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              texts: [
                'Finally...',
                'I could definitely use a rest right now, I haven\'t walked that far in ages...',
              ],
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextUnitId: withLukas ? '3.1' : '4',
                ),
              ],
            ),
            '3.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'I know right?',
                'So many beasts around too, hunters in this village would never run out of prey to hunt',
                'But I think I\'ll get going now, my friend should be waiting for me!',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3.2')],
            ),
            '3.2': ConversationUnit(
              texts: [
                'As your companion rushed off asking for directions, a thought occurred to you',
                '...Friend?',
                'I thought he was visiting a relative',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                'You decided to visit the local bar, you do need the rest after all. The place is relatively quiet, only the occasional sound of someone shouting for a drink.',
                'After some rest and a meal, you ask the people in the bar about where the elder is',
                'With your bills settled, you visit the elder\'s house. But as you come closer, you overhear people talking in the house, and it\'s someone familiar',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.witch,
              texts: [
                'Not anyone can find the ring that you seek, I\'m sure there is another way for you...',
                'If you walk down this path you might not make it back...',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              character: Character.lukas,
              texts: [
                '...',
                'Please...',
                'I\'ve looked everywhere, I\'ve tried everything...',
                'This ring is my only hope, I have to save her, whatever the cost',
                'I just need you to tell me anything you know about it',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.witch,
              texts: [
                '...',
                'The power to grant any wish...',
                'It does not come easy, the ring is protected with magic so old that none in the world could recognize it.',
                'They say that it\'s power would only be accessible to a worthy holder, the unworthy could never make it out alive...',
                'No one knows the exact location, but records mentions of a castle somewhere in sunstone desert, with a similar kind of magic to what has been described of the ring.',
                'But no one knows where this castle is, and people that have seen have also mentioned of a horrible beasts lurking around it.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Thank you...',
                'I\'ll get going when the sun rises, I\'ll find lodging in the village for the night.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '9')],
            ),
            '9': ConversationUnit(
              character: Character.witch,
              texts: [
                'I pray for you child, let the stars guide you on your journey.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '10')],
            ),
            '10': ConversationUnit(
              texts: [
                'As Lukas leaves the elder\'s house, he notices you outside.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '11')],
            ),
            '11': ConversationUnit(
              character: Character.lukas,
              texts: ['..!!', 'Cole..? how long have you been here?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '12')],
            ),
            '12': ConversationUnit(
              character: Character.cole,
              texts: ['So you were looking for the ring too.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '13')],
            ),
            '13': ConversationUnit(
              character: Character.lukas,
              texts: ['What?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '14')],
            ),
            '14': ConversationUnit(
              character: Character.cole,
              texts: [
                'I heard you talking with the witch just now.',
                'I was here for the same reason.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '15')],
            ),
            '15': ConversationUnit(
              character: Character.lukas,
              texts: ['...', 'Well, we\'re quite the pair then aren\'t we?'],
              choices: [
                ConversationChoice(
                  text: 'Next',
                  nextUnitId: withLukas ? '16.1' : '16.2',
                ),
              ],
            ),
            '16.1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'I wouldn\'t have guessed that you were also looking for the ring.',
                'You really helped me out on our way to the village',
                'I mean you practically saved me back there!',
                'So I\'m glad that you\'re also looking for the ring actually.',
                'What do you say if we go at it together again? Surely it would be easier with the both of us right?',
                'I just need to make one wish with the ring, you can keep it after if you want.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '17')],
            ),
            '16.2': ConversationUnit(
              character: Character.lukas,
              texts: [
                'I wouldn\'t have guessed that you were also looking for the ring.',
                'Honestly the thought of going through this alone is pretty tough for me.',
                'What do you say if we go at it together? I could really use your help getting there.',
                'I just need to make one wish with the ring, you can keep it after if you want, but please...',
                'I need to find that ring.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '17')],
            ),
            '17': ConversationUnit(
              character: Character.cole,
              texts: [
                '...Sure',
                'It would be a long and tough journey, I would be a fool to reject any help I can get.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '18')],
            ),
            '18': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Great! let\'s rest for the night, it\'s probably best to continue in the morning.',
              ],
              choices: [ConversationChoice(text: 'Rest', nextUnitId: '19')],
            ),
            '19': ConversationUnit(
              texts: [
                'After resting for the night, the pair would continue on their journey.',
                'To the Sunstone Desert, where they will face even more dangers than any they have ever faced before...',
              ],
              choices: [ConversationChoice(text: 'Rest')],
            ),
          },
          gameStage: GameStage.snowyMountainForest,
        ),
      },
      onComplete: widget.onComplete,
    );
  }
}
