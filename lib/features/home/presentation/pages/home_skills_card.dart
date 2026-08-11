import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';
import 'package:my_portfolio/features/home/presentation/widgets/build_skill_category.dart';
import 'package:my_portfolio/features/home/presentation/widgets/section_badge_tag.dart';
import 'package:my_portfolio/features/home/presentation/widgets/section_header.dart';

class HomeSkillsCard extends StatelessWidget {
  final double maxWidth;  
  final bool isMobile;
  const HomeSkillsCard({super.key, required this.maxWidth, required this.isMobile});

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: EdgeInsets.all(isMobile ? 20 : 36),
      decoration: BoxDecoration(
        color: const Color(0xFF141622).withOpacity(0.88),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionBadgeTag('SLIDE 3 • TECHNICAL SKILLS'),
          const SizedBox(height: 24),
          SectionHeader(icon: Icons.code, title: AppStrings.skillsTitle),
          const SizedBox(height: 16),
          BuildSkillCategory(
            title: 'Mobile Development',
            items: AppStrings.skillMobileDev,
          ),
          BuildSkillCategory(
            title: 'Flutter Framework',
            items: AppStrings.skillFlutter,
          ),
          BuildSkillCategory(
            title: 'API & Backend Integration',
            items: AppStrings.skillApiBackend,
          ),
          BuildSkillCategory(
            title: 'Android Development',
            items: AppStrings.skillAndroidDev,
          ),
          BuildSkillCategory(
            title: 'iOS Development',
            items: AppStrings.skillIosDev,
          ),
          BuildSkillCategory(
            title: 'Build & DevOps',
            items: AppStrings.skillBuildDevOps,
          ),
          BuildSkillCategory(
            title: 'Security & Debugging',
            items: AppStrings.skillSecurity,
          ),
          BuildSkillCategory(
            title: 'Tooling & Additional',
            items: '${AppStrings.skillTooling} | ${AppStrings.skillAdditional}',
          ),
        ],
      ),
    );
  }
  }
