import 'package:card_crawler/core/foundation/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../game_card/base/game_card.dart';
import '../../types/game_card_location.dart';
import '../game_card_widget.dart';

class ReplaceEquipmentCardPopup extends StatelessWidget {
  const ReplaceEquipmentCardPopup({
    super.key,
    required this.accessoryCards,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardWithVisibleEffectDescription,
  });

  final List<GameCard> accessoryCards;
  final double cardWidth;
  final Function(int) onCardTap;
  final (GameCardLocation?, int) cardWithVisibleEffectDescription;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: null,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select a card to be replaced',
            style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(accessoryCards.length, (index) {
              final bool isEffectDescriptionVisible =
                  cardWithVisibleEffectDescription ==
                  (GameCardLocation.accessories, index);

              return SizedBox(
                width: cardWidth,
                child: GameCardWidget(
                  card: accessoryCards[index],
                  onTap: () {
                    onCardTap(index);
                  },
                  isEffectDescriptionVisible: isEffectDescriptionVisible,
                  additionalActionDescription: 'TAP TO REPLACE',
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
