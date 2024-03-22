import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:flutter/material.dart';

class TrenchingHelper{

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
      "type": "trenching",
      "SectionID": "",
      "UserID": "",
      "TR_Trenching_Date": "",
      "TR_Report_Number": "",
      "ChainageFrom": "",
      "ChainageTo": "",
      "TN_Trenching_Lower_Width": "",
      "Alignment_Sheet": "",
      "TN_JointNumber_From": "",
      "TN_JointNumber_To": "",
      "MR_Distance_Cleared": "",
      "MN_Trenching_Depth": "",
      "MN_Trenching_UpperWidth": "",
      "TypeofTerrain": "",
      "Weather": "",
      "TN_Remarks": "",
    };
    try{
      var res = await ApiServer.postDataWithFile(
          keyWord: "ImageData",filePath:"",
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