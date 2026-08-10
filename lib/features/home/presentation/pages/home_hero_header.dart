import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/font_manager.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';

class HomeHeroHeader extends StatelessWidget {
  const HomeHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 24 : 40,
                horizontal: isMobile ? 16 : 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // MAIN HERO TITLE (Bigger Typography)
                  Text(
                    AppStrings.heroGreeting,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontManager.fontFamily,
                      fontSize: isMobile ? 28 : 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.8),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // SUBTITLE / SPECIALIZATION
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      AppStrings.heroSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: FontManager.fontFamily,
                        fontSize: isMobile ? 16 : 20,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // FEATURED PROOF & RECENT EXPERIENCE BADGE CARD
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141622).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFF6C5CE7).withOpacity(0.6),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6C5CE7).withOpacity(0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // BADGE CHIP
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C5CE7).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFF6C5CE7),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.verified_outlined,
                                  color: Color(0xFF6C5CE7),
                                  size: 14,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  AppStrings.recentRoleProofBadge,
                                  style: const TextStyle(
                                    color: Color(0xFF6C5CE7),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          // ROLE & COMPANY TITLE
                          Text(
                            AppStrings.recentRoleProofTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // PROOF DETAILS
                          Text(
                            AppStrings.recentRoleProofDesc,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: isMobile ? 13 : 14,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  // CALL TO ACTION BUTTONS
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text("Download CV"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C5CE7),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 6,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.4),
                            width: 1.5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          AppStrings.btnContactMe,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
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
      },
    );
  }
}
