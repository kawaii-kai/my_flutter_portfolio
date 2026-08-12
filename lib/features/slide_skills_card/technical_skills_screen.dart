import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/features/slide_skills_card/mobile/mobile_skills_card.dart';
import 'package:my_portfolio/features/slide_skills_card/skill_model.dart';

class TechnicakSkillsScreen extends StatelessWidget {
  final double maxWidth;
  final bool isMobile;

  TechnicakSkillsScreen({
    super.key,
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    late SkillsModel skillsModel = SkillsModel();
    // Responsive grid column count optimized for mobile screens (like Galaxy phones) up to large desktops
    // int crossAxisCount;
    // if (isMobile) {
    //   crossAxisCount = 2; // Perfect 2-column layout for mobile / Galaxy screens
    // } else if (maxWidth  // Color _getLevelColor(String level) {
    //   switch (level) {
    //     case 'Proficient':
    //       return ColorManager.astralGold;
    //     case 'Advanced':
    //       return ColorManager.astralSilver;
    //     default:
    //       return ColorManager.astralBlue; // Default color for unknown levels
    //   }
    // }< 900) {
    //   crossAxisCount = 3;
    // } else if (maxWidth < 1200) {
    //   crossAxisCount = 4
    // } else {
    //   crossAxisCount = 6;
    // }
    int crossAxisCount = isMobile ? 3 : 7;

    return Center(
      child: Container(
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

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Title
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Technical Skills and Tools',
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white,
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Category Selector Tabs
              Text(
                'MOBILE DEVELOPMENT | LANGUAGES | FRAMEWORKS | ARCHITECTURE | PLATFORMS ',
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              //? CARDS
              MobileSkillsCards(maxWidth: maxWidth, isMobile: isMobile),
               Text(
                'IDEs & Development Tooling',
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
