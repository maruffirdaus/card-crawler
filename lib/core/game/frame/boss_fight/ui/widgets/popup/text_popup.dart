import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

class TextPopup extends StatelessWidget {
  const TextPopup({super.key, required this.onDismiss, required this.text});

  final Function() onDismiss;
  final String text;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
        textAlign: TextAlign.center,
      ),
    );
  }
}
