import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{
  final fromController=TextEditingController();
  final toController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  var selectedFromPlaces="Select".obs;
  var selectedToPlaces="Select".obs;
  final journeyDateController = TextEditingController();
  final returnDateController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    journeyDateController.text="";
    returnDateController.text="";
    super.onInit();
  }

  var fromPlaces=[
    "Dhanmondi",
    "Uttara",
    "Mirpur",
    "Shamoly",
    "Agargaon",
  ];
  var toPlaces=[
    "Ashulia",
    "Akrain",
    "Khagan"
  ];

  // Future<void> selectDate(BuildContext context) async {
  //   logger.e("selectDate");
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: Get.context!,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2025),
  //   );
  //
  //   if (pickedDate != null) {
  //     String formattedDate=DateFormat('yyyy-MM-dd').format(pickedDate);
  //     journeyDateController.text = formattedDate;
  //   }
  // }
}