import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const SectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF6C5CE7), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
