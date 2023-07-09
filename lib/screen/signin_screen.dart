import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constant/app_color.dart';
import '../constant/app_constant.dart';
import '../constant/app_routes_constant.dart';
import '../constant/app_style.dart';
import '../constant/app_widgets.dart';
import '../controller/auth_controller.dart';
import '../widget/app_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController(),
      passwordController = TextEditingController();

  final signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: mainPaddingAll(scale: 1.5),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/png/signup_background.png"),
                opacity: 0.8,
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Login",
                    style: textHeaderStyle(
                        fontSize: 35, color: AppColors.whitePure),
                  ),
                ),
                Form(
                  key: signInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets().gapH20(),
                      AppTextFormField(
                        title: 'Email',
                        hintText: 'Enter your email',
                        controller: emailController,
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (value) {
                          if (GetUtils.isEmail(value!)) {
                            return null;
                          } else {
                            return "Please enter valid email";
                          }
                        },
                      ),
                      AppTextFormField(
                        title: 'Password',
                        hintText: 'Enter your password',
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length >= 6) {
                            return null;
                          } else {
                            return "Please enter valid password";
                          }
                        },
                      ),
                      AppWidgets().gapH24(),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            AuthController.instance.signInUser(
                                emailController.text.trim(),
                                passwordController.text.trim());
                            // if(AuthController.instance.user.value != null){
                            //   Get.toNamed(AppRoutesConstant.homePage);
                            // }
                            // if (signInFormKey.currentState!
                            //     .validate()) {
                            // } else {}
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                            Size(Get.width * .6, Get.height * 0.06),
                          ),
                          child: Text(
                            "Sign in",
                            style: textButtonStyle(fontSize: 26),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppWidgets().gapH16(),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: textHeaderStyle(
                          fontSize: 22,
                          color: AppColors.blackPure,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: "Signup",
                            style: textHeaderStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: AppColors.purple,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Get.toNamed(AppRoutesConstant.signup))
                      ],
                    ),
                  ),
                ),
                AppWidgets().gapH16(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Or",
                      style: textRegularStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                    AppWidgets().gapH12(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              AuthController.instance.signInWithGoogle();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: AppColors.white, width: 1),
                                  borderRadius: cornerRadius(30)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/png/google.png",
                                    height: 35.h,
                                  ),
                                  AppWidgets().gapW16(),
                                  Text(
                                    "Sign in with Google",
                                    style: textRegularStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
