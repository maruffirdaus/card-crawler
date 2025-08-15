import 'package:card_crawler/core/foundation/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/core_game/widgets/popup/popup_scrim.dart';
import 'package:flutter/material.dart';

import '../../../../../foundation/widgets/menu_container.dart';
import '../../../../../foundation/widgets/menu_item.dart';

class PauseMenuPopup extends StatelessWidget {
  const PauseMenuPopup({
    super.key,
    required this.onDismiss,
    required this.onRestart,
    required this.onSave,
    required this.onExit,
  });

  final Function() onDismiss;
  final Function()? onRestart;
  final Function()? onSave;
  final Function()? onExit;

  @override
  Widget build(BuildContext context) {
    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * context.uiScale()),
      child: MenuContainer(
        children: [
          MenuItem(title: 'RESTART', onPressed: onRestart),
          MenuItem(title: 'SAVE', onPressed: onSave),
          MenuItem(title: 'EXIT', onPressed: onExit),
        ],
      ),
    );
  }
}
