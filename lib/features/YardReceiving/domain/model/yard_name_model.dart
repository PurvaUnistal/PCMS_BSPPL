// To parse this JSON data, do
//
//     final yardNameModel = yardNameModelFromJson(jsonString);

import 'dart:convert';

List<YardNameModel> yardNameModelFromJson(String str) => List<YardNameModel>.from(json.decode(str).map((x) => YardNameModel.fromJson(x)));

String yardNameModelToJson(List<YardNameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YardNameModel {
  final String? status;
  final String? id;
  final String? yardName;

  YardNameModel({
     this.status,
     this.id,
     this.yardName,
  });

  factory YardNameModel.fromJson(Map<String, dynamic> json) => YardNameModel(
    status: json["Status"],
    id: json["id"],
    yardName: json["Yard_Name"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "id": id,
    "Yard_Name": yardName,
  };
  @override
  String toString() {
    // TODO: implement toString
    return yardName.toString();
  }
}
