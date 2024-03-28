import 'dart:io';

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
  File photo;
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
  WelderModel? filler4Welders1Value;
  WelderModel? filler4Welders2Value;
  WelderModel? filler5Welders1Value;
  WelderModel? filler5Welders2Value;
  WelderModel? filler6Welders1Value;
  WelderModel? filler6Welders2Value;
  WelderModel? filler7Welders1Value;
  WelderModel? filler7Welders2Value;
  WelderModel? filler8Welders1Value;
  WelderModel? filler8Welders2Value;
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
  List<WelderModel> filler4Welders1List;
  List<WelderModel> filler4Welders2List;
  List<WelderModel> filler5Welders1List;
  List<WelderModel> filler5Welders2List;
  List<WelderModel> filler6Welders1List;
  List<WelderModel> filler6Welders2List;
  List<WelderModel> filler7Welders1List;
  List<WelderModel> filler7Welders2List;
  List<WelderModel> filler8Welders1List;
  List<WelderModel> filler8Welders2List;
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
  TextEditingController electrodeDiaE8010Controller;
  TextEditingController electrodeDiaE6010Controller;
  TextEditingController electrodeBatchE6010Controller;
  TextEditingController electrodeBatchE8010Controller;
  TextEditingController electrodeDiaB22B221868Controller;
  TextEditingController electrodeBatchB22B221868Controller;
  TextEditingController electrodeDiaE9045Controller;
  TextEditingController electrodeBatchE9045p2Controller;
  TextEditingController electrodeDia806012Controller;
  TextEditingController electrodeBatch806012Controller;
  TextEditingController pipeDiameterController;
  TextEditingController pipeThickController;
  TextEditingController processController;
  TextEditingController materialController;
  TextEditingController activityRemarkController;

  WeldingFetchDataState({
    required this.photo,
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
    required this.filler4Welders1Value,
    required this.filler4Welders2Value,
    required this.filler5Welders1Value,
    required this.filler5Welders2Value,
    required this.filler6Welders1Value,
    required this.filler6Welders2Value,
    required this.filler7Welders1Value,
    required this.filler7Welders2Value,
    required this.filler8Welders1Value,
    required this.filler8Welders2Value,
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
    required this.filler4Welders1List,
    required this.filler4Welders2List,
    required this.filler5Welders1List,
    required this.filler5Welders2List,
    required this.filler6Welders1List,
    required this.filler6Welders2List,
    required this.filler7Welders1List,
    required this.filler7Welders2List,
    required this.filler8Welders1List,
    required this.filler8Welders2List,
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
    required this.electrodeDiaE8010Controller,
    required this.electrodeBatchE6010Controller,
    required this.electrodeBatchE8010Controller,
    required this.electrodeDiaB22B221868Controller,
    required this.electrodeBatchB22B221868Controller,
    required this.electrodeDiaE9045Controller,
    required this.electrodeBatchE9045p2Controller,
    required this.electrodeDia806012Controller,
    required this.electrodeBatch806012Controller,
    required this.pipeDiameterController,
    required this.pipeThickController,
    required this.processController,
    required this.materialController,
    required this.activityRemarkController,

  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    photo,
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
    filler4Welders1Value,
    filler4Welders2Value,
    filler5Welders1Value,
    filler5Welders2Value,
    filler6Welders1Value,
    filler6Welders2Value,
    filler7Welders1Value,
    filler7Welders2Value,
    filler8Welders1Value,
    filler8Welders2Value,
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
    filler4Welders1List,
    filler4Welders2List,
    filler5Welders1List,
    filler5Welders2List,
    filler6Welders1List,
    filler6Welders2List,
    filler7Welders1List,
    filler7Welders2List,
    filler8Welders1List,
    filler8Welders2List,
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
    electrodeDiaE8010Controller,
    electrodeBatchE6010Controller,
    electrodeBatchE8010Controller,
    electrodeDiaB22B221868Controller,
    electrodeBatchB22B221868Controller,
    electrodeDiaE9045Controller,
    electrodeBatchE9045p2Controller,
    electrodeDia806012Controller,
    electrodeBatch806012Controller,
    pipeDiameterController,
    pipeThickController,
    processController,
    materialController,
    activityRemarkController,
  ];
}