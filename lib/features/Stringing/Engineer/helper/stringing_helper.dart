import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/AllCommonModel/PipeNumberModel.dart';
import 'package:bsppl/features/AllCommonModel/SubmitDataModel.dart';
import 'package:flutter/material.dart';

class StringingHelper{


  static Future<dynamic> validationPipeNo({
    required BuildContext context,
    required String pipeNumber,
  }) async{
try{
  if(pipeNumber.isEmpty){
    Utils.errorSnackBar(msg: "The Search Pipe field is required".toString(),context:  context);
    return false;
  }
  return true;
}catch(e){
  log("validationPipeNo-->${e.toString()}");
  Utils.errorSnackBar(msg: e.toString(),context:  context);
  return null;
}
}


  static Future<PipeNumberModel?> pipeNumberData({
    required BuildContext context,
    required String page,
  }) async {
    Map<String, String> param = {
      "type": "getPipeNumber",
      "SectionID": page,
    };
    log("paramPipeNumber-->${param}");
    try{
      var res = await ApiServer.postData(
        urlEndPoint: AppUrl.submitAll,
          context: context,body: param);
      if(res != null && res["status"] == "success"){
        return PipeNumberModel.fromJson(res);
      }
    } catch(e){
      log("catchgetPipeNumber-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }


  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required String reportNo,
    required String alignmentSheet,
    required String pipeNumber,
  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: "The Date field is required".toString(),context:  context);
        return false;
      } else if(reportNo.isEmpty){
        Utils.errorSnackBar(msg: "The Report Number field is required".toString(),context:  context);
        return false;
      }else if(alignmentSheet == "null"){
        Utils.errorSnackBar(msg: "The Alignment Sheet field is required".toString(),context:  context);
        return  false;
      }  else if(pipeNumber == " null"){
        Utils.errorSnackBar(msg: "The Pipe Number field is required".toString(),context:  context);
        return false;
      }
      return true;
    }catch(e){
      log("catchStringingHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }


  static Future<SubmitDataModel?> submitData({
    required BuildContext context,
    required String sectionId,
    required String userId,
    required String date,
    required String reportNo,
    required String alignmentSheet,
    required String weather,
    required String mrChainageFrom,
    required String pipeDia,
    required String pipeMaterial,
    required String pipeID,
    required String latitude,
    required String longitude,
    required String concreteCoating,
    required String tnRemarks,
    required File photo,

  }) async {

    Map<String, String> param = {
      "type": "stringing",
      "SectionID": sectionId,
      "UserID": userId,
      "TR_Stringing_Date": date,
      "TR_Report_Number": reportNo,
      "Alignment_Sheet": alignmentSheet,
      "Weather": weather,
      "MR_Chainage_From": mrChainageFrom,
      "PipeDia": pipeDia,
      "PipeMaterial": pipeMaterial,
      "PipeID": pipeID,
      "latitude": latitude,
      "longitude": longitude,
      "ConcreteCoating": concreteCoating,
      "TN_Remarks": tnRemarks,
    };
    log("param-->${param}");
    try{
      var res = await ApiServer.postDataWithFile(
          keyWord: "ImageData",filePath: photo.path.toString(),
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