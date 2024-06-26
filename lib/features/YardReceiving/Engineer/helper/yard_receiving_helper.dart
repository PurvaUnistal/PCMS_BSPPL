import 'dart:developer';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Server/app_url.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/model/yard_name_model.dart';
import 'package:flutter/material.dart';

class YardReceivingHelper{

  static Future<List<YardNameModel>?> yardNameData({required BuildContext context}) async {
    log("Url-->${AppUrl.yardName}");
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.yardName,context: context);
      if(res != null){
        return yardNameModelFromJson(res);
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