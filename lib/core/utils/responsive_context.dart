import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  // Screen dimensions
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Breakpoint checks
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1000;
  bool get isDesktop => screenWidth >= 1000;
}
