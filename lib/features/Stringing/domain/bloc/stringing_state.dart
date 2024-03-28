import 'dart:io';

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
  final bool isLoader;
  final File photo;
  WeatherModel? weatherValue;
  CoatingOkModel? coatingValue;
  List<WeatherModel> weatherList;
  List<CoatingOkModel> coatingOkList;
  TextEditingController dateController;
  TextEditingController reportNumberController;
  TextEditingController chainageController;
  TextEditingController pipeNumberController;
  TextEditingController pipeDiameterController;
  TextEditingController pipeMeterialController;
  TextEditingController activityRemarkController;

  StringingFetchDataState({
    required this.isPageLoader,
    required this.coatingValue,
    required this.isLoader,
    required this.photo,
    required this.weatherValue,
    required this.weatherList,
    required this.coatingOkList,
    required this.dateController,
    required this.reportNumberController,
    required this.chainageController,
    required this.pipeNumberController,
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
    weatherList,
    coatingOkList,
    dateController,
    reportNumberController,
    chainageController,
    pipeNumberController,
    pipeDiameterController,
    pipeMeterialController,
    activityRemarkController,
  ];
}