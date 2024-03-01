import 'package:bsppl/features/Bending/domain/model/bend_model.dart';
import 'package:bsppl/features/Bending/domain/model/check_model.dart';
import 'package:bsppl/features/Bending/domain/model/holiday_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
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
  TextEditingController pipeNumberController;
  TextEditingController bendNumberController;
  TextEditingController bendDegreeController;
  TextEditingController minuteController;
  TextEditingController bendSecondController;
  TextEditingController tpNoController;
  TextEditingController activityRemarkController;

  BendFetchDataState({
    required this.isPageLoader,
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
    required this.pipeNumberController,
    required this.bendNumberController,
    required this.bendDegreeController,
    required this.minuteController,
    required this.bendSecondController,
    required this.tpNoController,
    required this.activityRemarkController,
});
  @override
  List<Object> get props => [
    isPageLoader,
    weatherValue!,
    bendValue!,
    visualValue!,
    guagingValue!,
    disbondingValue!,
    holidayValue!,
    weatherList,
    bendList,
    visualList,
    guagingList,
    disbondingList,
    holidayList,
    dateController,
    reportNumberController,
    chainageController,
    pipeNumberController,
    bendNumberController,
    bendDegreeController,
    minuteController,
    bendSecondController,
    tpNoController,
    activityRemarkController,
  ];
}