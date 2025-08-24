import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/game_card_aspect_ratio.dart';
import '../../../game_card/base/game_card.dart';
import '../../../types/game_card_location.dart';
import '../game_card_widget.dart';

class GraveyardPopup extends StatelessWidget {
  const GraveyardPopup({
    super.key,
    required this.onDismiss,
    required this.cards,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardWithVisibleEffectDescription,
  });

  final Function() onDismiss;
  final List<GameCard> cards;
  final double cardWidth;
  final Function(int) onCardTap;
  final (GameCardLocation?, int) cardWithVisibleEffectDescription;

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
        width: 576.0 * uiScale + 48.0,
        clipBehavior: Clip.antiAlias,
        child: GridView.builder(
          padding: EdgeInsets.all(24.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: gameCardAspectRatio,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final reversedIndex = cards.length - 1 - index;

            return SizedBox(
              width: cardWidth,
              child: GameCardWidget(
                card: cards[reversedIndex],
                onTap: () {
                  onCardTap(reversedIndex);
                },
                isEffectDescriptionVisible:
                    cardWithVisibleEffectDescription ==
                    (GameCardLocation.graveyard, reversedIndex),
                selectionColor: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
