import 'package:bus_ticket_reseravtion_app/constant/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class JourneyModel{
  final String? start;
  final String? destination;
  final String? journeyDate;

   JourneyModel({this.start, this.destination, this.journeyDate});
}


class HomeController extends GetxController{
  final fromController=TextEditingController();
  final toController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  var selectedFromPlaces="Select".obs;
  var selectedToPlaces="Select".obs;
  final journeyDateController = TextEditingController();
  final returnDateController = TextEditingController();
  final storage = const FlutterSecureStorage();

  final journeyModel= JourneyModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    journeyDateController.text="";
    returnDateController.text="";
    super.onInit();
  }

  var fromPlaces=[
    "Ashulia",
    "Dhanmondi",
    "Uttara",
    "Mirpur",
    "Shamoly",
    "Tongi",
    "Narayanganj",
    "Savar",
  ];
  var toPlaces=[
    "Ashulia",
    "Dhanmondi",
    "Uttara",
    "Mirpur",
    "Shamoly",
    "Tongi",
    "Narayanganj",
    "Savar",
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