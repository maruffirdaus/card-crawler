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
            0: ConversationUnit(
              character: Character.bryan,
              text: 'Hello Vito!',
              choices: [
                ConversationChoice(text: 'Hi!', nextConversationUnitId: 1),
              ],
            ),
            1: ConversationUnit(
              character: Character.bryan,
              text: 'How do you do!',
              choices: [
                ConversationChoice(
                  text: 'Fine, thanks!',
                  nextConversationUnitId: 2,
                ),
                ConversationChoice(text: 'Go away!', nextConversationUnitId: 3),
              ],
            ),
            2: ConversationUnit(
              character: Character.bryan,
              text: 'Good',
              choices: [
                ConversationChoice(text: 'Yeah', nextConversationUnitId: 4),
              ],
            ),
            3: ConversationUnit(
              character: Character.bryan,
              text: 'Damn you!',
              choices: [
                ConversationChoice(
                  text: 'Don\'t care',
                  nextConversationUnitId: 4,
                ),
              ],
            ),
            4: ConversationUnit(
              character: Character.vito,
              text: 'I need to go away',
              choices: [
                ConversationChoice(text: 'Go', nextFrameId: 1),
                ConversationChoice(
                  text: 'I want something cold',
                  nextFrameId: 2,
                ),
              ],
            ),
          },
          gameStage: GameStage.s0,
        ),
        1: CoreGameFrame(
          gameCards: AccessoryGameCard.entries,
          gameStage: GameStage.s0,
          nextId: 2,
        ),
        2: CoreGameFrame(
          gameCards: ConsumableGameCard.entries,
          gameStage: GameStage.s1,
        ),
      },
    );
  }
}
