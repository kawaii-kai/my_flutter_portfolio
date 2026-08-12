import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#2E1C4D"); // Deep Nebula Violet
  static Color secondary = HexColor.fromHex("##502A6A"); //Cosmic Magenta
  static Color starDustPurple = HexColor.fromHex("#8C52FF"); // Stardust Purple
  static Color purple = HexColor.fromHex("0xFF6C5CE7");
  static Color stellarCard = Color(0xFF1D2636);
  static Color primaryPurle = HexColor.fromHex("6C5CE7");
  static Color deepSpaceBlack = Color(0xFF0B0E14);
  static Color cosmicSpace = const Color(0xFF131822);
  static Color astralGold = Color(0xFFD4AF37);
  static Color astralSilver = Color(0xFFC0C0C0);
  static Color astralBronze = Color(0xFFCD7F32);
  static Color astralBlue = Color(0xFF007FFF);
  static Color starlightWhite = Color(0xFFF1F5F9);
  static Color dustyGray = Color(0xFF94A3B8);
  static Color nebulaDim = Color(0xFF2A3447);
  static Color lightPurple = HexColor.fromHex("##502A6A").withOpacity(0.6);
  static Color blackOpacity = const Color(0xFF141622).withOpacity(0.88);
  static Color whiteTransparent = Colors.white.withOpacity(0.06);
}

//Extension keyword in dart allows you to add new methods or properties to existing classes
//without modifying the original class. This is useful for keeping your code clean and reusable

extension HexColor on Color {
  //This is static means you can call it without creating instance of Color
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; //8 char with opacity 100%
    }
    //Converts the hexString to color object
    return Color(int.parse(hexColorString, radix: 16));
  }
}

const LinearGradient nebulaGlowGradient = LinearGradient(
  colors: [Color(0xFF2E1C4D), Color(0xFF502A6A), Color(0xFF8C52FF)],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
