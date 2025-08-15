import 'package:card_crawler/core/foundation/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/core_game/core_game_frame.dart';
import 'package:card_crawler/core/game/frame/core_game/provider/core_game_provider.dart';
import 'package:card_crawler/core/game/frame/core_game/types/core_game_action.dart';
import 'package:card_crawler/core/game/frame/core_game/types/core_game_state.dart';
import 'package:card_crawler/core/game/frame/core_game/types/core_game_ui_action.dart';
import 'package:card_crawler/core/game/frame/core_game/types/game_card_location.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/empty_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/game_card_widget.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/card_effect_triggered_popup.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/game_finished_popup.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/graveyard_popup.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/pause_menu_popup.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/replace_accessory_card_popup.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/section/main_section.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/section/side_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/game_card_aspect_ratio.dart';
import '../common/game_card/game_card.dart';

class CoreGameFrameWidget extends StatefulWidget {
  const CoreGameFrameWidget({
    super.key,
    required this.onComplete,
    required this.coreGameFrame,
  });

  final Function(int) onComplete;
  final CoreGameFrame coreGameFrame;

  @override
  State<CoreGameFrameWidget> createState() => _CoreGameFrameWidgetState();
}

class _CoreGameFrameWidgetState extends State<CoreGameFrameWidget> {
  late CoreGameProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = CoreGameProvider();
    _provider.init(
      data: widget.coreGameFrame.data,
      gameCards: widget.coreGameFrame.gameCards,
      gameStage: widget.coreGameFrame.gameStage,
    );
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CoreGameProvider>.value(
      value: _provider,
      child: _CoreGameFrameContent(
        onComplete: () {
          widget.coreGameFrame.nextId != null
              ? widget.onComplete(widget.coreGameFrame.nextId!)
              : Navigator.of(context).pop();
        },
        coreGameFrame: widget.coreGameFrame,
      ),
    );
  }
}

class _CoreGameFrameContent extends StatelessWidget {
  const _CoreGameFrameContent({
    required this.onComplete,
    required this.coreGameFrame,
  });

  final Function() onComplete;
  final CoreGameFrame coreGameFrame;

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

