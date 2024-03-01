// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final Posts? posts;

  LoginModel({
    this.posts,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        posts: Posts.fromJson(json["posts"]),
      );

  Map<String, dynamic> toJson() => {
        "posts": posts?.toJson(),
      };
}

class Posts {
  final Status status;

  Posts({
    required this.status,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
      };
}

class Status {
  final String type;
  final String value;

  Status({
    required this.type,
    required this.value,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class LoginRequestModel {
  final String email;
  final String password;
  final String deviceId;
  LoginRequestModel(
      {required this.email, required this.password, required this.deviceId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "UserName": email,
      "Password": password,
      "Device_id": deviceId,
    };
    return map;
  }
}
