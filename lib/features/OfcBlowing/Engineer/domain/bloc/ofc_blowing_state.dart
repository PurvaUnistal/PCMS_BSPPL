import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OfcBlowingState extends Equatable{}

class OfcBlowingInitialState extends OfcBlowingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class OfcBlowingPageLoadState extends OfcBlowingState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class OfcBlowingFetchDataState extends OfcBlowingState{
  final bool isPageLoader;
  final JointTypeModel? jointTypeFromValue;
  final JointTypeModel? jointTypeToValue;
  final WeatherModel? weatherValue;
  final List<JointTypeModel> jointTypeFromList;
  final List<JointTypeModel> jointTypeToList;
  final List<WeatherModel> weatherList;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final TextEditingController drumNumberController;
  final TextEditingController drumLengthController;
  final TextEditingController sectionLengthController;
  final TextEditingController sequentialMakerController;
  final TextEditingController kmFromController;
  final TextEditingController jointNoFromController;
  final TextEditingController suffixFromController;
  final TextEditingController kmToController;
  final TextEditingController jointNoToController;
  final TextEditingController suffixToController;
  final TextEditingController pitCableLengthController;
  final TextEditingController noLocPitController;
  final TextEditingController loopAtPitController;
  final TextEditingController activityRemarkController;
  OfcBlowingFetchDataState({
    required this.isPageLoader,
    required this.jointTypeFromValue,
    required this.jointTypeToValue,
    required this.weatherValue,
    required this.jointTypeFromList,
    required this.jointTypeToList,
    required this.weatherList,
    required this.dateController,
    required this.reportNumberController,
    required this.drumNumberController,
    required this.drumLengthController,
    required this.sectionLengthController,
    required this.sequentialMakerController,
    required this.kmFromController,
    required this.jointNoFromController,
    required this.suffixFromController,
    required this.kmToController,
    required this.jointNoToController,
    required this.suffixToController,
    required this.pitCableLengthController,
    required this.noLocPitController,
    required this.loopAtPitController,
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
    drumNumberController,
    drumLengthController,
    sectionLengthController,
    sequentialMakerController,
    kmFromController,
    jointNoFromController,
    suffixFromController,
    kmToController,
    jointNoToController,
    suffixToController,
    pitCableLengthController,
    noLocPitController,
    loopAtPitController,
    activityRemarkController,
  ];
}