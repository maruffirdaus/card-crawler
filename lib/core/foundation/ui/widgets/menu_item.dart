import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.title, required this.onPressed});

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          overlayColor: Colors.black,
          padding: EdgeInsets.zero,
          fixedSize: Size(double.infinity, 48.0 * uiScale),
        ),
        child: Text(title, style: TextStyle(fontSize: 24.0 * uiScale)),
      ),
    );
  }
}
