import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_routes_constant.dart';
import 'package:bus_ticket_reseravtion_app/controller/home_controller.dart';
import 'package:bus_ticket_reseravtion_app/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';
import '../constant/app_style.dart';
import '../constant/app_widgets.dart';
import '../controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  String? email;

  HomeScreen({super.key, this.email});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/jpg/bus.jpeg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    AppWidgets().gapH8(),
                    Text(
                      "email",
                      style: textRegularStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    AppWidgets().gapH12(),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Logout",
                  style: textHeaderStyle(fontSize: 25),
                ),
                leading: const Icon(
                  Icons.logout,
                  size: 25,
                  color: AppColors.darkPurple,
                ),
                onTap: () {
                  AuthController.instance.signOut();
                },
              )
            ],
          ),
        ),
        body: Padding(
          padding: mainPaddingAll(),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From",
                        style: textHeaderStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 27,
                            color: AppColors.blackPure.withOpacity(0.8)),
                      ),
                      AppWidgets().gapH8(),
                      GestureDetector(
                        onTapDown: (tapDetails) {
                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                  tapDetails.globalPosition.dx,
                                  tapDetails.globalPosition.dy + 20,
                                  20,
                                  0),
                              items: List.generate(
                                  controller.fromPlaces.length,
                                  (index) => PopupMenuItem(
                                        onTap: () {
                                          controller.selectedFromPlaces.value =
                                              controller.fromPlaces[index];
                                        },
                                        value: controller.fromPlaces[index],
                                        child: Text(
                                          controller.fromPlaces[index],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )));
                        },
                        child: SizedBox(
                          height: 65.h,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      offset: const Offset(1.5, 2))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 5, right: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      controller.selectedFromPlaces.value,
                                      style: textRegularStyle(
                                          fontSize: 20,
                                          color: AppColors.textGrey),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      AppWidgets().gapH12(),
                      Text(
                        "Destination",
                        style: textHeaderStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 27,
                            color: AppColors.blackPure.withOpacity(0.8)),
                      ),
                      AppWidgets().gapH8(),
                      GestureDetector(
                        onTapDown: (tapDetails) {
                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                  tapDetails.globalPosition.dx,
                                  tapDetails.globalPosition.dy + 20,
                                  20,
                                  0),
                              items: List.generate(
                                  controller.toPlaces.length,
                                  (index) => PopupMenuItem(
                                        onTap: () {
                                          controller.selectedToPlaces.value =
                                              controller.toPlaces[index];
                                        },
                                        value: controller.toPlaces[index],
                                        child: Text(
                                          controller.toPlaces[index],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )));
                        },
                        child: SizedBox(
                          height: 65.h,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      offset: const Offset(1.5, 2))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 5, right: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      controller.selectedToPlaces.value,
                                      style: textRegularStyle(
                                          fontSize: 20,
                                          color: AppColors.textGrey),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      AppWidgets().gapH12(),
                      Text(
                        "Date of Journey",
                        style: textHeaderStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 27,
                            color: AppColors.blackPure.withOpacity(0.8)),
                      ),
                      AppWidgets().gapH8(),
                      InkWell(
                        onTap: () {
                          logger.e("GestureDetector");
                          controller.selectDate;
                        },
                        child: TextField(
                          controller: controller.journeyDateController,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Choose your date",
                              suffixIcon:
                                  const Icon(Icons.calendar_month_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1))),
                        ),
                      ),
                      AppWidgets().gapH12(),
                      Text(
                        "Date of Return (Optional)",
                        style: textHeaderStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 27,
                            color: AppColors.blackPure.withOpacity(0.8)),
                      ),
                      AppWidgets().gapH8(),
                      GestureDetector(
                        onTap: () {
                          controller.selectDate;
                        },
                        child: TextField(
                          controller: controller.journeyDateController,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Choose your date",
                              suffixIcon:
                                  const Icon(Icons.calendar_month_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: cornerRadius(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey, width: 1))),
                        ),
                      ),
                      AppWidgets().gapH(Get.height * 0.1),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutesConstant.busList);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                minimumSize: Size(Get.width * 0.8, 60.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: cornerRadius(12))),
                            child: Text(
                              "Get Started",
                              style: textButtonStyle(
                                  fontSize: 28, fontWeight: FontWeight.w700),
                            )),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}