import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:flutter/material.dart';

class BendingHelper{

  static Future<dynamic> validation({required BuildContext context}) async{
    try{

    }catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }

  static Future<dynamic> submitData({required BuildContext context}) async {
    var param = {
      "type": "bending",
      "SectionID": "",
      "UserID": "",
      "Alignment_Sheet": "",
      "Weather": "",
      "TR_Date": "",
      "TR_Report_Number": "",
      "TN_Chainage": "",
      "Pipe_Number": "",
      "Bend_Number": "",
      "TN_Degree": "",
      "TR_BEND": "",
      "TN_Min": "",
      "TN_Sec": "",
      "TN_TP": "",
      "TN_Visual": "",
      "TN_Disbonding": "",
      "TN_Gauging": "",
      "TN_Holiday": "",
      "TN_Ovality": "",
      "TN_Remarks": "",
    };
    try{
      var res = await ApiServer.postDataWithFile(
          keyWord: "Photo",filePath:"",
          context: context,body: param);
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