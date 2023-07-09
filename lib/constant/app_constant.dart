import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();
const Transition transition = Transition.rightToLeft;
const mainPadding = 20.0;
double mainPaddingW = 20.0.w;
double mainPaddingH = 20.0.h;
const transitionDuration = 300;

const int loggerLineLength = 120;
const int loggerErrorMethodCount = 8;
const int loggerMethodCount = 2;

double widgetToTitlePadding = 12;

EdgeInsets mainPaddingAll({scale = 1}) {
  return EdgeInsets.symmetric(
      horizontal: mainPaddingW * scale, vertical: mainPaddingH * scale);
}

EdgeInsets mainPaddingHorizontal =
EdgeInsets.symmetric(horizontal: mainPaddingW);

EdgeInsets mainPaddingVertical = EdgeInsets.symmetric(vertical: mainPaddingH);

BorderRadius cornerRadius(double boxRadius){
  return BorderRadius.circular(boxRadius);
}