import 'package:flutter/material.dart';
import 'package:my_portfolio/features/slide_skills_card/hover_style.dart';
import 'package:my_portfolio/features/slide_skills_card/mobile/mobile_skill_model.dart';

class MobileSkillsCards extends StatelessWidget {
  final double maxWidth;
  final bool isMobile;
  const MobileSkillsCards({
    super.key,
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    late MobileSkillsModel skillsModel = MobileSkillsModel();
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

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: isMobile ? 12 : 16,
        mainAxisSpacing: isMobile ? 12 : 16,
        childAspectRatio: isMobile ? 1.0 : 1.1,
      ),
      itemCount: skillsModel.skills.length,
      itemBuilder: (context, index) {
        final skill = skillsModel.skills[index];
        final bool isSelected = index == false; // Example active item
        // final Color levelColor = _getLevelColor(skill['level']!);

        return HoverStyle(
          skill: skill,
          isSelected: isSelected,
          isMobile: isMobile,
          // levelColor: levelColor,
        );
      },
    );
  }
}
