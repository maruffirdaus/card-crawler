import 'package:flutter/material.dart';

class PopupScrim extends StatelessWidget {
  const PopupScrim({
    super.key,
    required this.onDismiss,
    this.margin,
    required this.child,
  });

  final Function()? onDismiss;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDismiss,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withValues(alpha: 0.6),
        child: Center(
          child: Padding(padding: margin ?? EdgeInsets.all(0), child: child),
        ),
      ),
    );
  }
}
