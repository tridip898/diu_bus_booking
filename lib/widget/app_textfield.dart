import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_color.dart';
import '../constant/app_constant.dart';
import '../constant/app_style.dart';
import '../constant/app_widgets.dart';


class AppTextFormField extends StatelessWidget {
  TextEditingController? controller;
  final String title;
  final String hintText;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  bool obscureText;

  AppTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.validator,
    this.obscureText=false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textHeaderStyle(
              fontWeight: FontWeight.w600,
              fontSize: 27,
              color: AppColors.white.withOpacity(0.8)),
        ),
        AppWidgets().gapH8(),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.underlineColor,
            hintStyle: TextStyle(fontSize: 20.sp,color: AppColors.white.withOpacity(0.8)),
            border: OutlineInputBorder(
                borderSide:
                const BorderSide(color: AppColors.grey, width: 1.0),
                borderRadius: cornerRadius(12)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: AppColors.white, width: 1),
                borderRadius: cornerRadius(12)),
            disabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: AppColors.white, width: 1),
                borderRadius: cornerRadius(12)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: AppColors.white, width: 1),
                borderRadius: cornerRadius(12)),
          ),
          validator: validator,
          obscureText: obscureText,
        ),
        AppWidgets().gapH(10),
      ],
    );
  }
}
