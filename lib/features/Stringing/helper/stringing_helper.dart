import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:flutter/material.dart';

class StringingHelper{

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
      "type": "stringing",
      "SectionID": "",
      "UserID": "",
      "TR_Stringing_Date": "",
      "TR_Report_Number": "",
      "Alignment_Sheet": "",
      "Weather": "",
      "MR_Chainage_From": "",
      "PipeDia": "",
      "PipeMaterial": "",
      "PipeID": "",
      "latitude": "",
      "longitude": "",
      "ConcreteCoating": "",
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