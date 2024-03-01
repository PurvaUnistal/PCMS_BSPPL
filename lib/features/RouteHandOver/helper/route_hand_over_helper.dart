import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:flutter/material.dart';

class RouteHandOverHelper{

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required reportNumber,
    required chainageFrom,
    required chainageTo,}) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.dateValid,context:  context);
        return false;
      }
      if(reportNumber.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.reportNoValid,context:  context);
        return false;
      }
      if(chainageFrom.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.chainageFromValid,context:  context);
        return false;
      }
      if(chainageTo.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.chainageToValid,context:  context);
        return false;
      }
      return true;
    }catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }

  static Future<dynamic> submitData({required BuildContext context}) async {
    var param = {
      "type": "rowhand",
      "UserID": "",
      "SectionID": "",
      "Weather": "",
      "TR_Rouhandover_Date": "",
      "TR_Report_Number": "",
      "MR_Chainage_From": "",
      "MR_Chainage_To": "",
      "terrian": "",
      "Village": "",
      "Tehsil": "",
      "District": "",
      "TN_Remarks": "",
    };
    try{
      var res = await ApiServer.postData(context: context,body: param);
      if(res != null){
          return res;
      }
    } catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }
}