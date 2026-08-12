import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';
import 'package:my_portfolio/features/slide_5_projects/info_chip.dart';
import 'package:my_portfolio/features/slide_5_projects/project_item.dart';
import 'package:my_portfolio/core/presentation/layout/seamless_divider.dart';
import 'package:my_portfolio/core/presentation/custom/section_badge_tag.dart';
import 'package:my_portfolio/features/slide_5_projects/section_header.dart';

class HomeProjectsEducationBadge extends StatelessWidget {
  final double maxWidth;
  final bool isMobile;
  const HomeProjectsEducationBadge({
    super.key,
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // =========================================================================
    //? CARD 3: PROJECTS, EDUCATION & CERTS (SLIDE 5)
    // =========================================================================
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
          SectionBadgeTag('SLIDE 5 • PROJECTS, EDUCATION & CERTS'),
          const SizedBox(height: 24),
          SectionHeader(
            icon: Icons.folder_special_outlined,
            title: 'Featured Projects',
          ),
          const SizedBox(height: 16),
          ProjectItem(
            title: AppStrings.proj1Title,
            techStack: AppStrings.proj1Tech,
            description: AppStrings.proj1Desc,
          ),
          const SizedBox(height: 14),
          ProjectItem(
            title: AppStrings.proj2Title,
            techStack: AppStrings.proj2Tech,
            description: AppStrings.proj2Desc,
          ),

          const SeamlessDivider(),

          // EDUCATION & CERTS
          SectionHeader(
            icon: Icons.school_outlined,
            title: 'Education & Credentials',
          ),
          const SizedBox(height: 14),
          Text(
            AppStrings.eduDegree,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            AppStrings.eduSchool,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              InfoChip(icon: Icons.translate, label: AppStrings.langEnglish),
              InfoChip(icon: Icons.translate, label: AppStrings.langJapanese),
            ],
          ),
        ],
      ),
    );
  }
}
