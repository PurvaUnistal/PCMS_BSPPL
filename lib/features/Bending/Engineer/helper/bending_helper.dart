import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/AllCommonModel/SubmitDataModel.dart';
import 'package:flutter/material.dart';

class BendingHelper{

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required String reportNo,
    required String chainage,
    required String pipeNo,
    required String bendNo,
    required String bendDegree,
    required String minuteValue,
    required String secondValue,
    required String tpNo,

  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: "The Date field is required".toString(),context:  context);
       return false;
      } else if(reportNo.isEmpty){
        Utils.errorSnackBar(msg: "The Report Number field is required".toString(),context:  context);
        return false;
      } else if(chainage.isEmpty){
        Utils.errorSnackBar(msg: "The Chainage field is required".toString(),context:  context);
        return false;
      } else if(pipeNo.isEmpty){
        Utils.errorSnackBar(msg: "The Pipe Number field is required".toString(),context:  context);
        return false;
      } else if(bendNo.isEmpty){
        Utils.errorSnackBar(msg: "The Bend Number field is required".toString(),context:  context);
        return false;
      } else if(bendDegree.isEmpty){
        Utils.errorSnackBar(msg: "The Bend Degree field is required".toString(),context:  context);
        return false;
      } else if(minuteValue.isEmpty){
        Utils.errorSnackBar(msg: "The minute field is required".toString(),context:  context);
        return false;
      } else if(secondValue.isEmpty){
        Utils.errorSnackBar(msg: "The second field is required".toString(),context:  context);
        return false;
      } else if(tpNo.isEmpty){
        Utils.errorSnackBar(msg: "The TP Number field is required".toString(),context:  context);
        return false;
      }
      return true;
    }catch(e){
      log("catchBendingHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }

  static Future<SubmitDataModel?> submitData({
    required BuildContext context,
    required String sectionId,
    required String userId,
     String? alignmentSheet,
     String? weather,
     String? trDate,
     String? trReportNumber,
     String? trChainage,
     String? pipeNumber,
     String? bendNumber,
     String? tnDegree,
     String? trBend,
     String? tnMin,
     String? tnSec,
     String? tnTP,
     String? tnVisual,
     String? tnDisbonding,
     String? tnGauging,
     String? tnHoliday,
     String? tnOvality,
    String? fromKm,
    String? toKm,
    String? dailyProgress,
     String? bendDirection,
     String? bendChainageTo,
     String? tnRemarks,
     File? photo,

  }) async {
    Map<String, String> param = {
      "type": "bending",
      "SectionID":sectionId,
      "UserID": userId,
      "Alignment_Sheet": alignmentSheet  ?? "",
      "Weather": weather  ?? "",
      "TR_Date": trDate  ?? "",
      "TR_Report_Number": trReportNumber  ?? "",
      "TN_Chainage": trChainage  ?? "",
      "Pipe_Number": pipeNumber  ?? "",
      "Bend_Number": bendNumber  ?? "",
      "TN_Degree": tnDegree  ?? "",
      "TR_BEND": trBend  ?? "",
      "TN_Min": tnMin  ?? "",
      "TN_Sec": tnSec  ?? "",
      "TN_TP": tnTP  ?? "",
      "TN_Visual": tnVisual  ?? "",
      "TN_Disbonding": tnDisbonding  ?? "",
      "TN_Gauging": tnGauging  ?? "",
      "TN_Holiday": tnHoliday  ?? "",
      "TN_Ovality": tnOvality  ?? "",
      "from_km": fromKm ?? "",
      "to_km": toKm  ?? "",
      "daily_progress": dailyProgress ?? "",
      "BendDirection": bendDirection  ?? "",
      "BendChainage_to": bendChainageTo  ?? "",
      "TN_Remarks": tnRemarks  ?? "",
    };
    log("param-->${param}");
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
      log("catchBindingHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }
}