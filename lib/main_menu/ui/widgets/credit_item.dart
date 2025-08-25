import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/main_menu/types/license_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditItem extends StatelessWidget {
  const CreditItem({
    super.key,
    required this.assetName,
    required this.assetSource,
    required this.assetCreator,
    required this.licenseType,
  });

  final String assetName;
  final String assetSource;
  final String assetCreator;
  final LicenseType licenseType;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final Uri uri = Uri.parse(licenseType.url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch ${licenseType.url}';
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        overlayColor: Colors.black,
      ),
      child: Text(
        '$assetName from $assetSource by $assetCreator, licensed under ${licenseType.name}.',
        style: TextStyle(fontSize: 16.0 * context.uiScale()),
      ),
    );
  }
}
