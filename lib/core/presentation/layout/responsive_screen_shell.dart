import 'package:flutter/material.dart';
import 'package:my_portfolio/core/presentation/layout/adaptive_flex.dart';

class ResponsiveScreenShell extends StatelessWidget {

  final List<Widget>? children;
  final Widget? mobile;
  final Widget? desktop;

  final String? title;
  final List<Widget>? actions;
  final double maxWidth;

  const ResponsiveScreenShell({
    super.key,
    this.children,
    this.mobile,
    this.desktop,
    this.title,
    this.actions,
    this.maxWidth = 1200, 
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;

        return Scaffold(
          appBar: AppBar(
            title: title != null ? Text(title!) : null,
            actions: isMobile ? null : actions,
          ),
          drawer: isMobile && actions != null
              ? Drawer(
                  child: ListView(
                    children: actions!,
                  ),
                )
              : null,
          body: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16.0 : 32.0,
                    vertical: 24.0,
                  ),
                  child: _resolveBody(width),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _resolveBody(double width) {
    if (width >= 1000 && desktop != null) {
      return desktop!;
    }
    if (mobile != null) {
      return mobile!;
    }

    if (children != null && children!.isNotEmpty) {
      return AdaptiveFlex(children: children!);
    }

    return const SizedBox.shrink();
  }
}