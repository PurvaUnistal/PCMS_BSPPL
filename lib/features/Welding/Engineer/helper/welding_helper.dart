import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/AllCommonModel/SubmitDataModel.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Welding/Engineer/domain/model/welder_model.dart';
import 'package:bsppl/features/Welding/Engineer/domain/model/wps_model.dart';
import 'package:flutter/material.dart';

class WeldingHelper{

  static Future<List<WpsModel>?> wpsTypeAPIData({required String sectionId, required BuildContext context}) async {
    var param = {
      "SectionID": sectionId,
    };
    String json =  Uri(queryParameters: param).query;
    log("Url-->${AppUrl.baseUrl + json.toString()}");
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.wpsType + json, context: context);
      if(res != null){
        return wpsModelFromJson(res);
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg:e.toString(),context:context);
      return null;
    }
    return null;
  }

  static Future<List<WelderModel>?> welderAPIData({required String sectionId, required BuildContext context}) async {
    var param = {
      "SectionID": sectionId,
    };
    String json =  Uri(queryParameters: param).query;
    log("Url-->${AppUrl.baseUrl + json.toString()}");
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.welder + json, context: context);
      if(res != null){
        return welderModelFromJson(res);
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg:e.toString(),context:context);
      return null;
    }
    return null;
  }

  static Future<dynamic> validation({
    required BuildContext context,
    required String date,
    required String reportNo,
    required String chainageFrom,
    required String chainageTo,
    required String rightPipeNumber,
    required String leftPipeNumber,
    required String jointType,
    required String jointNo,
  }) async{
    try{
      if(date.isEmpty){
        Utils.errorSnackBar(msg: "The Date field is required".toString(),context:  context);
        return false;
      } else if(reportNo.isEmpty){
        Utils.errorSnackBar(msg: "The Report Number field is required".toString(),context:  context);
        return false;
      } else if(chainageFrom.isEmpty){
        Utils.errorSnackBar(msg: "The Chainage From field is required".toString(),context:  context);
        return false;
      } else if(chainageTo.isEmpty){
        Utils.errorSnackBar(msg: "The Chainage To field is required".toString(),context:  context);
        return false;
      } else if(leftPipeNumber.isEmpty){
        Utils.errorSnackBar(msg: "The Left Pipe Number field is required".toString(),context:  context);
        return false;
      } else if(rightPipeNumber.isEmpty){
        Utils.errorSnackBar(msg: "The Right Pipe Number field is required".toString(),context:  context);
        return false;
      } else if(jointType == "null"){
        Utils.errorSnackBar(msg: "The Joint Type field is required".toString(),context:  context);
        return false;
      }else if(jointNo.isEmpty){
        Utils.errorSnackBar(msg: "The Joint Number field is required".toString(),context:  context);
        return false;
      }
      return true;
    }catch(e){
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
  }

  static Future<dynamic> submitData({
    required BuildContext context,
    required AlignSheetModel alignmentData,
    required String reportNumber,
    required String JointId,
    required String date,
    required String leftPipeNumber,
    required String rightPipeNumber,
    required WpsModel wpsNo,
    required String activityRemark,
    required WelderModel rootWelders1Data,
    required WelderModel rootWelders2Data,
    required WelderModel hotWelders1Data,
    required WelderModel hotWelders2Data,
    required WelderModel filler1Welders1Data,
    required WelderModel filler1Welders2Data,
    required WelderModel filler2Welders1Data,
    required WelderModel filler2Welders2Data,
    required WelderModel filler3Welders1Data,
    required WelderModel filler3Welders2Data,
    required WelderModel filler4Welders1Data,
    required WelderModel filler4Welders2Data,
    required WelderModel filler5Welders1Data,
    required WelderModel filler5Welders2Data,
    required WelderModel filler6Welders1Data,
    required WelderModel filler6Welders2Data,
    required WelderModel filler7Welders1Data,
    required WelderModel filler7Welders2Data,
    required WelderModel filler8Welders1Data,
    required WelderModel filler8Welders2Data,
    required WelderModel cappingWelder1Data,
    required WelderModel cappingWelder2Data,
    required String electrodeDiaE8010,
    required String electrodeDiaE6010,
    required String electrodeBatchE6010,
    required String electrodeBatchE8010,
    required String electrodeDiaB22B221868,
    required String electrodeBatchB22B221868,
    required String electrodeDiaE9045,
    required String electrodeBatchE9045p2,
    required String electrodeDia806012,
    required String electrodeBatch806012,
    required String pipeDia,
    required String pipeThick,
    required WeatherModel weather,
    required String chainageFrom,
    required String chainageTo,
    required String process,
    required String material,
    required String fitUp,
    required String weldVisual,
    required File photo,
  }) async {
    String userId =  await PreferenceUtil.getString(key: PreferenceValue.userId);
    String sectionId =  await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    Map<String, String> param = {
      "type": "welding",
      "SectionID": sectionId,
      "UserID": userId,
      "TR_Welding_Date": date,
      "TR_Report_Number": reportNumber,
      "JointID": JointId,
      "LeftPipeNumber": leftPipeNumber,
      "RightPipeNumber": rightPipeNumber,
      "WPSNo": wpsNo.wpsId ?? "",
      "RWelderNumber1": rootWelders1Data.welderId ?? "",
      "RWelderNumber2": rootWelders2Data.welderId ?? "",
      "HWelderNumber1": hotWelders1Data.welderId ?? "",
      "HWelderNumber2": hotWelders2Data.welderId ?? "",
      "FWelderNumber1": filler1Welders1Data.welderId ?? "",
      "FWelderNumber2": filler1Welders2Data.welderId ?? "",
      "F2WelderNumber1": filler2Welders1Data.welderId ?? "",
      "F2WelderNumber2": filler2Welders2Data.welderId ?? "",
      "F3WelderNumber1": filler3Welders1Data.welderId ?? "",
      "F3WelderNumber2": filler3Welders2Data.welderId ?? "",
      "F4WelderNumber1": filler4Welders1Data.welderId ?? "",
      "F4WelderNumber2": filler4Welders2Data.welderId ?? "",
      "F5WelderNumber1": filler5Welders1Data.welderId ?? "",
      "F5WelderNumber2": filler5Welders2Data.welderId ?? "",
      "F6WelderNumber1": filler6Welders1Data.welderId ?? "",
      "F6WelderNumber2": filler6Welders2Data.welderId ?? "",
      "F7WelderNumber1": filler7Welders1Data.welderId ?? "",
      "F7WelderNumber2": filler7Welders2Data.welderId ?? "",
      "F8WelderNumber1": filler8Welders1Data.welderId ?? "",
      "F8WelderNumber2": filler8Welders1Data.welderId ?? "",
      "CWelderNumber1": cappingWelder1Data.welderId ?? "",
      "CWelderNumber2": cappingWelder2Data.welderId ?? "",
      "electrode_e6010_dia": electrodeDiaE6010,
      "electrode_e6010_batch": electrodeBatchE6010,
      "electrode_e8010_dia": electrodeDiaE8010,
      "electrode_e8010_batch": electrodeBatchE8010,
      "electrode_e9045_dia": electrodeDiaE9045,
      "electrode_e9045_batch": electrodeBatchE9045p2,
      "electrode_B221868_dia": electrodeDiaB22B221868,
      "electrode_B221868_batch": electrodeBatchB22B221868,
      "electrode_806012_dia": electrodeDia806012,
      "electrode_806012_batch": electrodeBatch806012,
      "Pipe_dia": pipeDia,
      "Pipe_thick": pipeThick,
      "Weather": weather.id ?? "",
      "ChainageFrom": chainageFrom,
      "ChainageTo": chainageTo,
      "Process": process,
      "Material": material,
      "Fitup": fitUp,
      "Weld_Visual": weldVisual,
      "TR_alignment": alignmentData.alignmentId ?? "",
      "TN_Remarks": activityRemark,
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
      log("catchBindingHelper-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
      return null;
    }
    return null;
  }
}