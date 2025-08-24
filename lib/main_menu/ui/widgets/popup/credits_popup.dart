import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:flutter/material.dart';

class CreditsPopup extends StatelessWidget {
  const CreditsPopup({super.key, required this.onDismiss});

  final Function() onDismiss;

  @override
  Widget build(BuildContext context) {
    return PopupScrim(
      onDismiss: onDismiss,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        width: 576.0 * context.uiScale() + 48.0,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Backgrounds from OpenGameArt.org by Nidhoggn, licensed under CC0.',
              ),
              Text(
                'Roguelike/RPG Items from OpenGameArt.org by Joe Williamson, licensed under CC BY-SA 3.0.',
              ),
              Text(
                '16x16 Assorted RPG Icons from itch.io by Shade, licensed under CC0.',
              ),
              Text(
                '16x16 Weapon RPG Icons from itch.io by Shade, licensed under CC0.',
              ),
              Text(
                'Free 16x16 Philippine Mythological Creature Sprites from itch.io by Shade, licensed under CC0.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
