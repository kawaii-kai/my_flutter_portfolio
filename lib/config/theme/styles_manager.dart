import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color);
}

//Regular Style
TextStyle getRegularStyle({required fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

//Light TextStyle
TextStyle getLightStyle({required fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.light,
    color,
  );
}

//Light Italic Style
TextStyle getItalicStyle({required fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.lightItalic,
    color,
  );
}

//Bold TextStyle
TextStyle getBoldStyle({required fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.bold,
    color,
  );
}

//Semi-Bold TextStyle
TextStyle getSemiBoldStyle({required fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.semiBold,
    color,
  );
}

//Medium TextStyle
TextStyle getMediumStyle({required fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.medium,
    color,
  );
}
