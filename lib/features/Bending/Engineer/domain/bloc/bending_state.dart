import 'dart:io';

import 'package:bsppl/features/AllCommonModel/bend_model.dart';
import 'package:bsppl/features/AllCommonModel/check_model.dart';
import 'package:bsppl/features/AllCommonModel/holiday_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BendState extends Equatable{}

class BendInitialState extends BendState {
  @override
  List<Object> get props => [];
}

class BendPageLoadState extends BendState {
  @override
  List<Object> get props => [];
}

class BendFetchDataState extends BendState {
  bool isPageLoader;
  final bool isLoader;
  final File photo;
  WeatherModel? weatherValue;
  BendModel? bendValue;
  CheckModel? visualValue;
  CheckModel? guagingValue;
  CheckModel? disbondingValue;
  HolidayModel? holidayValue;
  List<WeatherModel> weatherList;
  List<BendModel> bendList;
  List<CheckModel> visualList;
  List<CheckModel> guagingList;
  List<CheckModel> disbondingList;
  List<HolidayModel> holidayList;
  TextEditingController dateController;
  TextEditingController reportNumberController;
  TextEditingController chainageController;
  TextEditingController pipePageController;
  TextEditingController bendNumberController;
  TextEditingController bendDegreeController;
  TextEditingController minuteController;
  TextEditingController bendSecondController;
  TextEditingController tpNoController;
  TextEditingController toKmController;
  TextEditingController fromKmController;
  TextEditingController dailyProgressController;
  TextEditingController bendChainageToController;
  TextEditingController bendDirectionController;
  TextEditingController activityRemarkController;
  List<String> pipeNumberList;
  String? pipeNumberValue;

  BendFetchDataState({
    required this.isPageLoader,
    required this.isLoader,
    required this.photo,
    required this.weatherValue,
    required this.bendValue,
    required this.visualValue,
    required this.guagingValue,
    required this.disbondingValue,
    required this.holidayValue,
    required this.weatherList,
    required this.bendList,
    required this.visualList,
    required this.guagingList,
    required this.disbondingList,
    required this.holidayList,
    required this.dateController,
    required this.reportNumberController,
    required this.chainageController,
    required this.pipePageController,
    required this.bendNumberController,
    required this.bendDegreeController,
    required this.minuteController,
    required this.bendSecondController,
    required this.tpNoController,
    required this.toKmController,
    required this.fromKmController,
    required this.dailyProgressController,
    required this.bendChainageToController,
    required this.bendDirectionController,
    required this.activityRemarkController,
    required this.pipeNumberValue,
    required this.pipeNumberList,
});

  @override
  List<Object?> get props => [
    isPageLoader,
    isLoader,
    photo,
    weatherValue,
    bendValue,
    visualValue,
    guagingValue,
    disbondingValue,
    holidayValue,
    weatherList,
    bendList,
    visualList,
    guagingList,
    disbondingList,
    holidayList,
    dateController,
    reportNumberController,
    chainageController,
    pipePageController,
    bendNumberController,
    bendDegreeController,
    minuteController,
    bendSecondController,
    tpNoController,
    toKmController,
    fromKmController,
    dailyProgressController,
    bendChainageToController,
    bendDirectionController,
    activityRemarkController,
    pipeNumberValue,
    pipeNumberList,
  ];
}