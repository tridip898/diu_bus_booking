import 'dart:convert';

import 'package:bus_ticket_reseravtion_app/model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController{
  late VehicleModel vehicles;

  List data=[];

  _readData() async{
    DefaultAssetBundle.of(Get.context!).loadString("lib/model/seat_model.json").then((value) {
      data=json.decode(value);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    vehicles=Get.arguments;
    _readData();
    super.onInit();
  }
}