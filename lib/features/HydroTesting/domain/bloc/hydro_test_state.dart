import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HydroTestState extends Equatable{}

class HydroTestInitialState extends HydroTestState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class HydroTestPageLoadState extends HydroTestState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class HydroTestFetchDataState extends HydroTestState{
  final bool isPageLoader;
  final JointTypeModel? jointTypeFromValue;
  final JointTypeModel? jointTypeToValue;
  final WeatherModel? weatherValue;
  final List<JointTypeModel> jointTypeFromList;
  final List<JointTypeModel> jointTypeToList;
  final List<WeatherModel> weatherList;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final TextEditingController kmFromController;
  final TextEditingController jointNoFromController;
  final TextEditingController suffixFromController;
  final TextEditingController kmToController;
  final TextEditingController jointNoToController;
  final TextEditingController suffixToController;
  final TextEditingController sectionLengthController;
  final TextEditingController activityRemarkController;
  HydroTestFetchDataState({
    required this.isPageLoader,
    required this.jointTypeFromValue,
    required this.jointTypeToValue,
    required this.weatherValue,
    required this.jointTypeFromList,
    required this.jointTypeToList,
    required this.weatherList,
    required this.dateController,
    required this.reportNumberController,
    required this.kmFromController,
    required this.jointNoFromController,
    required this.suffixFromController,
    required this.kmToController,
    required this.jointNoToController,
    required this.suffixToController,
    required this.sectionLengthController,
    required this.activityRemarkController,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    jointTypeFromValue,
    jointTypeToValue,
    weatherValue,
    jointTypeFromList,
    jointTypeToList,
    weatherList,
    dateController,
    reportNumberController,
    kmFromController,
    jointNoFromController,
    suffixFromController,
    kmToController,
    jointNoToController,
    suffixToController,
    sectionLengthController,
    activityRemarkController,
  ];
}