import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/model/section_name_model.dart';
import 'package:flutter/material.dart';

class IssueToContractorHelper{
  static Future<List<SectionNameModel>?> sectionNameData({required BuildContext context,required String sectionId }) async {
    var param = {
      "SectionID" : sectionId
    };
    String json = Uri(queryParameters: param).query;
    log("Url-->${AppUrl.sectionName}");
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.sectionName + json,context: context);
      if(res != null){
        return sectionNameModelFromJson(res);
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context:  context);
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