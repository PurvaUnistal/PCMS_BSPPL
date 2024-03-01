import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RouteSurveyState extends Equatable{}

class RouteSurveyInitialState extends RouteSurveyState {
  @override
  List<Object> get props => [];
}

class RouteSurveyPageLoadState extends RouteSurveyInitialState {
  @override
  List<Object> get props => [];
}

class FetchRouteSurveyDataState extends RouteSurveyInitialState{
  final bool isPageLoader;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final AlignSheetModel? alignSheetValue;
  final List<AlignSheetModel> alignSheetList;
  final WeatherModel? weatherValue;
  final List<WeatherModel> weatherList;
  final TextEditingController chainageFromController;
  final TextEditingController chainageToController;
  final TextEditingController sectionLengthController;
  final TextEditingController typeGrpController;
  final TextEditingController tpIpController;
  final  TextEditingController noteController;
  final TextEditingController structureDetailController;
  final TextEditingController activityRemarkController;

  FetchRouteSurveyDataState({
    required this.isPageLoader,
    required this.dateController,
    required this.reportNumberController,
    required this.alignSheetValue,
    required this.alignSheetList,
    required this.weatherValue,
    required this.weatherList,
    required this.chainageFromController,
    required this.chainageToController,
    required this.sectionLengthController,
    required this.typeGrpController,
    required this.tpIpController,
    required this.noteController,
    required this.structureDetailController,
    required this.activityRemarkController,
  });

  @override
  List<Object> get props => [
    isPageLoader,
    dateController,
    reportNumberController,
    alignSheetValue!,
    alignSheetList,
    weatherValue!,
    weatherList,
    chainageFromController,
    chainageToController,
    sectionLengthController,
    typeGrpController,
    tpIpController,
    noteController,
    structureDetailController,
    activityRemarkController,
  ];
}