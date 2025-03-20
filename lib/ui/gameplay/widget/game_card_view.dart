import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

import '../../../model/game_card.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({super.key, required this.card, required this.onTap});

  final GameCard card;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double uiScale = context.uiScale();

    return InkWell(
      onTap: onTap,
      onHighlightChanged: (_) {
        FocusScope.of(context).unfocus();
      },
      onHover: (_) {
        FocusScope.of(context).unfocus();
      },
      focusColor: Colors.white.withValues(alpha: 0.7),
      hoverColor: Colors.white.withValues(alpha: 0.5),
      highlightColor: Colors.white.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(12.0),
      child: AspectRatio(
        aspectRatio: gameCardAspectRatio,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          margin: EdgeInsets.all(4.0 * uiScale),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(6.0 * uiScale),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Stack(
                children: [
                  Center(child: card.spriteAsset.isNotEmpty ? Image.asset(card.spriteAsset) : Text('🧌', style: TextStyle(fontSize: 64.0 * uiScale),)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 36.0 * uiScale,
                      height: 36.0 * uiScale,
                      child: Center(child: card.iconAsset.isNotEmpty ? Image.asset(card.iconAsset) : Text('💀', style: TextStyle(fontSize: 24.0 * uiScale),)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 36.0 * uiScale,
                      height: 36.0 * uiScale,
                      child: Center(
                        child: Text(
                          card.value.toString(),
                          style: TextStyle(
                            fontSize: 24.0 * uiScale,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
