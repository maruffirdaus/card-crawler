import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../../game_card/base/game_card.dart';
import '../game_card_widget.dart';

class GameCardEffectTriggeredPopup extends StatelessWidget {
  const GameCardEffectTriggeredPopup({
    super.key,
    required this.onDismiss,
    required this.card,
    required this.cardWidth,
  });

  final Function() onDismiss;
  final GameCard card;
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
            child: GameCardWidget(card: card),
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
