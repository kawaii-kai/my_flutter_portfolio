// lib/features/home/presentation/widgets/home_hero_header.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/font_manager.dart';

class HomeHeroHeader extends StatelessWidget {
  const HomeHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hi, I'm Kyla Baliao 👋",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontManager.fontFamily,
              fontSize: FontSize.s20, // Or display title size
              fontWeight: FontWeightManager.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Mobile Application Developer specializing in Flutter, Clean Architecture, and Cross-Platform Apps.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontManager.fontFamily,
              fontSize: FontSize.s16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text("Download CV"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: const Text("Contact Me"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
