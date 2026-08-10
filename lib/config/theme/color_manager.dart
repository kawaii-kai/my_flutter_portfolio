import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#2E1C4D"); // Deep Nebula Violet
  static Color secondary = HexColor.fromHex("##502A6A"); //Cosmic Magenta
  static Color accent = HexColor.fromHex("#8C52FF"); // Stardust Purple
  static Color black = HexColor.fromHex("#000000");
  static Color royalblue = HexColor.fromHex("#01295F");
  static Color cerulean = HexColor.fromHex("#247BA0");
  static Color moonstone = HexColor.fromHex("#48B8D0");
  static Color lightgray = HexColor.fromHex("#C2CFD8");
  static Color gray = HexColor.fromHex("#606470");
  static Color darkgray = HexColor.fromHex("#3A4750");
  static Color red = HexColor.fromHex("#A31D1D");
  static Color darkred = HexColor.fromHex("#820300");
  static Color navyBlue = HexColor.fromHex("002455");
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
  colors: [
    Color(0xFF2E1C4D),
    Color(0xFF502A6A),
    Color(0xFF8C52FF),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
