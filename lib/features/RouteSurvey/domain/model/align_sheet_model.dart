// To parse this JSON data, do
//
//     final alignSheetModel = alignSheetModelFromJson(jsonString);

import 'dart:convert';

List<AlignSheetModel> alignSheetModelFromJson(String str) => List<AlignSheetModel>.from(json.decode(str).map((x) => AlignSheetModel.fromJson(x)));

String alignSheetModelToJson(List<AlignSheetModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlignSheetModel {
  final String? status;
  final String? alignmentId;
  final String? sectionId;
  final String? alignmentName;

  AlignSheetModel({
     this.status,
     this.alignmentId,
     this.sectionId,
     this.alignmentName,
  });

  factory AlignSheetModel.fromJson(Map<String, dynamic> json) => AlignSheetModel(
    status: json["Status"],
    alignmentId: json["AlignmentID"],
    sectionId: json["SectionID"],
    alignmentName: json["AlignmentName"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "AlignmentID": alignmentId,
    "SectionID": sectionId,
    "AlignmentName": alignmentName,
  };

  @override
  String toString() {
    // TODO: implement toString
    return alignmentId.toString();
  }
}


class AlignSheetRequestModel {
  final String type;
  final String sectionId;
  AlignSheetRequestModel(
      {required this.type, required this.sectionId,});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "type": type,
      "SectionID": sectionId,
    };
    return map;
  }
}
