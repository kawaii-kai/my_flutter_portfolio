import 'package:flutter/material.dart';

class HomeExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final String? subRole;
  final List<String> points;
  const HomeExperienceItem({
    super.key,
    required this.role,
    required this.company,
    required this.period,
    this.subRole,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              period,
              style: const TextStyle(
                color: Color(0xFF6C5CE7),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          company,
          style: const TextStyle(
            color: Color(0xFF6C5CE7),
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (subRole != null) ...[
          const SizedBox(height: 2),
          Text(
            subRole!,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        const SizedBox(height: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points.map((p) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(
                      color: Color(0xFF6C5CE7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      p,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 12.5,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
