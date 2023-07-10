class VehicleModel {
  final String busName;
  final String time;
  final String driverName;
  final String route;
  final String fare;

  VehicleModel(
      {required this.busName,
      required this.time,
      required this.driverName,
      required this.route,
      required this.fare});
}

List<VehicleModel> vehicleModel=[
  VehicleModel(busName: "Rojonigondha", time: "8:30 am", driverName: "Aslam", route: "Dhanmondi-Ashulia", fare: "25 tk"),
  VehicleModel(busName: "Surjomukhi", time: "10:00 am", driverName: "Hossen", route: "Mirpur-Ashulia", fare: "20 tk"),
  VehicleModel(busName: "Dolphin", time: "3:30 pm", driverName: "Latif", route: "Ashulia-Narayanganj", fare: "35 tk"),
  VehicleModel(busName: "Surjomukhi", time: "12:30 pm", driverName: "Jubaiar", route: "Dhanmondi-Ashulia", fare: "25 tk"),
  VehicleModel(busName: "Rojonigondha", time: "9:45 am", driverName: "Nirob", route: "Tongi-Ashulia", fare: "25 tk"),
  VehicleModel(busName: "Dolphin", time: "2:30 pm", driverName: "Kalam", route: "Ashulia-Savar", fare: "25 tk"),
  VehicleModel(busName: "Rojonigondha", time: "8:30 am", driverName: "Shipon", route: "Shamoly-Ashulia", fare: "20 tk"),
  VehicleModel(busName: "Dolphin", time: "5:30 pm", driverName: "Fahim", route: "Ashulia-Mirpur", fare: "20 tk"),
  VehicleModel(busName: "Surjomukhi", time: "7:30 am", driverName: "Hridoy", route: "Savar-Ashulia", fare: "25 tk"),
  VehicleModel(busName: "Surjomukhi", time: "11:30 am", driverName: "Mahmud", route: "Dhanmondi-Ashulia", fare: "25 tk"),
  VehicleModel(busName: "Rojonigondha", time: "5:00 pm", driverName: "Shanto", route: "Ashulia-Tongi", fare: "25 tk"),
  VehicleModel(busName: "Dolphin", time: "4:30 pm", driverName: "Kiron", route: "Ashulia-Uttara", fare: "25 tk"),
  VehicleModel(busName: "Surjomukhi", time: "9:15 am", driverName: "Niloy", route: "Uttara-Ashulia", fare: "25 tk"),
  VehicleModel(busName: "Dolphin", time: "8:30 am", driverName: "Foyej", route: "Narayanganj-Ashulia", fare: "35 tk"),
];
