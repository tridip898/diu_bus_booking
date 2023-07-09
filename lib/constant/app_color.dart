import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryColorValue = 0xFF240DFF; //primaryColor
  ///primarySwatch [must] contain all shades(50-900).
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFEAE7FF),
      100: Color(0xFF4FF122),
      200: Color(0xFF1DE020),
      300: Color(0xFF35CE1E),
      400: Color(0xFF2BAF16),
      500: Color(_primaryColorValue),
      600: Color(0xFF24830A),
      700: Color(0xFF187C09),
      800: Color(0xFF156B08),
      900: Color(0xFF1D4F13),
    },
  );

  //tridip
  static const splashBackground = Color(0xfff7f7f7);
  static const dividerColor = Color(0xFF82868A);
  static const tabButton = Color(0xFFC4D7B2);

  //

  static const primaryColor = Color(0xFF2BAF16);
  static const secondaryColor = Color(0xFF7767FF);
  static const backgroundColor = Color(0xFFE8E8E8);
  static const transparent = Color(0x00bd4efe);

  //aurnab
  static const darkPurple = Color(0xFF12101F);
  static const textGrey = Color(0xFF82868A);


  static const purple = Color(0xFF5C3BFF);
  static const deepBlue = Color(0xFF000000);
  static const blackPure = Color(0xFF000000);
  static const blackShadow = Color(0xFF151414);
  static const white = Color(0xFFF8F8F8);
  static const whitePure = Color(0xFFFFFFFF);
  static const grey = Color(0xFF52596E);
  static const liteGray = Color(0xFFD9D9D9);
  static const liteGrayStepLine = Color(0xFF8FAABB);
  static const liteStepLine = Color(0xFFE2F0FD);
  static const inputColor = Color(0x8052596E); //alpha 50%
  static const wrong = Color(0xFFC20707);
  static const green = Color(0xFF34A853);
  static const liteGreen = Color(0xFF56C674);
  static const red = Color(0xFFFF1F00);
  static const darkRed = Color(0xFF4A154B);
  static const orangeLite = Color(0xFFFE914E);

  static const headerTextColor = Color(0xFF172B4D);
  static const subtitleColor = Color(0xFF9E9E9E);
  // static const appBarTextColor = Color(0xFF000000);
  static const appBarTextColor = whitePure;
  static const underlineColor = Color(0xFFCCCCCC);
  static const textColorBlue = Color(0xFF2E38B6);
  static const fieldColor = Color(0xFF846AE3);
  static const questionListBackgroundColor = Color(0xFFF2F7F6);

  static const listBackgroundColor = Color(0xFFF7F7F7);
  static const listStrokeColor = Color(0xFFDDDDDD);

  /// [pie chart] color
  static const problemSolvingColor = Color(0xff9779FF);
  static const analyticalThinkingColor = Color(0xff7B60FF);
  static const communicationSkillsColor = Color(0xff5C3BFF);

  static const gradientLeftColor = Color(0xB8240DFF);
  static const gradientRightColor = Color(0xFF6B4BDA);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);

  // Gradient
  static const baseGradient = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