    return Consumer<CoreGameProvider>(
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
                      : provider.init(
                          gameCards: coreGameFrame.gameCards,
                          gameStage: coreGameFrame.gameStage,
                        );
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
                  SideSection(
                    width: cardWidth,
                    topContent: Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 48.0 * uiScale,
                        child: Center(
                          child: Text(
                            'ROUND: ${provider.round.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0 * uiScale,
                            ),
                          ),
                        ),
                      ),
                    ),
                    cardContent: provider.deck.isNotEmpty
                        ? AspectRatio(
                            aspectRatio: gameCardAspectRatio,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  provider.deck.length.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 48.0 * uiScale,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : EmptyGameCard(),
                    bottomContent: Row(
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
                              provider.health.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0 * uiScale,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.shield,
                              size: componentWidth * 0.75,
                              color: Color(0xFF72849A),
                            ),
                            Text(
                              provider.durability.toString(),
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
                  MainSection(
                    width: 576.0 * uiScale,
                    topContent: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final GameCard? card =
                            provider.dungeonFieldCards[index];
                        final bool isEffectDescriptionVisible =
                            provider.cardWithVisibleEffectDescription ==
                            (GameCardLocation.dungeonField, index);

                        return SizedBox(
                          width: cardWidth,
                          child: card != null
                              ? GameCardWidget(
                                  card: card,
                                  onTap: () {
                                    isEffectDescriptionVisible
                                        ? provider.action(
                                            SelectCardFromDungeonField(
                                              card: card,
                                              index: index,
                                            ),
                                          )
                                        : provider.uiAction(
                                            TapCard(
                                              location:
                                                  GameCardLocation.dungeonField,
                                              index: index,
                                            ),
                                          );
                                  },
                                  isEffectDescriptionVisible:
                                      isEffectDescriptionVisible,
                                  additionalActionDescription: 'TAP TO SELECT',
                                )
                              : EmptyGameCard(),
                        );
                      }),
                    ),
                    bottomContent: Row(
                      children: [
                        SizedBox(
                          width: cardWidth,
                          child: provider.weaponCard != null
                              ? GameCardWidget(
                                  card: provider.weaponCard!,
                                  onTap: () {
                                    provider.uiAction(
                                      TapCard(
                                        location: GameCardLocation.weapon,
                                        index: 0,
                                      ),
                                    );
                                  },
                                  isEffectDescriptionVisible:
                                      provider
                                          .cardWithVisibleEffectDescription ==
                                      (GameCardLocation.weapon, 0),
                                )
                              : EmptyGameCard(),
                        ),
                        Row(
                          children: List.generate(3, (index) {
                            final GameCard? card =
                                index < provider.accessoryCards.length &&
                                    provider.state is! ReplacingAccessoryCard
                                ? provider.accessoryCards[index]
                                : null;
                            final bool isEffectDescriptionVisible =
                                provider.cardWithVisibleEffectDescription ==
                                (GameCardLocation.accessories, index);

                            return SizedBox(
                              width: cardWidth,
                              child: card != null
                                  ? GameCardWidget(
                                      card: card,
                                      onTap: () {
                                        provider.uiAction(
                                          TapCard(
                                            location:
                                                GameCardLocation.accessories,
                                            index: index,
                                          ),
                                        );
                                      },
                                      isEffectDescriptionVisible:
                                          isEffectDescriptionVisible,
                                    )
                                  : EmptyGameCard(),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SideSection(
                    width: cardWidth,
                    topContent: Center(
                      child: FilledButton(
                        onPressed: () {
                          provider.uiAction(Pause());
                        },
                        style: buttonStyle,
                        child: Text('PAUSE', style: buttonTextStyle),
                      ),
                    ),
                    cardContent: provider.graveyardCards.isNotEmpty
                        ? GameCardWidget(
                            card: provider.graveyardCards.last,
                            onTap: () {
                              provider.uiAction(ShowGraveyard());
                            },
                          )
                        : EmptyGameCard(),
                    bottomContent: Center(
                      child: FilledButton(
                        onPressed: provider.canFlee
                            ? () {
                                provider.action(Flee());
                                FocusScope.of(context).unfocus();
                              }
                            : null,
                        style: buttonStyle,
                        child: Text('FLEE', style: buttonTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
              if (provider.state is ReplacingAccessoryCard)
                ReplaceAccessoryCardPopup(
                  accessoryCards: provider.accessoryCards,
                  cardWidth: cardWidth,
                  onCardTap: (index) {
                    final bool isEffectDescriptionVisible =
                        provider.cardWithVisibleEffectDescription ==
                        (GameCardLocation.accessories, index);

                    if (isEffectDescriptionVisible) {
                      provider.action(
                        ReplaceAccessoryCard(
                          card: provider.accessoryCards[index],
                          index: index,
                        ),
                      );
                    } else {
                      provider.uiAction(
                        TapCard(
                          location: GameCardLocation.accessories,
                          index: index,
                        ),
                      );
                    }
                  },
                  cardWithVisibleEffectDescription:
                      provider.cardWithVisibleEffectDescription,
                ),
              if (provider.state is CardEffectTriggered)
                CardEffectTriggeredPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  card: (provider.state as CardEffectTriggered).card,
                  cardWidth: cardWidth,
                ),
              if (provider.state is GraveyardShown)
                GraveyardPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  cards: provider.graveyardCards,
                  cardWidth: cardWidth,
                  onCardTap: (index) {
                    provider.uiAction(
                      TapCard(
                        location: GameCardLocation.graveyard,
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
                        : provider.init(
                            gameCards: coreGameFrame.gameCards,
                            gameStage: coreGameFrame.gameStage,
                          );
                  },
                  isWin: (provider.state as Finished).isWin,
                ),
              if (provider.state is Paused)
                PauseMenuPopup(
                  onDismiss: () {
                    provider.uiAction(DismissPopup());
                  },
                  onRestart: () {
                    provider.init(
                      gameCards: coreGameFrame.gameCards,
                      gameStage: coreGameFrame.gameStage,
                    );
                  },
                  onSave: () {},
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
