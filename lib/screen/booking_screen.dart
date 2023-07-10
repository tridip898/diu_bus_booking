import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_routes_constant.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_style.dart';
import 'package:bus_ticket_reseravtion_app/constant/app_widgets.dart';
import 'package:bus_ticket_reseravtion_app/controller/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';
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

  late String bus;

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    bus = controller.vehicles.busName;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bus = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            bus,
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
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mainPaddingW),
                    child: Image.asset(
                      "assets/png/steering.png",
                      height: 50.h,
                    ),
                  )),
              AppWidgets().gapH16(),
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
                                  onTap: () {
                                    setState(() {
                                      data[index].seatNameAndNo[0].isSelected =
                                          !data[index]
                                              .seatNameAndNo[0]
                                              .isSelected;
                                      if(!data[index].seatNameAndNo[0].isSelected){
                                        controller.seatList.add(data[index].seatNameAndNo[0].seatNo); logger.i("sdfsef");
                                      }else{
                                        controller.seatList.remove(data[index].seatNameAndNo[0].seatNo);
                                        logger.i(controller.seatList.join(","));
                                        logger.i(data[index].seatNameAndNo[0].seatNo);
                                        // controller.seatList.removeAt(controller.seatList.indexOf(data[index].seatNameAndNo[0].seatNo));
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                                .seatNameAndNo[0]
                                                .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child: Text(
                                      data[index].seatNameAndNo[0].seatNo,
                                      style: textHeaderStyle(
                                          fontSize: 24, color: AppColors.white),
                                    ),
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
                                      if(!data[index].seatNameAndNo[1].isSelected){
                                        controller.seatList.add(data[index].seatNameAndNo[1].seatNo); logger.i("sdfsef");
                                      }else{
                                        controller.seatList.remove(data[index].seatNameAndNo[1].seatNo);
                                        logger.i(controller.seatList.join(","));
                                        logger.i(data[index].seatNameAndNo[1].seatNo);
                                        // controller.seatList.removeAt(controller.seatList.indexOf(data[index].seatNameAndNo[0].seatNo));
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                                .seatNameAndNo[1]
                                                .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child: Text(
                                      data[index].seatNameAndNo[1].seatNo,
                                      style: textHeaderStyle(
                                          fontSize: 24, color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              AppWidgets().gapW(Get.width * 0.2),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      data[index].seatNameAndNo[2].isSelected =
                                          !data[index]
                                              .seatNameAndNo[2]
                                              .isSelected;
                                      if(!data[index].seatNameAndNo[2].isSelected){
                                        controller.seatList.add(data[index].seatNameAndNo[2].seatNo); logger.i("sdfsef");
                                      }else{
                                        controller.seatList.remove(data[index].seatNameAndNo[2].seatNo);
                                        logger.i(controller.seatList.join(","));
                                        logger.i(data[index].seatNameAndNo[2].seatNo);
                                        // controller.seatList.removeAt(controller.seatList.indexOf(data[index].seatNameAndNo[0].seatNo));
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                                .seatNameAndNo[2]
                                                .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child: Text(
                                      data[index].seatNameAndNo[2].seatNo,
                                      style: textHeaderStyle(
                                          color: AppColors.white, fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                              AppWidgets().gapW12(),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      data[index].seatNameAndNo[3].isSelected =
                                          !data[index]
                                              .seatNameAndNo[3]
                                              .isSelected;
                                      if(!data[index].seatNameAndNo[3].isSelected){
                                        controller.seatList.add(data[index].seatNameAndNo[3].seatNo); logger.i("sdfsef");
                                      }else{
                                        controller.seatList.remove(data[index].seatNameAndNo[3].seatNo);
                                        logger.i(controller.seatList.join(","));
                                        logger.i(data[index].seatNameAndNo[3].seatNo);
                                        // controller.seatList.removeAt(controller.seatList.indexOf(data[index].seatNameAndNo[0].seatNo));
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 55.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: data[index]
                                                .seatNameAndNo[3]
                                                .isSelected
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: cornerRadius(8)),
                                    child: Text(
                                      data[index].seatNameAndNo[3].seatNo,
                                      style: textHeaderStyle(
                                          fontSize: 24, color: AppColors.white),
                                    ),
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
                      Get.dialog(
                        Obx(() {
                          return AlertDialog(
                            title: Text(
                              "Select your gateway",
                              style: textRegularStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                            titlePadding:
                                EdgeInsets.only(top: 30.h, left: 20.w),
                            content: SizedBox(
                              height: Get.height * 0.4,
                              width: Get.width * 0.8,
                              child: Column(
                                children: [
                                  const Divider(
                                    color: AppColors.blackPure,
                                  ),
                                  RadioListTile(
                                    title: Text("Bkash",
                                        style: textRegularStyle(fontSize: 23)),
                                    value: "Bkash",
                                    groupValue: controller.paymentGateway.value,
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (value) {
                                      controller
                                          .radioButtonChanged(value.toString());
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text("Nogod",
                                        style: textRegularStyle(fontSize: 23)),
                                    value: "Nogod",
                                    groupValue: controller.paymentGateway.value,
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (value) {
                                      controller
                                          .radioButtonChanged(value.toString());
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      "1Card",
                                      style: textRegularStyle(fontSize: 23),
                                    ),
                                    value: "1Card",
                                    activeColor: AppColors.primaryColor,
                                    groupValue: controller.paymentGateway.value,
                                    onChanged: (value) {
                                      controller
                                          .radioButtonChanged(value.toString());
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text("Card",
                                        style: textRegularStyle(fontSize: 23)),
                                    value: "Card",
                                    groupValue: controller.paymentGateway.value,
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (value) {
                                      controller
                                          .radioButtonChanged(value.toString());
                                    },
                                  ),
                                  AppWidgets().gapH20(),
                                  ElevatedButton(
                                    onPressed: () {
                                      AwesomeDialog(
                                        context: context,
                                        animType: AnimType.LEFTSLIDE,
                                        headerAnimationLoop: false,
                                        dialogType: DialogType.SUCCES,
                                        showCloseIcon: true,
                                        title: 'Payment Successful',
                                        desc:
                                            'Your ${controller.paymentGateway.value} payment successfully completed. Now you can move to next phase.',
                                        btnOkOnPress: () {
                                          Get.toNamed(AppRoutesConstant.ticket,arguments: [controller.paymentGateway.value,controller.vehicles]);
                                        },
                                        btnOkIcon: Icons.check_circle,
                                        // onDismissCallback: (type) {
                                        //   debugPrint('Dialog Dissmiss from callback $type');
                                        // },
                                      ).show();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        minimumSize:
                                            Size(Get.width * 0.35, 50.h)),
                                    child: Text(
                                      "Pay",
                                      style: textButtonStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: cornerRadius(12)),
                          );
                        }),
                      );
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
              AppWidgets().gapH(Get.height * 0.05)
            ],
          ),
        ),
      ),
    );
  }
}
