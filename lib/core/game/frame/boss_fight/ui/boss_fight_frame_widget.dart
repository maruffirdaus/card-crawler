import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/boss_fight/provider/boss_fight_provider.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/boss_fight_game_card_effect_triggered_popup.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/replace_player_equipment_game_card_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/ui/widgets/popup/game_finished_popup.dart';
import '../../common/ui/widgets/popup/pause_menu_popup.dart';
import '../boss_fight_frame.dart';
import '../types/boss_fight_action.dart';
import '../types/boss_fight_game_card_location.dart';
import '../types/boss_fight_state.dart';
import '../types/boss_fight_ui_action.dart';

class BossFightFrameWidget extends StatefulWidget {
  const BossFightFrameWidget({
    super.key,
    required this.onComplete,
    required this.bossFightFrame,
  });

  final Function(String?) onComplete;
  final BossFightFrame bossFightFrame;

  @override
  State<BossFightFrameWidget> createState() => _BossFightFrameWidgetState();
}

class _BossFightFrameWidgetState extends State<BossFightFrameWidget> {
  late BossFightProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = BossFightProvider();
    _provider.init(
      data: widget.bossFightFrame.data,
      boss: widget.bossFightFrame.boss,
      playerGameCards: widget.bossFightFrame.playerGameCards,
      bossGameCards: widget.bossFightFrame.bossGameCards,
      gameStage: widget.bossFightFrame.gameStage,
    );
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BossFightProvider>.value(
      value: _provider,
      child: _BossFightFrameContent(
        onComplete: () {
          widget.onComplete(widget.bossFightFrame.nextId);
        },
        onRestart: () {
          _provider.init(
            boss: widget.bossFightFrame.boss,
            playerGameCards: widget.bossFightFrame.playerGameCards,
            bossGameCards: widget.bossFightFrame.bossGameCards,
            gameStage: widget.bossFightFrame.gameStage,
          );
        },
      ),
    );
  }
}

class _BossFightFrameContent extends StatelessWidget {
  const _BossFightFrameContent({
    required this.onComplete,
    required this.onRestart,
  });

  final Function() onComplete;
  final Function() onRestart;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();
    final double cardWidth = 144.0 * uiScale;
    final double componentWidth = 96.0 * uiScale;
    final ButtonStyle buttonStyle = FilledButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Color(0xFFD1FFFA),
      disabledForegroundColor: Colors.black,
      disabledBackgroundColor: Color(0xFFFFAAA4),
      overlayColor: Colors.black,
      padding: EdgeInsets.zero,
      fixedSize: Size(componentWidth, 48.0 * uiScale),
    );
    final TextStyle buttonTextStyle = TextStyle(fontSize: 24.0 * uiScale);

    return Consumer<BossFightProvider>(
      builder: (context, provider, child) {
        return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (didPop) return;

              switch (provider.state) {
                case Playing():
                  provider.uiAction(Pause());
                case Finished():
                  {
                    (provider.state as Finished).isWin
                        ? onComplete()
                        : onRestart();
                  }
                default:
                  provider.uiAction(DismissPopup());
              }
            },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  provider.gameStage.background,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
              ),
              if (provider.state is ReplacingPlayerEquipmentGameCard)
                ReplacePlayerEquipmentGameCardPopup(
                  playerEquipmentCards: provider.equipmentCards,
                  cardWidth: cardWidth,
                  onCardTap: (index) {
                    final bool isEffectDescriptionVisible =
                        provider.cardWithVisibleEffectDescription ==
                            (BossFightGameCardLocation.equipments, index);

                    if (isEffectDescriptionVisible) {
                      provider.action(
                        ReplacePlayerEquipmentCard(
                          card: provider.equipmentCards[index],
                          index: index,
                        ),
                      );
                    } else {
                      provider.uiAction(
                        TapCard(
                          location: BossFightGameCardLocation.equipments,
                          index: index,
                        ),
                      );
                    }
                  },
                  cardWithVisibleEffectDescription:
                  provider.cardWithVisibleEffectDescription,
                ),
              if (provider.state is BossFightGameCardEffectTriggered)
                BossFightGameCardEffectTriggeredPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  card: (provider.state as BossFightGameCardEffectTriggered).card,
                  cardWidth: cardWidth,
                ),
              if (provider.state is Finished)
                GameFinishedPopup(
                  onDismiss: () {
                    (provider.state as Finished).isWin
                        ? onComplete()
                        : onRestart();
                  },
                  isWin: (provider.state as Finished).isWin,
                ),
              if (provider.state is Paused)
                PauseMenuPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  onRestart: onRestart,
                  onSave: null,
                  onExit: () {
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
