
import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_screen_shell.dart';
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
      children: [
        SizedBox(height: 20),
        Center(child: SocialDeviceDashboard()),

        SizedBox(height: 60),
      ],
    );
  }
}
