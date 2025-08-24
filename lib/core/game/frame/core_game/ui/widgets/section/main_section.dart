import 'package:flutter/material.dart';

class MainSection extends StatelessWidget {
  const MainSection({
    super.key,
    required this.width,
    required this.topContent,
    required this.bottomContent,
  });

  final double width;
  final Widget topContent;
  final Widget bottomContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [topContent, bottomContent],
      ),
    );
  }
}
