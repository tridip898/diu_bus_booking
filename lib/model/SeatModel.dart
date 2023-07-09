// To parse this JSON data, do
//
//     final seatModel = seatModelFromJson(jsonString);

import 'dart:convert';

List<SeatModel> seatModelFromJson(String str) => List<SeatModel>.from(json.decode(str).map((x) => SeatModel.fromJson(x)));

String seatModelToJson(List<SeatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SeatModel {
    List<SeatNameAndNo> seatNameAndNo;

    SeatModel({
        required this.seatNameAndNo,
    });

    factory SeatModel.fromJson(Map<String, dynamic> json) => SeatModel(
        seatNameAndNo: List<SeatNameAndNo>.from(json["SeatNameAndNo"].map((x) => SeatNameAndNo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "SeatNameAndNo": List<dynamic>.from(seatNameAndNo.map((x) => x.toJson())),
    };
}

class SeatNameAndNo {
    bool isSelected;
    String seatNo;

    SeatNameAndNo({
        required this.isSelected,
        required this.seatNo,
    });

    factory SeatNameAndNo.fromJson(Map<String, dynamic> json) => SeatNameAndNo(
        isSelected: json[" isSelected "],
        seatNo: json["SeatNo "],
    );

    Map<String, dynamic> toJson() => {
        " isSelected ": isSelected,
        "SeatNo ": seatNo,
    };
}
