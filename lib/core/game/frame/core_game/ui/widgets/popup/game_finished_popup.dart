import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/core_game/ui/widgets/popup/popup_scrim.dart';
import 'package:flutter/material.dart';

class GameFinishedPopup extends StatelessWidget {
  const GameFinishedPopup({
    super.key,
    required this.onDismiss,
    required this.isWin,
  });

  final Function() onDismiss;
  final bool isWin;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Text(
        isWin ? 'You win! Tap to continue' : 'You lose! Tap to retry',
        style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
        textAlign: TextAlign.center,
      ),
    );
  }
}
