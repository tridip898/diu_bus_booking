import 'package:bus_ticket_reseravtion_app/model/vehicle_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class TicketController extends GetxController{
  late String paymentMethod;
  late VehicleModel vehicleModel;
  final storage=const FlutterSecureStorage();
  RxString journeyDate="".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    paymentMethod=Get.arguments[0];
    vehicleModel=Get.arguments[1];
    getJourneyDate();
    super.onInit();
  }


  Future<void> getJourneyDate() async {
    journeyDate.value= (await storage.read(key: 'journeyDate'))!;

  }
  @override
  void onClose() {
    print("Finish");
    super.onClose();
  }
}