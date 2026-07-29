import 'package:flutter/material.dart';
import 'package:my_portfolio/core/presentation/layout/responsive_screen_shell.dart';
import 'package:my_portfolio/core/theme/font_manager.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenShell(
      title: 'KYLA BALIAO',
      actions: [
        TextButton(onPressed: () {}, child: const Text('Skills')),
        TextButton(onPressed: () {}, child: const Text('Projects')),
      ],
      // Just pass your widgets here!
      children: const [
        Text(
          'Hello, World!',
          style: TextStyle(
            fontFamily: FontManager.fontFamily,
            fontSize: FontSize.s20,
            fontWeight: FontWeightManager.semiBold,
          ),
        ), // Right item on Desktop, Bottom item on Mobile
      ],
    );
  }
}
