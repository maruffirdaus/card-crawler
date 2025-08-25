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
import 'package:card_crawler/core/game/frame/core_game/game_card/consumable/consumable_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/monster/monster_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/weapon/weapon_game_card.dart';
import 'package:card_crawler/core/game/scene/base/ui/game_scene.dart';
import 'package:flutter/material.dart';

import '../../../core/game/frame/conversation/character/character.dart';
import '../../../core/game/frame/core_game/game_card/equipment/equipment_game_card.dart';

class Level2Scene extends StatefulWidget {
  const Level2Scene({super.key, required this.onComplete});

  final Function() onComplete;

  @override
  State<Level2Scene> createState() => _Level2SceneState();
}

class _Level2SceneState extends State<Level2Scene> {
  @override
  Widget build(BuildContext context) {
    return GameScene(
      frames: {
        '0': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                'After weeks of travel, you finally find yourself in Sunstone desert...',
                'You walk through the desert slowly, each steps scorches the sole of your feet, the glare of the sun blinds you, you\'ve been walking for hours',
                'There is no castle in sight.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: [
                'My god...',
                'Bring me back to the snow please.',
                'I\'m melting over here',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              texts: [
                '...',
                'Keep on the lookout.',
                'Other than finding the castle, we also have to be wary of animals lurking in the sand.',
                'I\'ve read before that deserts like these are filled with venomous animals, so pay attention on where you\'re walking.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: [
                'You\'re right, you\'re right, I\'ll be careful.',
                '...',
                'Hey uh...',
                'You do think this castle actually exists right?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              character: Character.cole,
              texts: [
                '...',
                'Isn\'t it a little too late to question that?',
                'What, you wanna go home?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.lukas,
              texts: [
                'No, no, of course not...',
                'It\'s just...',
                'I\'m worried I guess.',
                'What if the castle and the ring are just myths after all?',
                'Surely if there is a castle like that we would\'ve come across it already right?'
                    'I just... don\'t know what I\'d do if the ring doesn\'t exist.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              character: Character.cole,
              texts: [
                '...',
                'Well...',
                'I see where you\'re coming from',
                'I also don\'t know what I\'d do if I can\'t find the ring.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.lukas,
              texts: [
                '...Right.',
                '!!',
                'Hey, what\'s that over there?',
                'Smoke?',
                'Holy shit a lot of monsters are coming!',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              character: Character.cole,
              texts: ['Get ready to fight!'],
              choices: [ConversationChoice(text: 'Fight', nextFrameId: '1')],
            ),
          },
          gameStage: GameStage.desert,
        ),
        '1': CoreGameFrame(
          gameCards: [
            ...WeaponGameCard.desertEntries,
            ...MonsterGameCard.desertEntries,
            ...EquipmentGameCard.desertEntries,
            ...ConsumableGameCard.desertEntries,
          ],
          gameStage: GameStage.desert,
          nextId: '2',
        ),
        '2': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.lukas,
              texts: ['Are you okay???', 'There\'s no end to these things!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: [
                'I\'m okay don\'t worry about me !',
                'Lookout! More of them are coming!',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: [
                'Suddenly the ground shakes beneath you, all the monsters that were attacking you scurries away from you, as if to avoid a calamity.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: ['What the-', 'Where are these things going?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                'You see a giant smoke of cloud moving at your direction, a typhoon?.',
                'It\'s moving too fast to be a typhoon, as it gets closer, you can digging bgms in the distance.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.lukas,
              texts: ['Look out!!!'],
              choices: [ConversationChoice(text: 'Dodge', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              texts: [
                'As it surfaces you can hear it\'s sound, a great roar pierces your eardrums.',
                'You finally have a clear view of it, a giant alligator.',
                'What is this thing doing in such a place? it\'s green hue seems intensely out of place with the yellow sand all around you.',
                'Massive teeth the size of your arms, one bite would break bones and rip through muscle.',
                'The existence of such a thing definitely reeks of magic in the area, you are in the right place.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.cole,
              texts: [
                'Could this be it? the beast that the elder warned us about?',
                'Prepare to fight lukas, I don\'t think we can outrun it anyways...',
              ],
              choices: [ConversationChoice(text: 'Fight', nextFrameId: '3')],
            ),
          },
          gameStage: GameStage.desert,
        ),
        '3': BossFightFrame(
          boss: Boss.buwayaEnemy,
          playerGameCards: [
            ...PlayerActionGameCard.entries2,
            ...PlayerEquipmentGameCard.entries2,
          ],
          bossGameCards: [...BossActionGameCard.buwayaEnemyEntries],
          gameStage: GameStage.desert,
          nextId: '4',
        ),
        '4': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                'You keep dodging the gator\'s furious attacks, sneaking in slashes and spells in between.',
                'This back and forth goes for longer than you hoped, you becoming more tired while the beast does not slow down.',
                'When the beast faces your companion, you lunge at the beast from behind, planting your sword at it\'s neck, the beast thrashes as it roars from the pain, throwing you to the ground.',
                'You hit your head as you fall, and before you regain your sense, the beast falls on top of you.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: ['COLE!!!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: ['And suddenly...', '...silence.'],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '5')],
            ),
          },
          gameStage: GameStage.desert,
        ),
        '5': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: [
                '...',
                '...',
                '..a..ther...',
                'Father!',
                'Let\'s go home father...',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: ['!!!'],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '6')],
            ),
          },
        ),
        '6': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              texts: ['"Father, let\'s play together"!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.cole,
              texts: ['I\'ll play with you after I\'m done okay?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              texts: [
                '"Can\'t we play now..?"',
                '"You say we can\'t play after dark..."',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.cole,
              texts: ['Just a bit more I promise.'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                '...',
                '...',
                '...',
                '...Without noticing the time, you continue to work on and on, the sound of your hammer the only thing accompanying you.',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '5')],
            ),
            '5': ConversationUnit(
              character: Character.cole,
              texts: [
                'Finally done...',
                'Son! where are you? I\'m done!',
                '...',
                'Son?',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '6')],
            ),
            '6': ConversationUnit(
              texts: [
                'Your call falls on deaf ears...',
                'You cannot find your son...',
                'Your son is not here...',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '7')],
            ),
            '7': ConversationUnit(
              character: Character.cole,
              texts: ['SON!!!', 'WHERE ARE YOU???', 'SONN!!!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '8')],
            ),
            '8': ConversationUnit(
              texts: ['COLE!!!'],
              choices: [ConversationChoice(text: 'Next', nextFrameId: '7')],
            ),
          },
          gameStage: GameStage.cliff,
        ),
        '7': ConversationFrame(
          conversations: {
            '0': ConversationUnit(
              character: Character.cole,
              texts: ['!!!'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '1')],
            ),
            '1': ConversationUnit(
              character: Character.lukas,
              texts: ['Cole! you\'re finally awake!', 'Thank God...'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '2')],
            ),
            '2': ConversationUnit(
              character: Character.cole,
              texts: ['What happened? did we kill the alligator?'],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '3')],
            ),
            '3': ConversationUnit(
              character: Character.lukas,
              texts: [
                'Yeahh you did it.',
                'When you stabbed it\'s neck it bled to death.',
                'But it\'s body fell on top of you and you fainted right after.',
                'Don\'t worry though, I\'ll take care of your wounds, you just keep laying there for a bit longer!',
              ],
              choices: [ConversationChoice(text: 'Next', nextUnitId: '4')],
            ),
            '4': ConversationUnit(
              texts: [
                'As you lay on the ground, you thought about what just happened to you.',
                'You try to remember your way here, did Lukas moved you when you slept perhaps?',
                'Does he even realize? since when was there a giant castle behind him?',
                'Could it be a heat haze? but it looks way too real.',
                'This castle must be bigger than any you\'ve seen before, it\'s definitely bigger than the one in your town.',
                'You would\'ve seen it over the horizon, perhaps it was invisible to the naked eye unless you get close? or could it be that the castle itself moved to find you?',
                'Whichever it is, this is the destination you\'ve been looking for, this is where everything will be decided.',
                'You both must prepare yourself before going to the last leg of your journey, could you find what you\'re looking for and make it out alive?',
                'No one could know until it happens, your destiny shall be for you to decide.',
              ],
              choices: [ConversationChoice(text: 'Next')],
            ),
          },
          gameStage: GameStage.desert,
        ),
      },
      onComplete: widget.onComplete,
    );
  }
}
