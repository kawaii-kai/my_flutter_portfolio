import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_screen_shell.dart';
import 'package:my_portfolio/features/slide_1_home_intro/home_intro_badge.dart';
import 'package:my_portfolio/features/slide_2_professional_summary/home_hero_header.dart';
import 'package:my_portfolio/features/slide_3_technical_skills/home_skills_card.dart';
import 'package:my_portfolio/features/slide_4_work_experience/home_experience_card.dart';
import 'package:my_portfolio/features/slide_5_projects/home_projects_education_badge.dart';
import 'package:my_portfolio/features/slide_6_device_social/social_service_dashboard.dart';
import 'package:my_portfolio/features/slide_skills_card/technical_skills_screen.dart';

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

      // =======================================================================
      //? 1. FIXED OVERLAY SLIDES (SLIDES 1 & 2)
      // =======================================================================
      slide1Intro: (isMobile, maxWidth) => HomeIntroBadge(isMobile: isMobile),
      slide2Header: (isMobile, maxWidth) => const HomeHeroHeader(),

      // =======================================================================
      //? 2. SCROLLING SLIDES PIPELINE (SLIDES 3 ONWARD)
      // Pass builder functions that receive (isMobile, maxWidth) dynamically
      // =======================================================================
      slideBuilders: [
        //? Slide 3
        (isMobile, maxWidth) =>
            HomeExperienceCard(isMobile: isMobile, maxWidth: maxWidth),

        //? Slide 4
        (isMobile, maxWidth) =>
            HomeSkillsCard(isMobile: isMobile, maxWidth: maxWidth),

        //? Slide 5
        (isMobile, maxWidth) =>
            HomeProjectsEducationBadge(isMobile: isMobile, maxWidth: maxWidth),

        //? Slide 6
        (isMobile, maxWidth) =>
            TechnicakSkillsScreen(isMobile: isMobile, maxWidth: maxWidth),

        //? Slide 7
        (isMobile, maxWidth) => const Center(child: SocialDeviceDashboard()),
      ],
    );
  }
}
