import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/boss_fight/provider/boss_fight_provider.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/boss_fight_game_card_widget.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/boss_actions_popup.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/boss_fight_game_card_effect_triggered_popup.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/player_equipments_popup.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/replace_player_equipment_game_card_popup.dart';
import 'package:card_crawler/core/game/frame/boss_fight/ui/widgets/popup/text_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/ui/widgets/empty_game_card.dart';
import '../../common/ui/widgets/popup/game_finished_popup.dart';
import '../../common/ui/widgets/popup/pause_menu_popup.dart';
import '../boss_fight_frame.dart';
import '../game_card/base/boss_fight_game_card.dart';
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
              case ReplacePlayerEquipmentCard():
                {}
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
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: FilledButton(
                              onPressed: () {
                                provider.uiAction(Pause());
                              },
                              style: buttonStyle,
                              child: Text('PAUSE', style: buttonTextStyle),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: componentWidth * 0.75,
                                    color: Color(0xFFF24822),
                                  ),
                                  Text(
                                    provider.playerHealth.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0 * uiScale,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.0 * uiScale),
                              provider.playerEquipmentCards.isNotEmpty
                                  ? BossFightGameCardWidget(
                                      card: provider.playerEquipmentCards.last,
                                      onTap: () {
                                        provider.uiAction(
                                          ShowPlayerEquipments(),
                                        );
                                      },
                                    )
                                  : EmptyGameCard(),
                              SizedBox(height: 24.0 * uiScale),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(provider.boss.sprite),
                      SizedBox(
                        width: 576.0 * uiScale,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            final BossFightGameCard? card =
                                provider.fieldCards[index];
                            final bool isEffectDescriptionVisible =
                                provider.cardWithVisibleEffectDescription ==
                                (BossFightGameCardLocation.field, index);

                            return SizedBox(
                              width: cardWidth,
                              child: card != null
                                  ? BossFightGameCardWidget(
                                      card: card,
                                      onTap: () {
                                        isEffectDescriptionVisible
                                            ? provider.action(
                                                SelectCardFromField(
                                                  card: card,
                                                  index: index,
                                                ),
                                              )
                                            : provider.uiAction(
                                                TapCard(
                                                  location:
                                                      BossFightGameCardLocation
                                                          .field,
                                                  index: index,
                                                ),
                                              );
                                      },
                                      isEffectDescriptionVisible:
                                          isEffectDescriptionVisible,
                                      additionalActionDescription:
                                          'TAP TO SELECT',
                                    )
                                  : EmptyGameCard(),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(height: 24.0 * uiScale),
                              provider.bossActionCards.isNotEmpty
                                  ? BossFightGameCardWidget(
                                      card: provider.bossActionCards.last,
                                      onTap: () {
                                        provider.uiAction(ShowBossActions());
                                      },
                                    )
                                  : EmptyGameCard(),
                              SizedBox(height: 24.0 * uiScale),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: componentWidth * 0.75,
                                    color: Color(0xFFF24822),
                                  ),
                                  Text(
                                    provider.bossHealth.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0 * uiScale,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: FilledButton(
                              onPressed: () {
                                provider.action(Renew());
                              },
                              style: buttonStyle,
                              child: Text('RENEW', style: buttonTextStyle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (provider.state is PlayerTurn)
                TextPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  text: 'Your turn',
                ),
              if (provider.state is BossTurn)
                TextPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  text: 'Enemy\'s turn',
                ),
              if (provider.state is ReplacingPlayerEquipmentGameCard)
                ReplacePlayerEquipmentGameCardPopup(
                  playerEquipmentCards: provider.playerEquipmentCards,
                  cardWidth: cardWidth,
                  onCardTap: (index) {
                    final bool isEffectDescriptionVisible =
                        provider.cardWithVisibleEffectDescription ==
                        (BossFightGameCardLocation.equipments, index);

                    if (isEffectDescriptionVisible) {
                      provider.action(
                        ReplacePlayerEquipmentCard(
                          card: provider.playerEquipmentCards[index],
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
                  card:
                      (provider.state as BossFightGameCardEffectTriggered).card,
                  cardWidth: cardWidth,
                ),
              if (provider.state is PlayerTurnSkipped)
                TextPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  text: 'Your turn skipped',
                ),
              if (provider.state is BossTurnSkipped)
                TextPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  text: 'Enemy\'s turn skipped',
                ),
              if (provider.state is PlayerEquipmentsShown)
                PlayerEquipmentsPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  cards: provider.playerEquipmentCards,
                  cardWidth: cardWidth,
                  onCardTap: (index) {
                    provider.uiAction(
                      TapCard(
                        location: BossFightGameCardLocation.equipments,
                        index: index,
                      ),
                    );
                  },
                  cardWithVisibleEffectDescription:
                      provider.cardWithVisibleEffectDescription,
                ),
              if (provider.state is BossActionsShown)
                BossActionsPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  cards: provider.bossActionCards.toList(),
                  cardWidth: cardWidth,
                  onCardTap: (index) {
                    provider.uiAction(
                      TapCard(
                        location: BossFightGameCardLocation.bossActions,
                        index: index,
                      ),
                    );
                  },
                  cardWithVisibleEffectDescription:
                      provider.cardWithVisibleEffectDescription,
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
