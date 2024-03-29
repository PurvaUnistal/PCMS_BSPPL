import 'dart:io';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/model/coating_ok_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class StringingState extends Equatable{}

class StringingInitialState extends StringingState {
  @override
  List<Object> get props => [];
}

class StringingPageLoadState extends StringingState {
  @override
  List<Object> get props => [];
}

class StringingFetchDataState extends StringingState {
  bool isPageLoader;
  final bool isLoader;
  final File photo;
  WeatherModel? weatherValue;
  CoatingOkModel? coatingValue;
  List<WeatherModel> weatherList;
  List<CoatingOkModel> coatingOkList;
  String? pipeNumberValue;
  List<String> pipeNumberList;
  AlignSheetModel? alignSheetValue;
  List<AlignSheetModel> alignSheetList;
  TextEditingController dateController;
  TextEditingController reportNumberController;
  TextEditingController chainageController;
  TextEditingController pipePageController;
  TextEditingController pipeDiameterController;
  TextEditingController pipeMeterialController;
  TextEditingController activityRemarkController;

  StringingFetchDataState({
    required this.isPageLoader,
    required this.coatingValue,
    required this.isLoader,
    required this.photo,
    required this.weatherValue,
    required this.pipeNumberValue,
    required this.pipeNumberList,
    required this.weatherList,
    required this.coatingOkList,
    required this.alignSheetValue,
    required this.alignSheetList,
    required this.dateController,
    required this.reportNumberController,
    required this.chainageController,
    required this.pipePageController,
    required this.pipeDiameterController,
    required this.pipeMeterialController,
    required this.activityRemarkController,
  });
  @override
  List<Object?> get props => [
    isPageLoader,
    coatingValue,
    isLoader,
    photo,
    weatherValue,
    pipeNumberValue,
    pipeNumberList,
    weatherList,
    coatingOkList,
    dateController,
    reportNumberController,
    chainageController,
    pipePageController,
    pipeDiameterController,
    pipeMeterialController,
    activityRemarkController,
    alignSheetValue,
    alignSheetList,
  ];
}