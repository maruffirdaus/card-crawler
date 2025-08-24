import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../../../common/ui/widgets/empty_game_card.dart';
import '../../../game_card/base/boss_fight_game_card.dart';
import '../../../types/boss_fight_game_card_location.dart';
import '../boss_fight_game_card_widget.dart';

class BossActionsPopup extends StatelessWidget {
  const BossActionsPopup({
    super.key,
    required this.onDismiss,
    required this.cards,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardWithVisibleEffectDescription,
  });

  final Function() onDismiss;
  final List<BossFightGameCard> cards;
  final double cardWidth;
  final Function(int) onCardTap;
  final (BossFightGameCardLocation?, int) cardWithVisibleEffectDescription;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        width: 432.0 * uiScale + 48.0,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: List.generate(3, (index) {
              final reversedIndex = cards.length - 1 - index;
              final BossFightGameCard? card =
                  reversedIndex >= 0 && reversedIndex < cards.length
                  ? cards[reversedIndex]
                  : null;
              final bool isEffectDescriptionVisible =
                  cardWithVisibleEffectDescription ==
                  (BossFightGameCardLocation.bossActions, index);

              return SizedBox(
                width: cardWidth,
                child: card != null
                    ? BossFightGameCardWidget(
                        card: card,
                        onTap: () {
                          onCardTap(index);
                        },
                        isEffectDescriptionVisible: isEffectDescriptionVisible,
                      )
                    : EmptyGameCard(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
