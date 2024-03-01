import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/domain/model/coating_ok_model.dart';
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
  dynamic isYesValue;
  dynamic isNoValue;
  WeatherModel? weatherValue;
  List<WeatherModel> weatherList;
  List<CoatingOkModel> coatingOkList;
  TextEditingController dateController;
  TextEditingController reportNumberController;
  TextEditingController chainageController;
  TextEditingController pipeNumberController;
  TextEditingController activityRemarkController;

  StringingFetchDataState({
    required this.isPageLoader,
    required this.isYesValue,
    required this.isNoValue,
    required this.weatherValue,
    required this.weatherList,
    required this.coatingOkList,
    required this.dateController,
    required this.reportNumberController,
    required this.chainageController,
    required this.pipeNumberController,
    required this.activityRemarkController,
  });
  @override
  List<Object> get props => [
    isPageLoader,
    isYesValue,
    isNoValue,
    weatherValue!,
    weatherList,
    coatingOkList,
    dateController,
    reportNumberController,
    chainageController,
    pipeNumberController,
    activityRemarkController,
  ];
}