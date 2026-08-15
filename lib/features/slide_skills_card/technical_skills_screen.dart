import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/features/slide_skills_card/ai_tools/ai_tools_card.dart';
import 'package:my_portfolio/features/slide_skills_card/design_prototyping/design_prototyping_card.dart';
import 'package:my_portfolio/features/slide_skills_card/front_back_database/front_back_database_card.dart';
import 'package:my_portfolio/features/slide_skills_card/ide/ide_tooling_skills_card.dart';
import 'package:my_portfolio/features/slide_skills_card/mobile/mobile_skills_card.dart';

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
                  const SizedBox(height: 24),
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
              const SizedBox(height: 24),
              Text(
                'Front-End | Back-End | Databases'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              FrontBackDatabaseCard(maxWidth: maxWidth, isMobile: isMobile),
              const SizedBox(height: 24),
              Text(
                'IDEs | CI/CD | DevOps | Project Management'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              IDEToolingSkillsCard(maxWidth: maxWidth, isMobile: isMobile),
              const SizedBox(height: 24),
              Text(
                'Design & Prototyping'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              DesignPrototypingCard(maxWidth: maxWidth, isMobile: isMobile),
              const SizedBox(height: 24),
              Text(
                'Productivity & AI Tools'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              AIToolsCard(maxWidth: maxWidth, isMobile: isMobile),
            ],
          ),
        ),
      ),
    );
  }
}
