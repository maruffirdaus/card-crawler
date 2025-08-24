import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

class TurnSkippedPopup extends StatelessWidget {
  const TurnSkippedPopup({super.key, required this.onDismiss});

  final Function() onDismiss;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Text(
        'Turn skipped',
        style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
        textAlign: TextAlign.center,
      ),
    );
  }
}
