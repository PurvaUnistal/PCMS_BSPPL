import 'dart:convert';
import 'dart:developer';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/Login/domain/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginHelper {
  static Future<dynamic> textFieldValidation(
      {required String email,
      required password,
      required BuildContext context}) async {
    try {
      if (email.isEmpty) {
        Utils.errorSnackBar(msg:AppString.userName,context:context);
        return false;
      } else if (password.isEmpty) {
        Utils.errorSnackBar(msg:AppString.password,context:context);
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      Utils.errorSnackBar(msg: e.toString(),context: context);
      return false;
    }
  }

  static Future<LoginModel?> loginData(
      {required String emailId,
      required String password,
      required BuildContext context}) async {
    LoginRequestModel loginRequestModel = LoginRequestModel(
      email: emailId,
      password: password,
      deviceId: '',
    );
    var jsonData = json.encode(loginRequestModel);
    log("jsonData-->${jsonData.toString()}");
    log("jsonData-->${AppUrl.baseUrl + jsonData}");
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.login + jsonData, context: context);
      if(res != null){
        return loginModelFromJson(res);
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg:e.toString(),context:context);
      return null;
    }
    return null;
  }
}
