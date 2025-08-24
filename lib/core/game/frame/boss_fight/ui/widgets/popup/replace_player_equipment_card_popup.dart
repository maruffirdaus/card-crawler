import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:card_crawler/core/game/frame/boss_fight/game_card/base/boss_fight_game_card.dart';
import 'package:flutter/material.dart';

import '../../../types/boss_fight_game_card_location.dart';
import '../boss_fight_game_card_widget.dart';

class ReplaceEquipmentCardPopup extends StatelessWidget {
  const ReplaceEquipmentCardPopup({
    super.key,
    required this.playerEquipmentCards,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardWithVisibleEffectDescription,
  });

  final List<BossFightGameCard> playerEquipmentCards;
  final double cardWidth;
  final Function(int) onCardTap;
  final (BossFightGameCardLocation?, int) cardWithVisibleEffectDescription;

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
            children: List.generate(playerEquipmentCards.length, (index) {
              final bool isEffectDescriptionVisible =
                  cardWithVisibleEffectDescription ==
                  (BossFightGameCardLocation.equipments, index);

              return SizedBox(
                width: cardWidth,
                child: BossFightGameCardWidget(
                  card: playerEquipmentCards[index],
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
