import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:flutter/material.dart';

class RouteHandOverHelper{

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required reportNumber,
//    required alignmentSheet,
    required chainageFrom,
    required chainageTo,
  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.dateValid,context:  context);
        return false;
      }
      if(reportNumber.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.reportNoValid,context:  context);
        return false;
      }
     /* if(alignmentSheet.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.alignmentSheetValid,context:  context);
        return false;
      }*/
      if(chainageFrom.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.chainageFromValid,context:  context);
        return false;
      }
      if(chainageTo.isEmpty){
        Utils.errorSnackBar(msg: AppValidation.chainageToValid,context:  context);
        return false;
      }
      return true;
    } catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }

  static Future<dynamic> submitData({
    required BuildContext context,
    required String weather,
    required String date,
    required String trReportNumber,
    required String mrChainageFrom,
    required String mrChainageTo,
    required String terrian,
    required String village,
    required String tehsil,
    required String district,
    required String tnRemarks,
    required String photo,
  }) async {
    String userId =  await PreferenceUtil.getString(key: PreferenceValue.userId);
    String sectionId =  await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    var json = {
      "type": "rowhand",
      "UserID": userId,
      "SectionID": sectionId,
      "Weather": weather,
      "TR_Rouhandover_Date": date,
      "TR_Report_Number": trReportNumber,
      "MR_Chainage_From": mrChainageFrom,
      "MR_Chainage_To": mrChainageTo,
      "terrian": terrian,
      "Village": village,
      "Tehsil": tehsil,
      "District": district,
      "TN_Remarks": tnRemarks,
    };
    try{
      if (!context.mounted) return;
      var res = await ApiServer.postDataWithFile(context: context,body: json,
          keyWord: "Photo",filePath: photo.toString());
      if(res.toString().contains("1") && res != null){
        if (!context.mounted) return;
        Utils.successSnackBar(msg: "Route Handover Added Successfully.",context:  context);
        return res;
      } else  if(res.toString().contains("0") && res != null){
        if (!context.mounted) return;
        Utils.errorSnackBar(msg: "Something Wrong.",context:  context);
        return null;
      }
    }  catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }
}