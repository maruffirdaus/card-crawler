import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      width: 320.0 * context.uiScale(),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
