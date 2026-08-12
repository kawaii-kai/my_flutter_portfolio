// lib/features/home/presentation/widgets/home_intro_badge.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';
import 'package:my_portfolio/core/presentation/custom/section_badge_tag.dart';

class HomeIntroBadge extends StatelessWidget {
  final bool isMobile;

  const HomeIntroBadge({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF141622).withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionBadgeTag( AppStrings.slide1Badge),
          // const SizedBox(height: 16),
          Text(
            AppStrings.fullName,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 32 : 46,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.jobTitle,
            style: const TextStyle(
              color: Color(0xFF6C5CE7),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.introBody,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 13.5,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
