import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CosmosRiveBackground extends StatelessWidget {
  const CosmosRiveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: RiveAnimation.asset(
        'assets/rive/cosmos.riv',
        fit: BoxFit.cover,
        stateMachines: const ['flying'],
        onInit: (artboard) {
          debugPrint('✨ Cosmos Rive background initialized successfully.');
        },
      ),
    );
  }
}