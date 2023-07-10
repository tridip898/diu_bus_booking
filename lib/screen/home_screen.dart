import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_routes_constant.dart';
import 'package:bus_ticket_reseravtion_app/controller/home_controller.dart';
import 'package:bus_ticket_reseravtion_app/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constant/app_color.dart';
import '../constant/app_style.dart';
import '../constant/app_widgets.dart';
import '../controller/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  String? email;

  HomeScreen({super.key, this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  late String journeyDate = "Select Date";
  late String returnDate = "Select Date";

  Future<void> selectDate(BuildContext context) async {
    logger.e("selectDate");
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        journeyDate = formattedDate;
      });
    }
  }

  Future<void> selectReturnDate(BuildContext context) async {
    logger.e("selectDate");
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        returnDate = formattedDate;
      });
    }
  }

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
                      email,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: mainPaddingAll(),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.darkPurple, width: 1),
                            image: const DecorationImage(
                                image: AssetImage("assets/jpg/bus.jpeg"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text(
                          "Welcome to DIU",
                          style: textHeaderStyle(),
                        )
                      ],
                    ),
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start",
                          style: textHeaderStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
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
                                          child: Container(
                                            width: Get.width-20,
                                            child: Text(
                                              controller.fromPlaces[index],
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                              fontSize: 25,
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
                                          child: Container(
                                            width: Get.width,
                                            child: Text(
                                              controller.toPlaces[index],
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                              fontSize: 25,
                              color: AppColors.blackPure.withOpacity(0.8)),
                        ),
                        AppWidgets().gapH8(),
                        InkWell(
                          onTap: () {
                            logger.e("GestureDetector");
                            selectDate(context);
                          },
                          child: Container(
                            height: 60.h,
                            width: Get.width,
                            padding:
                                EdgeInsets.symmetric(horizontal: mainPaddingW),
                            decoration: BoxDecoration(
                                borderRadius: cornerRadius(12),
                                border: Border.all(
                                    color: AppColors.grey.withOpacity(0.6),
                                    width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  journeyDate,
                                  style: textRegularStyle(
                                      fontSize: 20, color: AppColors.textGrey),
                                ),
                                const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        AppWidgets().gapH12(),
                        Text(
                          "Date of Return (Optional)",
                          style: textHeaderStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: AppColors.blackPure.withOpacity(0.8)),
                        ),
                        AppWidgets().gapH8(),
                        InkWell(
                          onTap: () {
                            logger.e("GestureDetector");
                            selectReturnDate(context);
                          },
                          child: Container(
                            height: 60.h,
                            width: Get.width,
                            padding:
                                EdgeInsets.symmetric(horizontal: mainPaddingW),
                            decoration: BoxDecoration(
                                borderRadius: cornerRadius(12),
                                border: Border.all(
                                    color: AppColors.grey.withOpacity(0.6),
                                    width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  returnDate,
                                  style: textRegularStyle(
                                      fontSize: 20, color: AppColors.textGrey),
                                ),
                                const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        AppWidgets().gapH(Get.height * 0.05),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                controller.journeyModel.value=JourneyModel(start: controller.selectedFromPlaces.value,destination: controller.selectedToPlaces.value,journeyDate: journeyDate);
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
      ),
    );
  }
}
