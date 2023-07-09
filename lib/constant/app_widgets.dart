import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_color.dart';
import 'app_style.dart';

class AppWidgets {
  // IconData arrow_drop_down = IconData(0xe098, fontFamily: 'MaterialIcons');

  Widget gapH(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width.w,
    );
  }

  Widget gapH20() {
    return SizedBox(
      height: 20.h,
    );
  }

  Widget gapW8() {
    return SizedBox(
      width: 8.w,
    );
  }

  Widget gapH8() {
    return SizedBox(
      height: 8.h,
    );
  }

  Widget gapH16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Widget gapW16() {
    return SizedBox(
      width: 16.w,
    );
  }

  Widget gapW12() {
    return SizedBox(
      width: 12.w,
    );
  }

  Widget gapH12() {
    return SizedBox(
      height: 12.h,
    );
  }

  Widget gapW24() {
    return SizedBox(
      width: 24.w,
    );
  }

  Widget gapH24() {
    return SizedBox(
      height: 24.h,
    );
  }

  SnackbarController getSnackBar(
      {title = "Title",
        message = " Some message",
        int waitingTime = 2,
        int animationDuration = 500,
        snackPosition = SnackPosition.TOP,
        Color backgroundColor = AppColors.primaryColor,
        double backgroundColorOpacity = .7,
        colorText = AppColors.white}) {
    return Get.snackbar(title, message,
        snackPosition: snackPosition,
        duration: Duration(seconds: waitingTime),
        animationDuration: Duration(milliseconds: animationDuration),
        backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
        colorText: colorText);
  }

  divider() {
    return const Divider(
      color: AppColors.dividerColor,
      height: 10,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }

  showSnackbar(
      {required String message,
        isError = true,
        isSuccess = false,
        isWarning = false}) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess
            ? AppColors.green.withOpacity(.8)
            : isWarning
            ? AppColors.orangeLite.withOpacity(.8)
            : AppColors.red.withOpacity(.8),
        content: Text(
          message,
          style: headerTextStyle(
              isColorWhite: true, fontSize: 20, letterSpacing: 1.1),
        ),
      ),
    );
  }

  Widget nameDetailCard(
      {String header = "", String details = "", bool needExpand = true}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "$header : ",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: textRegularStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ),
        needExpand
            ? Expanded(
          child: Text(
            "$details",
            style: textRegularStyle(
                fontSize: 17, fontWeight: FontWeight.w500),
          ),
        )
            : Text(
          "$details",
          style:
          textRegularStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
