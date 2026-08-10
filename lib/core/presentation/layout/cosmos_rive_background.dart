import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CosmosRiveBackground extends StatelessWidget {
  const CosmosRiveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/rive/cosmos.riv',
      fit: BoxFit.cover,
      stateMachines: ['flying'],
      onInit: (artboard) {
        if (artboard.animations.isNotEmpty) {
          final animName = artboard.animations.first.name;
          final controller = SimpleAnimation(animName, autoplay: true);
          artboard.addController(controller);
          debugPrint('▶️ Auto-playing first animation: "$animName"');
        }
      },
    );
  }
}
