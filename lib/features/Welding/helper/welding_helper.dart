import 'dart:convert';
import 'dart:developer';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Welding/domain/model/welder_model.dart';
import 'package:bsppl/features/Welding/domain/model/wps_model.dart';
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

  static Future<dynamic> validation({required BuildContext context}) async{
    try{

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
    required WelderModel cappingWelder1Data,
    required WelderModel cappingWelder2Data,
    required String electrodeDiaE8010,
    required String electrodeDiaE81t8gBatch,
    required String electrodeDiaE81t8g,
    required String electrodeDiaE6010Batch,
    required String electrodeDiaE6010,
    required String electrodeDiaE9045p2Batch,
    required String electrodeDiaB22B221868,
    required String electrodeDiaB22B221868Batch,
    required String electrodeDiaE9045p2,
    required String electrodeDia806012,
    required String electrodeEiaE8010p1Batch,
    required String electrodeBatch806012,
    required String electrodeEiaE8010p1,
    required String pipeDia,
    required String pipeThick,
    required WeatherModel weather,
    required String chainageFrom,
    required String chainageTo,
    required String process,
    required String material,
    required String fitUp,
    required String weldVisual,
}) async {
    String userId =  await PreferenceUtil.getString(key: PreferenceValue.userId);
    String sectionId =  await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    Map<String, String> param = {
      "type": "welding",
      "SectionID": sectionId,
      "UserID": userId,
      "TR_Welding_Date": date,
      "TR_Report_Number": reportNumber,
      "JointID": "",
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
      "CWelderNumber1": cappingWelder1Data.welderId ?? "",
      "CWelderNumber2": cappingWelder2Data.welderId ?? "",
      "electrode_e6010_dia": electrodeDiaE6010,
      "electrode_e6010_batch": electrodeDiaE6010Batch,
      "electrode_e8010_dia": electrodeDiaE8010,
      "electrode_e8010_batch": electrodeDiaE6010Batch,
      "electrode_e9045_dia": electrodeDiaE9045p2,
      "electrode_e9045_batch": electrodeDiaE9045p2Batch,
      "electrode_B221868_dia": electrodeDiaB22B221868,
      "electrode_B221868_batch": electrodeDiaB22B221868Batch,
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