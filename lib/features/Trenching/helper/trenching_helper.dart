import 'dart:developer';
import 'dart:io';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/Backfilling/domain/model/SubmitDataModel.dart';
import 'package:flutter/material.dart';

class TrenchingHelper{

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required String reportNo,
    required String alignmentSheet,
    required String chainageFrom,
    required String chainageTo,
    required String distanceCleared,
  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: "The Date field is required".toString(),context:  context);
        return false;
      } else if(reportNo.isEmpty){
        Utils.errorSnackBar(msg: "The Report Number field is required".toString(),context:  context);
       return false;
      } else if(alignmentSheet == "null"){
        Utils.errorSnackBar(msg: "The Alignment Sheet field is required".toString(),context:  context);
        return  false;
      } else if(chainageFrom.isEmpty){
        Utils.errorSnackBar(msg: "The Chainage From field is required".toString(),context:  context);
        return  false;
      } else if(chainageTo.isEmpty){
        Utils.errorSnackBar(msg: "The Chainage To field is required".toString(),context:  context);
        return  false;
      } else if(distanceCleared.isEmpty){
        Utils.errorSnackBar(msg: "The Section Length field is required".toString(),context:  context);
        return  false;
      }
      return true;
    }catch(e){
      log("catchTrenchingHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }

  static Future<SubmitDataModel?> submitData({
    required BuildContext context,
    required String sectionId,
    required String userId,
    required String trTrenchingDate,
    required String trReportNumber,
    required String chainageFrom,
    required String chainageTo,
     String? tnTrenchingLowerWidth,
     required String alignmentSheet,
     String? tnJointNumberFrom,
     String? tnJointNumberTo,
     String? mrDistanceCleared,
     String? mnTrenchingDepth,
     String? mnTrenchingUpperWidth,
     String? typeOfTerrain,
     String? weather,
     String? from_km,
     String? to_km,
     String? dailyProgress,
     String? sectionNo,
     String? methodOfTrenching,
     String? beddingAccepted,
     String? tnRemarks,
     File? photo,
  }) async {
    Map<String, String> param = {
      "type": "trenching",
      "SectionID": sectionId,
      "UserID": userId,
      "TR_Trenching_Date": trTrenchingDate,
      "TR_Report_Number": trReportNumber,
      "ChainageFrom": chainageFrom,
      "ChainageTo": chainageTo,
      "TN_Trenching_Lower_Width": tnTrenchingLowerWidth ?? "",
      "Alignment_Sheet": alignmentSheet ?? "",
      "TN_JointNumber_From": tnJointNumberFrom ?? "",
      "TN_JointNumber_To": tnJointNumberTo ?? "",
      "MR_Distance_Cleared": mrDistanceCleared ?? "",
      "MN_Trenching_Depth": mnTrenchingDepth ?? "",
      "MN_Trenching_UpperWidth": mnTrenchingUpperWidth ?? "",
      "TypeofTerrain": typeOfTerrain ?? "",
      "Weather": weather ?? "",
      "from_km": from_km ?? "",
      "to_km": to_km ?? "",
      "daily_progress": dailyProgress ?? "",
      "section_no": sectionNo ?? "",
      "method_of_trenching": methodOfTrenching ?? "",
      "bedding_accepted": beddingAccepted ?? "",
      "TN_Remarks": tnRemarks ?? "",
    };
    log("json--${param}");
    try{
      var res = await ApiServer.postDataWithFile(
          keyWord: "ImageData",filePath: photo!.path.toString(),
          context: context,body: param);
      if(res != null && res["status"] == "success"){
        Utils.successSnackBar(msg: res["message"],context:  context);
          return SubmitDataModel.fromJson(res);
      }
      else if(res != null && res["status"] == "error"){
        Utils.errorSnackBar(msg: res["message"],context:  context);
        return null;
      }
    } catch(e){
      log("catchTrenchingHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }
}