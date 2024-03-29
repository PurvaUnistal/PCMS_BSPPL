import 'package:bsppl/features/AllCommonModel/plastic_grating_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BackfillingState extends Equatable{}

class BackfillingInitialState extends BackfillingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BackfillingPageLoadState extends BackfillingState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BackfillingFetchDataState extends BackfillingState{
  final bool isPageLoader;
  final AlignSheetModel? alignSheetValue;
  final JointTypeModel? jointTypeFromValue;
  final JointTypeModel? jointTypeToValue;
  final WeatherModel? weatherValue;
  final PlasticGratingModel? plasticGratingValue;
  final List<AlignSheetModel>  alignSheetList;
  final List<JointTypeModel> jointTypeFromList;
  final List<JointTypeModel> jointTypeToList;
  final List<WeatherModel> weatherList;
  final List<PlasticGratingModel> plasticGratingList;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final TextEditingController kmFromController;
  final TextEditingController jointNoFromController;
  final TextEditingController suffixFromController;
  final TextEditingController kmToController;
  final TextEditingController jointNoToController;
  final TextEditingController suffixToController;
  final TextEditingController chainageFromController;
  final TextEditingController chainageToController;
  final TextEditingController sectionLengthController;
  final TextEditingController postPoddingController;
  final TextEditingController slopeBreakerController;
  final TextEditingController antiBuoancyController;
  final TextEditingController warningMaterialController;
  final TextEditingController activityRemarkController;
  BackfillingFetchDataState({
    required this.isPageLoader,
    required this.alignSheetValue,
    required this.jointTypeFromValue,
    required this.jointTypeToValue,
    required this.weatherValue,
    required this.plasticGratingValue,
    required this.alignSheetList,
    required this.jointTypeFromList,
    required this.jointTypeToList,
    required this.weatherList,
    required this.plasticGratingList,
    required this.dateController,
    required this.reportNumberController,
    required this.kmFromController,
    required this.jointNoFromController,
    required this.suffixFromController,
    required this.kmToController,
    required this.jointNoToController,
    required this.suffixToController,
    required this.chainageFromController,
    required this.chainageToController,
    required this.sectionLengthController,
    required this.postPoddingController,
    required this.slopeBreakerController,
    required this.antiBuoancyController,
    required this.warningMaterialController,
    required this.activityRemarkController,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    alignSheetValue,
    jointTypeFromValue,
    jointTypeToValue,
    weatherValue,
    plasticGratingValue,
    alignSheetList,
    jointTypeFromList,
    jointTypeToList,
    plasticGratingList,
    weatherList,
    dateController,
    reportNumberController,
    kmFromController,
    jointNoFromController,
    suffixFromController,
    kmToController,
    jointNoToController,
    suffixToController,
    chainageFromController,
    chainageToController,
    sectionLengthController,
    postPoddingController,
    slopeBreakerController,
    antiBuoancyController,
    warningMaterialController,
    activityRemarkController,
  ];
}