import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LevellingState extends Equatable{}

class LevellingInitialState extends LevellingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LevellingPageLoadState extends LevellingState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LevellingFetchDataState extends LevellingState{
  final bool isPageLoader;
  final JointTypeModel? jointTypeValue;
  final WeatherModel? weatherValue;
  final List<JointTypeModel> jointTypeList;
  final List<WeatherModel> weatherList;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final TextEditingController kmController;
  final TextEditingController jointNoController;
  final TextEditingController suffixController;
  final TextEditingController coverController;
  final TextEditingController eastingController;
  final TextEditingController northingController;
  final TextEditingController pipeTopController;
  final TextEditingController nglController;
  final TextEditingController activityRemarkController;
  LevellingFetchDataState({
    required this.isPageLoader,
    required this.jointTypeValue,
    required this.weatherValue,
    required this.jointTypeList,
    required this.weatherList,
    required this.dateController,
    required this.reportNumberController,
    required this.kmController,
    required this.jointNoController,
    required this.suffixController,
    required this.coverController,
    required this.eastingController,
    required this.northingController,
    required this.pipeTopController,
    required this.nglController,
    required this.activityRemarkController,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    jointTypeValue,
    weatherValue,
    jointTypeList,
    weatherList,
    dateController,
    reportNumberController,
    kmController,
    jointNoController,
    suffixController,
    coverController,
    eastingController,
    northingController,
    pipeTopController,
    nglController,
    activityRemarkController,
  ];
}