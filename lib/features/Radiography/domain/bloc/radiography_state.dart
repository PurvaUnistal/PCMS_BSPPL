import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RadiographyState extends Equatable{}

class RadiographyInitialState extends RadiographyState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RadiographyPageLoadState extends RadiographyState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RadiographyFetchDataState extends RadiographyState{
  bool isPageLoader;
  bool isAccept1Value;
  bool isAccept2Value;
  bool isAccept3Value;
  bool isAccept4Value;
  bool isReject1Value;
  bool isReject2Value;
  bool isReject3Value;
  bool isReject4Value;
  WeatherModel? weatherValue;
  JointTypeModel? jointTypeValue;
  List<WeatherModel> weatherList;
  List<JointTypeModel> jointTypeList;
  TextEditingController dateController  ;
  TextEditingController reportNumberController;
  TextEditingController kmController;
  TextEditingController jointNoController;
  TextEditingController suffixController;
  TextEditingController observation1Controller;
  TextEditingController observation2Controller;
  TextEditingController observation3Controller;
  TextEditingController observation4Controller;
  TextEditingController remarkController;

  RadiographyFetchDataState({
    required this.isPageLoader,
    required this.isAccept1Value,
    required this.isAccept2Value,
    required this.isAccept3Value,
    required this.isAccept4Value,
    required this.isReject1Value,
    required this.isReject2Value,
    required this.isReject3Value,
    required this.isReject4Value,
    required this.weatherValue,
    required this.jointTypeValue,
    required this.weatherList,
    required this.jointTypeList,
    required this.dateController  ,
    required this.reportNumberController,
    required this.kmController,
    required this.jointNoController,
    required this.suffixController,
    required this.observation1Controller,
    required this.observation2Controller,
    required this.observation3Controller,
    required this.observation4Controller,
    required this.remarkController,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    isAccept1Value,
    isAccept2Value,
    isAccept3Value,
    isAccept4Value,
    isReject1Value,
    isReject2Value,
    isReject3Value,
    isReject4Value,
    weatherValue,
    jointTypeValue,
    weatherList,
    jointTypeList,
    dateController,
    reportNumberController,
    kmController,
    jointNoController,
    suffixController,
    observation1Controller,
    observation2Controller,
    observation3Controller,
    observation4Controller,
    remarkController,
  ];
}