import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double uiScale() {
    final double screenWidth = MediaQuery.of(this).size.width;
    return screenWidth < 960 ? 0.75 : 1.0;
  }

  bool isSmallScreen() {
    final double screenWidth = MediaQuery.of(this).size.width;
    return screenWidth < 960;
  }
}
