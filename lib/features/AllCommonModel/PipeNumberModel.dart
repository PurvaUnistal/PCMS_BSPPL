// To parse this JSON data, do
//
//     final pipeNumberModel = pipeNumberModelFromJson(jsonString);

import 'dart:convert';

PipeNumberModel pipeNumberModelFromJson(String str) => PipeNumberModel.fromJson(json.decode(str));

String pipeNumberModelToJson(PipeNumberModel data) => json.encode(data.toJson());

class PipeNumberModel {
  int code;
  String status;
  List<String> data;
  String message;

  PipeNumberModel({
    required this.code,
    required this.status,
    required this.data,
    required this.message,
  });

  factory PipeNumberModel.fromJson(Map<String, dynamic> json) => PipeNumberModel(
    code: json["code"],
    status: json["status"],
    data: List<String>.from(json["data"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x)),
    "message": message,
  };
  @override
  String toString() {
    // TODO: implement toString
    return data.toString();
  }
}
