// To parse this JSON data, do
//
//     final submitModel = submitModelFromJson(jsonString);

import 'dart:convert';

SubmitModel submitModelFromJson(String str) => SubmitModel.fromJson(json.decode(str));

String submitModelToJson(SubmitModel data) => json.encode(data.toJson());

class SubmitModel {
  final int? code;
  final String? status;
  final bool? data;
  final String? message;

  SubmitModel({
     this.code,
     this.status,
     this.data,
     this.message,
  });

  factory SubmitModel.fromJson(Map<String, dynamic> json) => SubmitModel(
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
