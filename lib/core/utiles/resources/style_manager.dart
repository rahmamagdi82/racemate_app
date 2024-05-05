import 'package:flutter/material.dart';

import 'font_manager.dart';

class FontStyles{

// regular style

  static TextStyle getRegularStyle({
    double fontSize=FontSize.s16,
  }){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
    );
  }

// medium style

  static TextStyle getMediumStyle({
    double fontSize=FontSize.s14,
  }){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
    );
  }

// bold style

  static TextStyle getBoldStyle(
      {double fontSize = FontSize.s16,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
    );
  }

// semiBold style

  static TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s22,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
    );
  }
}