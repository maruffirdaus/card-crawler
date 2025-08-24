import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/game_card_aspect_ratio.dart';

class EmptyGameCard extends StatelessWidget {
  const EmptyGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0 * context.uiScale()),
      child: AspectRatio(
        aspectRatio: gameCardAspectRatio,
        child: DottedBorder(
          color: Colors.black,
          borderType: BorderType.RRect,
          radius: Radius.circular(8.0),
          child: SizedBox(),
        ),
      ),
    );
  }
}
