import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryColorSwatch = MaterialColor(0xFF2F54EB, {
    50: Color(0xFFE0EAF0),
    100: Color(0xFFB3CCE2),
    200: Color(0xFF80A9D5),
    300: Color(0xFF4D87C8),
    400: Color(0xFF266FBE),
    500: Color(0xFF0056B4),
    600: Color(0xFF0050A0),
    700: Color(0xFF004A8D),
    800: Color(0xFF00447A),
    900: Color(0xFF003260),
  });
  //main
  static const primaryColor = Color(0xFF2F54EB);
  static const accentColor = Color(0xFFFFFFFF);
  static const primaryBackgroundColor = Color.fromRGBO(145, 187, 238, 0.212);
  static const accentBackgroundColor = Color.fromRGBO(3, 6, 32, 0.04);
  static const primaryBorderColor = Color.fromRGBO(3, 6, 32, 0.1);
  static const primaryAccentColor = Color(0xFFFFFFFF);

  //status
  static const disabledBackgroundColor = Color.fromRGBO(3, 6, 32, 0.04);
  static const primaryAcceptedColor = Color(0xFFEEFFF5);
  static const accentAcceptedColor = Color(0xFF32915A);
  static const primaryDeniedColor = Color(0xFFFFF1F0);
  static const accentDeniedColor = Color(0xFFB43E50);

  //text
  static const textColorPrimary = Color(0xFF000000);
  static const textColorSecondary = Color(0xFF787979);
  static const textColorAccent = Color(0xFFFFFFFF);
  static const textColorDisabled = Color.fromRGBO(3, 6, 32, 0.25);
}
