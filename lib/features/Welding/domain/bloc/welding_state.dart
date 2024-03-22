import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Welding/domain/model/welder_model.dart';
import 'package:bsppl/features/Welding/domain/model/wps_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeldingState extends Equatable{}

class WeldingInitialState extends WeldingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeldingPageLoadState extends WeldingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeldingFetchDataState extends WeldingState{
  bool isPageLoader;
  bool isLoader;
  bool isFitUpValue;
  bool isWeldVisualValue;
  AlignSheetModel? alignSheetValue;
  WeatherModel? weatherValue;
  JointTypeModel? jointTypeValue;
  WpsModel? wpsValue;
  WelderModel? rootWelders1Value;
  WelderModel? rootWelders2Value;
  WelderModel? hotWelders1Value;
  WelderModel? hotWelders2Value;
  WelderModel? filler1Welders1Value;
  WelderModel? filler1Welders2alue;
  WelderModel? filler2Welders1Value;
  WelderModel? filler2Welders2Value;
  WelderModel? filler3Welders1Value;
  WelderModel? filler3Welders2Value;
  WelderModel? cappingWelder1Value;
  WelderModel? cappingWelder2Value;
  List<AlignSheetModel> alignSheetList;
  List<WeatherModel> weatherList;
  List<JointTypeModel> jointTypeList;
  List<WpsModel> wpsList;
  List<WelderModel> rootWelders1List;
  List<WelderModel>  rootWelders2List;
  List<WelderModel> hotWelders1List;
  List<WelderModel> hotWelders2List;
  List<WelderModel> filler1Welders1List;
  List<WelderModel> filler1Welders2List;
  List<WelderModel> filler2Welders1List;
  List<WelderModel> filler2Welders2List;
  List<WelderModel> filler3Welders1List;
  List<WelderModel> filler3Welders2List;
  List<WelderModel> cappingWelder1List;
  List<WelderModel> cappingWelder2List;
  TextEditingController dateController;
  TextEditingController reportNumberController;
  TextEditingController chainageFromController;
  TextEditingController chainageToController;
  TextEditingController leftPipeNumberController;
  TextEditingController rightPipeNumberController;
  TextEditingController kmController;
  TextEditingController jointNoController;
  TextEditingController suffixController;
  TextEditingController electrodeDiaE6010Controller;
  TextEditingController electrodeDiaE6010BatchController;
  TextEditingController electrodeDiaE8010p1Controller;
  TextEditingController electrodeDiaE8010p1BatchController;
  TextEditingController electrodeDiaE9045p2Controller;
  TextEditingController electrodeDiaE9045p2BatchController;
  TextEditingController electrodeDiaE81t8gController;
  TextEditingController electrodeDiaE81t8gBatchController;
  TextEditingController pipeDiameterController;
  TextEditingController pipeThickController;
  TextEditingController processController;
  TextEditingController materialController;
  TextEditingController activityRemarkController;

  WeldingFetchDataState({
    required this.isPageLoader,
    required this.isLoader,
    required this.isFitUpValue,
    required this.isWeldVisualValue,
    required this.alignSheetValue,
    required this.weatherValue,
    required this.jointTypeValue,
    required this.wpsValue,
    required this.rootWelders1Value,
    required this.rootWelders2Value,
    required this.hotWelders1Value,
    required this.hotWelders2Value,
    required this.filler1Welders1Value,
    required this.filler1Welders2alue,
    required this.filler2Welders1Value,
    required this.filler2Welders2Value,
    required this.filler3Welders1Value,
    required this.filler3Welders2Value,
    required this.cappingWelder1Value,
    required this.cappingWelder2Value,
    required this.alignSheetList,
    required this.weatherList,
    required this.jointTypeList,
    required this.wpsList,
    required this.rootWelders1List,
    required this. rootWelders2List,
    required this.hotWelders1List,
    required this.hotWelders2List,
    required this.filler1Welders1List,
    required this.filler1Welders2List,
    required this.filler2Welders1List,
    required this.filler2Welders2List,
    required this.filler3Welders1List,
    required this.filler3Welders2List,
    required this.cappingWelder1List,
    required this.cappingWelder2List,
    required this.dateController,
    required this.reportNumberController,
    required this.chainageFromController,
    required this.chainageToController,
    required this.leftPipeNumberController,
    required this.rightPipeNumberController,
    required this.kmController,
    required this.jointNoController,
    required this.suffixController,
    required this.electrodeDiaE6010Controller,
    required this.electrodeDiaE6010BatchController,
    required this.electrodeDiaE8010p1Controller,
    required this.electrodeDiaE8010p1BatchController,
    required this.electrodeDiaE9045p2Controller,
    required this.electrodeDiaE9045p2BatchController,
    required this.electrodeDiaE81t8gController,
    required this.electrodeDiaE81t8gBatchController,
    required this.pipeDiameterController,
    required this.pipeThickController,
    required this.processController,
    required this.materialController,
    required this.activityRemarkController,

});
  @override
  // TODO: implement props
  List<Object?> get props => [
   isPageLoader,
    isLoader,
   isFitUpValue,
   isWeldVisualValue,
   alignSheetValue,
   weatherValue,
   jointTypeValue,
   wpsValue,
   rootWelders1Value,
   rootWelders2Value,
   hotWelders1Value,
   hotWelders2Value,
   filler1Welders1Value,
   filler1Welders2alue,
   filler2Welders1Value,
   filler2Welders2Value,
   filler3Welders1Value,
   filler3Welders2Value,
   cappingWelder1Value,
   cappingWelder2Value,
   alignSheetList,
   weatherList,
   jointTypeList,
   wpsList,
   rootWelders1List,
    rootWelders2List,
   hotWelders1List,
   hotWelders2List,
   filler1Welders1List,
   filler1Welders2List,
   filler2Welders1List,
   filler2Welders2List,
   filler3Welders1List,
   filler3Welders2List,
   cappingWelder1List,
   cappingWelder2List,
   dateController,
   reportNumberController,
   chainageFromController,
   chainageToController,
   leftPipeNumberController,
   rightPipeNumberController,
   kmController,
   jointNoController,
   suffixController,
   electrodeDiaE6010Controller,
   electrodeDiaE6010BatchController,
   electrodeDiaE8010p1Controller,
   electrodeDiaE8010p1BatchController,
   electrodeDiaE9045p2Controller,
   electrodeDiaE9045p2BatchController,
   electrodeDiaE81t8gController,
   electrodeDiaE81t8gBatchController,
   pipeDiameterController,
   pipeThickController,
   processController,
   materialController,
    activityRemarkController,
  ];
}