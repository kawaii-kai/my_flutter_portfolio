import 'package:flutter/material.dart';

class AdaptiveFlex extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  
  // Expose optional alignment controls with sensible defaults
  final CrossAxisAlignment desktopCrossAxisAlignment;
  final CrossAxisAlignment mobileCrossAxisAlignment;

  const AdaptiveFlex({
    super.key,
    required this.children,
    this.spacing = 24.0,
    this.desktopCrossAxisAlignment = CrossAxisAlignment.center,
    this.mobileCrossAxisAlignment = CrossAxisAlignment.start, // Left-align for mobile
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 700;

        if (isDesktop) {
          return Row(
            crossAxisAlignment: desktopCrossAxisAlignment,
            children: _buildRowChildren(),
          );
        }

        return Column(
          crossAxisAlignment: mobileCrossAxisAlignment,
          children: _buildColumnChildren(),
        );
      },
    );
  }

  // Desktop: Wraps items in Expanded and adds horizontal spacing
  List<Widget> _buildRowChildren() {
    final List<Widget> items = [];
    for (int i = 0; i < children.length; i++) {
      items.add(Expanded(child: children[i]));
      if (i < children.length - 1) {
        items.add(SizedBox(width: spacing));
      }
    }
    return items;
  }

  // Mobile: Spreads items vertically with spacing
  List<Widget> _buildColumnChildren() {
    final List<Widget> items = [];
    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (i < children.length - 1) {
        items.add(SizedBox(height: spacing));
      }
    }
    return items;
  }
}