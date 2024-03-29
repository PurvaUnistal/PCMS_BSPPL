// To parse this JSON data, do
//
//     final submitDataModel = submitDataModelFromJson(jsonString);

import 'dart:convert';

SubmitDataModel submitDataModelFromJson(String str) => SubmitDataModel.fromJson(json.decode(str));

String submitDataModelToJson(SubmitDataModel data) => json.encode(data.toJson());

class SubmitDataModel {
  final int? code;
  final String? status;
  final dynamic data;
  final String? message;

  SubmitDataModel({
     this.code,
     this.status,
     this.data,
     this.message,
  });

  factory SubmitDataModel.fromJson(Map<String, dynamic> json) => SubmitDataModel(
    code: json["code"] ?? "",
    status: json["status"] ?? "",
    data: json["data"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data,
    "message": message,
  };
}
