import 'package:flutter/material.dart';

class SideSection extends StatelessWidget {
  const SideSection({
    super.key,
    required this.width,
    required this.topContent,
    required this.cardContent,
    required this.bottomContent,
  });

  final double width;
  final Widget topContent;
  final Widget cardContent;
  final Widget bottomContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Expanded(child: topContent),
          cardContent,
          Expanded(child: bottomContent),
        ],
      ),
    );
  }
}
