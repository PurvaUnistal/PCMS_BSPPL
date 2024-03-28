import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/Backfilling/domain/model/SubmitDataModel.dart';
import 'package:flutter/material.dart';

class PipeCoatingHelper{

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required String reportNo,
    required String pipeNo,
  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: "The Date field is required".toString(),context:  context);
        return false;
      } else if(reportNo.isEmpty){
        Utils.errorSnackBar(msg: "The Report Number field is required".toString(),context:  context);
        return false;
      } else if(pipeNo.isEmpty){
        Utils.errorSnackBar(msg: "The Pipe Number field is required".toString(),context:  context);
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
    required String reportNo,
    required String userId,
    required String pipeCoatingDate,
    String? from_km,
    String? to_km,
    String? dailyProgress,
    String? relativeHumidity,
    String? airTemperature,
    String? dewPoint,
    String? pipeTemperature,
    String? manufacturer,
    String? materialType1,
    String? materialType2,
    String? materialBatch,
    String? defectLocation,
    String? repairArea,
    String? surfaceRemoval,
    String? visualInsp,
    String? preHeat,
    String? dftCheck,
    String? holidayTest,
    String? pipeNumber,
    String? remarks,
    String? serverURL,
    File? photo,
  }) async {
    Map<String, String> param = {
      "type": "PipeCoating",
    "PipeCoatingDate":pipeCoatingDate,
    "SectionID": sectionId,
    "ReportNo": reportNo,
    "from_km": from_km ?? "",
    "to_km":to_km ?? "",
    "daily_progress": dailyProgress ??"",
    "relative_humidity":relativeHumidity ?? "",
    "air_temperature":airTemperature ?? "",
    "dew_point":dewPoint ?? "",
    "pipe_temperature":pipeTemperature ?? "",
    "manufacturer": manufacturer ?? "",
    "material_type_1": materialType1 ?? "",
    "material_type_2": materialType2 ?? "",
    "material_batch":materialBatch ?? "",
    "defect_location":defectLocation ?? "",
    "repair_area":repairArea ?? "",
    "surface_removal": surfaceRemoval ?? "",
    "visual_insp": visualInsp ?? "",
    "pre_heat": preHeat ?? "",
    "DFT_check": dftCheck ?? "",
    "holiday_test": holidayTest ?? "",
    "PipeNumber":pipeNumber ?? "",
    "Remarks": remarks ?? "",
    "UserID":userId,
    "ServerURL": serverURL?? "",
    };
    log("json--${param}");
    try{
      var res = await ApiServer.postDataWithFile(
          keyWord: "Photo",filePath: photo!.path.toString(),
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