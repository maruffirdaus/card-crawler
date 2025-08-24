import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../../game_card/base/boss_fight_game_card.dart';
import '../boss_fight_game_card_widget.dart';

class BossFightGameCardEffectTriggeredPopup extends StatelessWidget {
  const BossFightGameCardEffectTriggeredPopup({
    super.key,
    required this.onDismiss,
    required this.card,
    required this.cardWidth,
  });

  final Function() onDismiss;
  final BossFightGameCard card;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: cardWidth,
            child: BossFightGameCardWidget(card: card),
          ),
          Text(
            'Effect triggered: ${card.effect.name}',
            style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
            textAlign: TextAlign.center,
          ),
          Text(
            card.effect.description,
            style: TextStyle(color: Colors.white70, fontSize: 24 * uiScale),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
