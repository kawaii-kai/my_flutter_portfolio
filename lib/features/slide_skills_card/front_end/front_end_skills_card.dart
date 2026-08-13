import 'package:flutter/material.dart';
import 'package:my_portfolio/features/slide_skills_card/front_end/front_end_model.dart';
import 'package:my_portfolio/features/slide_skills_card/hover_style.dart';

class FrontEndSkillsCard extends StatelessWidget {
  final double maxWidth;
  final bool isMobile;
  const FrontEndSkillsCard({
    super.key,
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    late FrontEndModel skillsModel = FrontEndModel();
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
