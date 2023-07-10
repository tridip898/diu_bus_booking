import 'package:bus_ticket_reseravtion_app/constant/app_color.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_routes_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_style.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_widgets.dart';
import 'package:bus_ticket_reseravtion_app/controller/bus_list_controller.dart';
import 'package:bus_ticket_reseravtion_app/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/booking_controller.dart';
import '../controller/home_controller.dart';

class TicketDetailsPage extends StatelessWidget {
  TicketDetailsPage({super.key});

  final controller = Get.put(TicketController());
  final homeController = Get.find<HomeController>();
  final bookingController = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: mainPaddingAll(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: Get.width * 0.9,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: cornerRadius(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Ticket Details",
                              style: textHeaderStyle(),
                            ),
                          ),
                          const Divider(
                            color: AppColors.blackPure,
                          ),
                          Row(
                            children: [
                              Text(
                                "Name: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Tridip Bhowmik",
                                style: textRegularStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Route: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.vehicleModel.route,
                                style: textRegularStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Seat No: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Obx(() {
                                return Text(
                                  Get
                                      .find<BookingController>()
                                      .seatList.join(","),
                                  style: textRegularStyle(fontSize: 24),
                                );
                              }),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Journey Date: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Obx(() {
                                return Text(
                                  Get
                                      .find<HomeController>()
                                      .journeyModel
                                      .value
                                      .journeyDate ?? "",
                                  style: textRegularStyle(fontSize: 24),
                                );
                              }),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Fare: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${int.parse(controller.vehicleModel.fare.replaceAll(" tk", ""))*Get
                                    .find<BookingController>()
                                    .seatList.length} tk",
                                style: textRegularStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Bus: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.vehicleModel.busName,
                                style: textRegularStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Driver Name: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.vehicleModel.driverName,
                                style: textRegularStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Payment Method: ",
                                style: textRegularStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.paymentMethod,
                                style: textRegularStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          AppWidgets().gapH16(),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.delete<TicketController>();
                                Get.delete<BookingController>();
                                Get.delete<BusListController>();
                                Get.delete<HomeController>();
                                Get.offNamed(AppRoutesConstant.homePage);
                                // Get.until((route)=>route.settings.name==AppRoutesConstant.homePage);
                              },
                              child: Text(
                                "Done",
                                style: textButtonStyle(fontSize: 24),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
