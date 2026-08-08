import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/presentation/layout/responsive_screen_shell.dart';
import 'package:my_portfolio/config/theme/font_manager.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_hero_header.dart';
import 'package:my_portfolio/features/home/presentation/pages/social_service_dashboard.dart';

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
      children: [
        HomeHeroHeader(),

        SizedBox(height: 20),

        // 2. Bottom Section: Social Media Device Dashboard
        Center(child: SocialDeviceDashboard()),

        SizedBox(height: 60),
      ],
    );
  }
}
