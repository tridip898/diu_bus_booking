import 'package:bus_ticket_reseravtion_app/model/vehicle_model.dart';
import 'package:get/get.dart';

class BusListController extends GetxController{
  final List<VehicleModel> vehicle = vehicleModel.obs;
}