import 'dart:convert';

import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_style.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_widgets.dart';
import 'package:bus_ticket_reseravtion_app/controller/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';
import '../constant/app_routes_constant.dart';
import '../model/SeatModel.dart';

class TicketBookingScreen extends StatefulWidget {
  TicketBookingScreen({super.key});

  @override
  State<TicketBookingScreen> createState() => _TicketBookingScreenState();
}

class _TicketBookingScreenState extends State<TicketBookingScreen> {
  final controller = Get.put(BookingController());

  List<SeatModel> data = [];

  _readData() async {
    DefaultAssetBundle.of(context)
        .loadString("lib/model/seat_model.json")
        .then((value) {
      print(value);
      setState(() {
        data.addAll(seatModelFromJson(value.toString()));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            controller.vehicles.busName,
            style: textAppBarStyle(fontSize: 26),
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
                "Confirm your Seat",
                style: textHeaderStyle(fontSize: 27),
              ),
              AppWidgets().gapH(Get.height * 0.05),
              Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      data[index].seatNameAndNo[0].isSelected =
                                      !data[index]
                                          .seatNameAndNo[0]
                                          .isSelected;
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                            .seatNameAndNo[0]
                                            .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child:
                                        Text(data[index].seatNameAndNo[0].seatNo),
                                  ),
                                ),
                              ),
                              AppWidgets().gapW12(),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      data[index].seatNameAndNo[1].isSelected =
                                          !data[index]
                                              .seatNameAndNo[1]
                                              .isSelected;
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                                .seatNameAndNo[1]
                                                .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child: Text(
                                        data[index].seatNameAndNo[1].seatNo),
                                  ),
                                ),
                              ),
                              AppWidgets().gapW(Get.width * 0.1),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      data[index].seatNameAndNo[2].isSelected =
                                      !data[index]
                                          .seatNameAndNo[2]
                                          .isSelected;
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                            .seatNameAndNo[2]
                                            .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child:
                                        Text(data[index].seatNameAndNo[2].seatNo),
                                  ),
                                ),
                              ),
                              AppWidgets().gapW12(),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      data[index].seatNameAndNo[3].isSelected =
                                      !data[index]
                                          .seatNameAndNo[3]
                                          .isSelected;
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                            .seatNameAndNo[3]
                                            .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child:
                                        Text(data[index].seatNameAndNo[3].seatNo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppWidgets().gapH8()
                        ],
                      );
                    }),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      //Get.toNamed(AppRoutesConstant.busList);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: Size(Get.width * 0.8, 60.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: cornerRadius(12))),
                    child: Text(
                      "Make Payment",
                      style: textButtonStyle(
                          fontSize: 28, fontWeight: FontWeight.w700),
                    )),
              ),
              AppWidgets().gapH(Get.height * 0.1)
            ],
          ),
        ),
      ),
    );
  }
}
