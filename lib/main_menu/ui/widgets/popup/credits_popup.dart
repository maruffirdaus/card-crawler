import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/popup_scrim.dart';
import 'package:card_crawler/main_menu/types/license_type.dart';
import 'package:card_crawler/main_menu/ui/widgets/credit_item.dart';
import 'package:flutter/material.dart';

class CreditsPopup extends StatelessWidget {
  const CreditsPopup({super.key, required this.onDismiss});

  final Function() onDismiss;

  @override
  Widget build(BuildContext context) {
    double uiScale = context.uiScale();

    return PopupScrim(
      onDismiss: onDismiss,
      margin: EdgeInsets.all(64.0 * uiScale),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        width: 576.0 * uiScale + 48.0,
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreditItem(
                assetName: 'Backgrounds',
                assetSource: 'OpenGameArt.org',
                assetCreator: 'Nidhoggn',
                licenseType: LicenseType.cc0,
              ),
              Divider(),
              CreditItem(
                assetName: 'Roguelike/RPG Items',
                assetSource: 'OpenGameArt.org',
                assetCreator: 'Joe Williamson',
                licenseType: LicenseType.ccBySa30,
              ),
              Divider(),
              CreditItem(
                assetName: '16x16 Assorted RPG Icons',
                assetSource: 'itch.io',
                assetCreator: 'Shade',
                licenseType: LicenseType.cc0,
              ),
              Divider(),
              CreditItem(
                assetName: '16x16 16x16 Weapon RPG Icons',
                assetSource: 'itch.io',
                assetCreator: 'Shade',
                licenseType: LicenseType.cc0,
              ),
              Divider(),
              CreditItem(
                assetName:
                    'Free 16x16 Philippine Mythological Creature Sprites',
                assetSource: 'itch.io',
                assetCreator: 'Shade',
                licenseType: LicenseType.cc0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
