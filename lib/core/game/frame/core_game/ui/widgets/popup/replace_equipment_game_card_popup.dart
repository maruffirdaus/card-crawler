import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../../game_card/base/game_card.dart';
import '../../../types/game_card_location.dart';
import '../game_card_widget.dart';

class ReplaceEquipmentGameCardPopup extends StatelessWidget {
  const ReplaceEquipmentGameCardPopup({
    super.key,
    required this.equipmentCards,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardWithVisibleEffectDescription,
  });

  final List<GameCard> equipmentCards;
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
            children: List.generate(equipmentCards.length, (index) {
              final bool isEffectDescriptionVisible =
                  cardWithVisibleEffectDescription ==
                  (GameCardLocation.equipments, index);

              return SizedBox(
                width: cardWidth,
                child: GameCardWidget(
                  card: equipmentCards[index],
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
