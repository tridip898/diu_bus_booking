import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';


//---------------------------------------------------
TextStyle headerTextStyle({
  color = AppColors.blackPure,
  double fontSize = 16,
  fontWeight = FontWeight.w700,
  lineHeight = 1.1,
  letterSpacing = 0.0,
  isColorWhite = false,
  isPrimaryColor = false,
  isDefaultGradientColor = false,
  isFontNormal = false,
  isNormalLineHeight = false,
  isTextDecUnderline = false,
  isNormalLineSpacing = false,
}) {
  return GoogleFonts.titilliumWeb(
    // fontSize: 38,
    // fontWeight: FontWeight.bold,
    // color: Colors.black,
    // letterSpacing: 1.2
    fontSize: fontSize.sp,
    decoration: isTextDecUnderline ? TextDecoration.underline : null,
    color: isPrimaryColor
        ? AppColors.primaryColor
        : isColorWhite
        ? AppColors.white
        : color,
    fontWeight: isFontNormal ? FontWeight.normal : fontWeight,
    height: isNormalLineHeight ? 1 : lineHeight,
    letterSpacing: isNormalLineSpacing ? 0 : letterSpacing,
  );
}

TextStyle normalTextStyle({
  color = AppColors.blackPure,
  double fontSize = 14,
  fontWeight = FontWeight.w400,
  lineHeight = 0.5,
  letterSpacing = 0.0,
  isColorWhite = false,
  isPrimaryColor = false,
  isDefaultGradientColor = false,
  isFontNormal = false,
  isNormalLineHeight = false,
  isTextDecUnderline = false,
  isNormalLineSpacing = false,
  isFontWeight500 = false,
}) {
  return GoogleFonts.titilliumWeb(
    fontSize: fontSize.sp,
    decoration: isTextDecUnderline ? TextDecoration.underline : null,
    color: isPrimaryColor
        ? AppColors.primaryColor
        : isColorWhite
        ? AppColors.white
        : color,
    fontWeight: isFontNormal
        ? FontWeight.normal
        : isFontWeight500
        ? FontWeight.w500
        : fontWeight,
    height: isNormalLineHeight ? 0.5 : lineHeight,
    letterSpacing: isNormalLineSpacing ? 0.0 : letterSpacing,
  );
}

TextStyle textHeaderStyle(
    {color = AppColors.headerTextColor,
      double fontSize = 30,
      fontWeight = FontWeight.w700}) {
  return GoogleFonts.titilliumWeb(
      fontSize: fontSize.sp, color: color, fontWeight: fontWeight);
}

TextStyle textSubtitleStyle({
  color = AppColors.subtitleColor,
  double fontSize = 12,
  fontWeight = FontWeight.w400,
}) {
  return GoogleFonts.titilliumWeb(
      fontSize: fontSize.sp, color: color, fontWeight: fontWeight);
}

TextStyle textAppBarStyle(
    {color = AppColors.appBarTextColor,
      double fontSize = 18,
      fontWeight = FontWeight.w600,
      bool isGrayColor = false,
      bool isWhiteColor = false}) {
  return GoogleFonts.titilliumWeb(
      fontSize: fontSize.sp,
      color: isWhiteColor
          ? AppColors.whitePure
          : isGrayColor
          ? AppColors.grey
          : color,
      fontWeight: fontWeight);
}

TextStyle textRegularStyle(
    {color = AppColors.blackPure,
      double fontSize = 14,
      fontWeight = FontWeight.normal,
      bool isGrayColor = false,
      bool isWhiteColor = false,
      double letterSpacing = 0.6,
      double? lineHeight}) {
  return GoogleFonts.titilliumWeb(
      fontSize: fontSize.sp,
      letterSpacing: letterSpacing,
      color: isWhiteColor
          ? AppColors.white
          : isGrayColor
          ? AppColors.grey
          : color,
      fontWeight: fontWeight,
      height: lineHeight);
}

TextStyle textButtonStyle(
    {color = AppColors.white,
      double fontSize = 18,
      fontWeight = FontWeight.w600}) {
  return GoogleFonts.titilliumWeb(
      fontSize: fontSize.sp, color: color, fontWeight: fontWeight);
}

final hintStyle = GoogleFonts.titilliumWeb(
    fontSize: 14, color: AppColors.inputColor, fontWeight: FontWeight.w500);

