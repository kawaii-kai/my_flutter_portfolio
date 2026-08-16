import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/features/slide_skills_card/ai_tools/ai_tools_model.dart';
import 'package:my_portfolio/features/slide_skills_card/custom_skills_card.dart';
import 'package:my_portfolio/features/slide_skills_card/models/design_prototyping_model.dart';
import 'package:my_portfolio/features/slide_skills_card/models/front_back_database_model.dart';
import 'package:my_portfolio/features/slide_skills_card/models/ide_tooling_model.dart';
import 'package:my_portfolio/features/slide_skills_card/models/mobile_skill_model.dart';

class TechnicakSkillsScreen extends StatefulWidget {
  final double maxWidth;
  final bool isMobile;

  const TechnicakSkillsScreen({
    super.key,
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  State<TechnicakSkillsScreen> createState() => _TechnicakSkillsScreenState();
}

class _TechnicakSkillsScreenState extends State<TechnicakSkillsScreen> {
  final MobileSkillsModel mobileSkillsModel = MobileSkillsModel();
  final FrontBackDatabaseModel frontBackDatabaseModel =
      FrontBackDatabaseModel();
  final IDEToolingModel ideToolingModel = IDEToolingModel();
  final DesignPrototypingModel designPrototypingModel =
      DesignPrototypingModel();
  final AIToolsModel aiToolsModel = AIToolsModel();

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = widget.isMobile ? 3 : 7;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: widget.maxWidth),
        padding: EdgeInsets.all(widget.isMobile ? 20 : 36),
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
                        fontSize: widget.isMobile ? 18 : 22,
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
                  fontSize: widget.isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),

              //? CARDS
              CustomSkillsCard(
                model: mobileSkillsModel,
                maxWidth: widget.maxWidth,
                isMobile: widget.isMobile,
              ),
              const SizedBox(height: 24),
              Text(
                'Front-End | Back-End | Databases'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),

              CustomSkillsCard(
                model: frontBackDatabaseModel,
                maxWidth: widget.maxWidth,
                isMobile: widget.isMobile,
              ),

              const SizedBox(height: 24),
              Text(
                'IDEs | CI/CD | DevOps | Project Management'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),

              CustomSkillsCard(
                model: ideToolingModel,
                maxWidth: widget.maxWidth,
                isMobile: widget.isMobile,
              ),
              const SizedBox(height: 24),
              Text(
                'Design & Prototyping'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              CustomSkillsCard(
                model: designPrototypingModel,
                maxWidth: widget.maxWidth,
                isMobile: widget.isMobile,
              ),
              const SizedBox(height: 24),
              Text(
                'Productivity & AI Tools'.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  color: ColorManager.astralGold,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.isMobile ? 12 : 14,
                ),
              ),
              const SizedBox(height: 24),
              CustomSkillsCard(
                model: aiToolsModel,
                maxWidth: widget.maxWidth,
                isMobile: widget.isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
