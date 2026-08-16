import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const InfoChip({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF6C5CE7)),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
