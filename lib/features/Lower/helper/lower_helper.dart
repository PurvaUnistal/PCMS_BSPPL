import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/Backfilling/domain/model/SubmitDataModel.dart';
import 'package:flutter/material.dart';

class LowerHelper{

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required String reportNo,
    required String pipeNumber,
  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: "The Date field is required".toString(),context:  context);
        return false;
      } else if(reportNo.isEmpty){
        Utils.errorSnackBar(msg: "The Report Number field is required".toString(),context:  context);
        return false;
      } else if(pipeNumber.isEmpty){
        Utils.errorSnackBar(msg: "The Pipe Number field is required".toString(),context:  context);
        return false;
      }
      return true;
    }catch(e){
      log("catchLowerHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }


  static Future<SubmitDataModel?> submitData({
    required BuildContext context,
    required String sectionId,
    required String userId,
    required String loweringDate,
    String? loweringRepNo,
    String? chainageFrom,
    String? chainageTo,
    String? sectionLength,
    String? alignmentSheet,
    String? jointFrom,
    String? jointTo,
    String? prePadding,
    String? holidayChecking,
    String? postPadding,
    String? pipeMaterial,
    String? pipeDia,
    String? location,
    String? holidayDetector,
    String? model,
    String? voltage,
    String? calibration,
    String? repairDamages,
    String? weather,
    String? deWatering,
    String? paddingMaterial,
    String? padding,
    String? fromKm,
    String? toKm,
    String? dailyProgress,
    String? sectionNo,
    String? visualInsp,
    String? trenchAcceptance,
    String? coatingRepair,
    String? remarks,
    String? pipeID,
    File? photo,
  }) async {
    Map<String, String> param = {
      "type": "lowering",
      "SectionID": sectionId,
      "UserID": userId,
      "PipeID": pipeID ?? "",
      "LoweringDate": loweringDate,
      "LoweringRepNo": loweringRepNo ?? "",
      "ChainageFrom": chainageFrom ?? "",
      "ChainageTo": chainageTo ?? "",
      "SectionLength": sectionLength ?? "",
      "Alignment_Sheet": alignmentSheet == null ? "" : alignmentSheet,
      "JointFrom": jointFrom ?? "",
      "JointTo": jointTo ?? "",
      "PrePadding": prePadding == null ? "" : prePadding,
      "HolidayChecking": holidayChecking ?? "",
      "PostPadding": postPadding ?? "",
      "PipeMaterial": pipeMaterial ?? "",
      "PipeDia": pipeDia ?? "",
      "location": location ?? "",
      "holiday_detector": holidayDetector ?? "",
      "model": model ?? "",
      "voltage": voltage ?? "",
      "calibration": calibration ?? "",
      "repair_damages": repairDamages ?? "",
      "Weather": weather == null ? "" :weather,
      "Dewatering": deWatering== null ? "" :deWatering,
      "PaddingMaterial": paddingMaterial ?? "",
      "Padding": padding == null ? "" : padding,
      "from_km": fromKm ?? "",
      "to_km": toKm ?? "",
      "daily_progress": dailyProgress ?? "",
      "section_no": sectionNo ?? "",
      "visual_insp": visualInsp ?? "",
      "trench_acceptance": trenchAcceptance ?? "",
      "Coating_Repair": coatingRepair ?? "",
      "Remarks": remarks ?? "",
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
      log("catchLowerHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }
}