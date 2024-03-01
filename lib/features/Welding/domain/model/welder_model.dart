// To parse this JSON data, do
//
//     final welderModel = welderModelFromJson(jsonString);

import 'dart:convert';

List<WelderModel> welderModelFromJson(String str) => List<WelderModel>.from(json.decode(str).map((x) => WelderModel.fromJson(x)));

String welderModelToJson(List<WelderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WelderModel {
  final String? status;
  final String? welderId;
  final String? welderName;

  WelderModel({
     this.status,
     this.welderId,
     this.welderName,
  });

  factory WelderModel.fromJson(Map<String, dynamic> json) => WelderModel(
    status: json["Status"],
    welderId: json["WelderID"],
    welderName: json["WelderName"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "WelderID": welderId,
    "WelderName": welderName,
  };

  @override
  String toString() {
    // TODO: implement toString
    return welderName.toString();
  }
}
