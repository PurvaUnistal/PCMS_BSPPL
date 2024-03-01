import 'dart:convert';
import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
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

  static Future<dynamic> submitData({required BuildContext context}) async {
    var param = {
      "type": "",
      "SectionID": "",
    };
    try{
      var res = await ApiServer.postData(context: context,body: param);
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