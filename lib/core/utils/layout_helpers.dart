// lib/core/presentation/utils/layout_helpers.dart

import 'package:flutter/material.dart';

class LayoutHelpers {
  /// Resolves layout based on screen width matching mobile, desktop, or fallback children.
  static Widget resolveBodyLayout({
    required double width,
    Widget? mobile,
    Widget? desktop,
    List<Widget>? children,
    double mobileBreakpoint = 600,
  }) {
    if (mobile != null && width < mobileBreakpoint) {
      return mobile;
    }
    if (desktop != null && width >= mobileBreakpoint) {
      return desktop;
    }
    if (children != null) {
      return Column(children: children);
    }
    return const SizedBox.shrink();
  }

  /// Adds uniform padding to a list of action widgets (great for drawers or app bars).
  static List<Widget>? styleActions(List<Widget>? actions, {EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8)}) {
    if (actions == null) return null;
    return actions.map((action) {
      return Padding(
        padding: padding,
        child: action,
      );
    }).toList();
  }
}