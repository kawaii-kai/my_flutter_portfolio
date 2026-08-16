import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';
import 'package:my_portfolio/features/slide_5_projects/section_header.dart';
import 'package:my_portfolio/features/slide_4_work_experience/home_experience_item.dart';

class HomeExperienceCard extends StatelessWidget {
  final bool isMobile;
  final double maxWidth;
  const HomeExperienceCard({
    super.key,
    required this.isMobile,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    // =========================================================================
    //? CARD 2: WORK EXPERIENCE (SLIDE 4)
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
            color: ColorManager.lightPurple,
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SectionHeader(icon: Icons.work_outline, title: AppStrings.expTitle),
          const SizedBox(height: 20),

          // 1. PSBank
          HomeExperienceItem(
            role: AppStrings.expRole,
            company: AppStrings.expCompany,
            period: AppStrings.expPeriod,
            subRole: AppStrings.expSubRole,
            points: AppStrings.expPoints,
          ),
          const SizedBox(height: 20),

          // 2. Quantrics
          HomeExperienceItem(
            role: AppStrings.expQuantricsRole,
            company: AppStrings.expQuantricsCompany,
            period: AppStrings.expQuantricsPeriod,
            subRole: AppStrings.expQuantricsSubRole,
            points: AppStrings.expQuantricsPoints,
          ),
          const SizedBox(height: 20),

          // 3. Trent Technical Institute
          HomeExperienceItem(
            role: AppStrings.expTrentRole,
            company: AppStrings.expTrentCompany,
            period: AppStrings.expTrentPeriod,
            subRole: null,
            points: AppStrings.expTrentPoints,
          ),
          // 4. Internship
          const SizedBox(height: 20),
          HomeExperienceItem(
            role: AppStrings.expEroRole,
            company: AppStrings.expEroCompany,
            period: AppStrings.expEroPeriod,
            subRole: null,
            points: AppStrings.expEroPoints,
          ),
        ],
      ),
    );
  }
}
