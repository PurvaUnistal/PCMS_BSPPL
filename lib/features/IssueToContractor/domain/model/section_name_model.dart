// To parse this JSON data, do
//
//     final sectionNameModel = sectionNameModelFromJson(jsonString);

import 'dart:convert';

List<SectionNameModel> sectionNameModelFromJson(String str) => List<SectionNameModel>.from(json.decode(str).map((x) => SectionNameModel.fromJson(x)));

String sectionNameModelToJson(List<SectionNameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SectionNameModel {
  final String? status;
  final String? sectionId;
  final String? sectionName;

  SectionNameModel({
     this.status,
     this.sectionId,
     this.sectionName,
  });

  factory SectionNameModel.fromJson(Map<String, dynamic> json) => SectionNameModel(
    status: json["Status"],
    sectionId: json["SectionID"],
    sectionName: json["SectionName"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "SectionID": sectionId,
    "SectionName": sectionName,
  };
  @override
  String toString() {
    // TODO: implement toString
    return sectionName.toString();
  }
}
