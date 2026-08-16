import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';
import 'package:my_portfolio/features/professional_summary/layout_metric_pill.dart';

class HomeHeroHeader extends StatelessWidget {
  const HomeHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SUBTITLE / SPECIALIZATION
              Text(
                AppStrings.heroSubtitle,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 20 : 26,

                  height: 1.3,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(0, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // TECH STACK LOGOS / PILLS SHOWCASE
              _buildTechLogoRow(),
              const SizedBox(height: 16),

              // LIVE METRIC / IMPACT BADGES BAR
              Wrap(
                spacing: 12,
                runSpacing: 10,
                children: [
                  LayoutMetricPill(
                    label: "3+ Years Experience",
                    icon: Icons.timer_outlined,
                  ),
                  LayoutMetricPill(
                    label: "10+ APIs Integrated",
                    icon: Icons.api_outlined,
                  ),
                  LayoutMetricPill(
                    label: "10+ Packages Refactored",
                    icon: Icons.build_outlined,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // PROFESSIONAL SUMMARY CARD (Replaces Redundant Experience Block)
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF141622).withOpacity(0.88),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.12)),
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
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Color(0xFF6C5CE7),
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          AppStrings.summaryTitle.toUpperCase(),
                          style: GoogleFonts.spaceGrotesk(
                            color: Color(0xFF6C5CE7),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppStrings.summaryParagraph1,
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 13.5,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppStrings.summaryParagraph2,
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 13.5,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ACTION BUTTONS
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C5CE7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      AppStrings.btnDownloadCv,
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppStrings.btnContactMe,
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for Tech Stack Pills
  Widget _buildTechLogoRow() {
    final List<String> techStack = [
      'Flutter',
      'Dart',
      'Kotlin',
      'Java',
      'Swift',
      'Android',
      'iOS',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: techStack.map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF6C5CE7),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                tech,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Helper widget for Impact Metric Pills
}
