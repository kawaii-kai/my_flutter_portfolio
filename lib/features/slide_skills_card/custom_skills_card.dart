import 'package:flutter/material.dart';
import 'package:my_portfolio/core/presentation/layout/hover_style.dart';

class CustomSkillsCard<T> extends StatelessWidget {
  final double maxWidth;
  final T model;
  final bool isMobile;

  const CustomSkillsCard({
    super.key,
    required this.model,
    required this.maxWidth,
    required this.isMobile,
  });
  @override
  Widget build(BuildContext context) {
    final skillsList = (model as dynamic).skills ?? [];
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
      itemCount: skillsList.length,
      itemBuilder: (context, index) {
        final skill = skillsList[index];
        final bool isSelected = index == false;
        return HoverStyle(
          skill: skill,
          isSelected: isSelected,
          isMobile: isMobile,
        );
      },
    );
  }
}
