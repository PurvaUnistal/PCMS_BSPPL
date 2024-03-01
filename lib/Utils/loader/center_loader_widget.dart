import 'package:bsppl/Utils/commonClass/app_config.dart';
import 'package:bsppl/Utils/commonClass/enums.dart';
import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CenterLoaderWidget extends StatelessWidget {
  const CenterLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size  =  AppConfig.getDeviceType(context: context) == DeviceType.phone
        ? MediaQuery.of(context).size.width * 0.10
        : MediaQuery.of(context).size.width * 0.05;
    return Center(child:
    SpinKitCubeGrid(
      color: AppColor.appBlueColor,
      size: size,),);
  }
}