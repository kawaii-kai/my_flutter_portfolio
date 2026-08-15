import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/color_manager.dart';

class HoverStyle extends StatefulWidget {
  final Map<String, String> skill;
  final bool isMobile;
  final bool isSelected;
  // final Color levelColor;
  const HoverStyle({
    super.key,
    required this.skill,
    required this.isMobile,
    required this.isSelected,
    // required this.levelColor,
  });

  @override
  State<HoverStyle> createState() => _HoverStyleState();
}

class _HoverStyleState extends State<HoverStyle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Combine explicit selection status with hover state styling
    final bool activeGlow = widget.isSelected || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..translate(
            0.0,
            _isHovered ? -4.0 : 0.0,
          ), // Subtle lift effect on hover
        decoration: BoxDecoration(
          color: _isHovered
              ? ColorManager.secondary.withOpacity(0.6)
              : Colors.white.withOpacity(0.06),

          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: activeGlow
                ? ColorManager.starDustPurple
                : Colors.white.withOpacity(0.12),
            width: activeGlow ? 1.5 : 1.0,
          ),

          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: ColorManager.lightPurple,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.skill['icon']!,
              width: widget.isMobile ? 26 : 32,
              height: widget.isMobile ? 26 : 32,
            ),
            const SizedBox(height: 10),
            Text(
              widget.skill['name']!,
              style: GoogleFonts.spaceMono(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: widget.isMobile ? 10 : 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.skill['level']!,
              style: GoogleFonts.spaceMono(
                color: ColorManager.astralGold,
                fontSize: widget.isMobile ? 9 : 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
