// To parse this JSON data, do
//
//     final wpsModel = wpsModelFromJson(jsonString);

import 'dart:convert';

List<WpsModel> wpsModelFromJson(String str) => List<WpsModel>.from(json.decode(str).map((x) => WpsModel.fromJson(x)));

String wpsModelToJson(List<WpsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WpsModel {
  final String? status;
  final String? wpsId;
  final String? wpsName;

  WpsModel({
     this.status,
     this.wpsId,
     this.wpsName,
  });

  factory WpsModel.fromJson(Map<String, dynamic> json) => WpsModel(
    status: json["Status"],
    wpsId: json["WpsID"],
    wpsName: json["WPSName"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "WpsID": wpsId,
    "WPSName": wpsName,
  };

  @override
  String toString() {
    // TODO: implement toString
    return wpsName.toString();
  }
}
