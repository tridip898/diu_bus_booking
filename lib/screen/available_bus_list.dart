import 'package:bus_ticket_reseravtion_app/constant/app_color.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_routes_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_style.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_widgets.dart';
import 'package:bus_ticket_reseravtion_app/controller/bus_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableBusList extends StatelessWidget {
  AvailableBusList({super.key});

  final controller = Get.put(BusListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Available Bus",
            style: textAppBarStyle(
              fontSize: 26,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: mainPaddingAll(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bus List",
                style: textHeaderStyle(),
              ),
              AppWidgets().gapH20(),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Obx(() {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: mainPaddingW),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutesConstant.ticketBooking,
                                  arguments: controller.vehicle[index]);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.vehicle[index].busName,
                                      style: textHeaderStyle(fontSize: 25,fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      controller.vehicle[index].route,
                                      style: textRegularStyle(fontSize: 20,color: AppColors.textGrey),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      controller.vehicle[index].fare,
                                      style: textHeaderStyle(
                                          fontSize: 23,
                                          color: AppColors.primaryColor),
                                    ),
                                    Text(
                                      controller.vehicle[index].time,
                                      style: textRegularStyle(fontSize: 20,color: AppColors.textGrey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: controller.vehicle.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
