import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:flutter/material.dart';

class RouteSurveyHelper{


  static Future<List<AlignSheetModel>?> alignSheetData({required String sectionId, required BuildContext context}) async {
    var param = {
      "type": "align",
      "SectionID": sectionId,
    };
    String json =  Uri(queryParameters: param).query;
    log("Url-->${AppUrl.baseUrl + json.toString()}");
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.alignSheet + json, context: context);
      if(res != null){
        return alignSheetModelFromJson(res);
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required reportNumber,
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
    required String date,
    required String sectionID,
    required String mrChainageFrom,
    required String mrChainageTo,
    required String trReportNumber,
    required String alignmentSheet,
    required String weather,
    required String bearingangle,
    required String ipChainage,
    required String nameStructure,
    required String ipNo,
    required String tpRemark,
    required String terrian,
    required String chainage,
    required String others,
    required String remarks,
    required File photo,
  }) async {
    var json = {
      "type": "rou",
      "SectionID": sectionID,
      "MR_Chainage_From": mrChainageFrom,
      "MR_Chainage_To":mrChainageTo,
      "TR_Report_Number": trReportNumber,
      "Alignment_Sheet": alignmentSheet,
      "Weather": weather,
      "bearingangle": bearingangle,
      "IpChainage": ipChainage,
      "namestructre": nameStructure,
      "Ipno": ipNo,
      "tpremark": tpRemark,
      "terrian": terrian,
      "chainage": chainage,
      "TR_Rou_Date": date,
      "Others": others,
      "TN_Remarks": remarks,
    };
    try{
      var res = await ApiServer.postDataWithFile(context: context,body: json, keyWord: "Photo",
          filePath: photo.path.toString());
      if(res != null){
      //  return alignSheetModelFromJson(res);
      }
    } catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }



}