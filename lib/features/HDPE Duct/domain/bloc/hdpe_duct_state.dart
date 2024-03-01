import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HdpeDuctState extends Equatable{}

class HdpeDuctInitialState extends HdpeDuctState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class HdpeDuctPageLoadState extends HdpeDuctState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class HdpeDuctFetchDataState extends HdpeDuctState{
  final bool isPageLoader;
  final bool okPadding;
  final bool okNotPadding;
  final bool okWarningMat;
  final bool notOkWarningMat;
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
  final TextEditingController chainageFromController;
  final TextEditingController chainageToController;
  final TextEditingController sectionLengthController;
  final TextEditingController ductLengthFromController;
  final TextEditingController ductLengthToController;
  final TextEditingController couplerController;
  final TextEditingController activityRemarkController;
  HdpeDuctFetchDataState({
    required this.isPageLoader,
    required this.okPadding,
    required this.okNotPadding,
    required this.okWarningMat,
    required this.notOkWarningMat,
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
    required this.chainageFromController,
    required this.chainageToController,
    required this.sectionLengthController,
    required this.ductLengthFromController,
    required this.ductLengthToController,
    required this.couplerController,
    required this.activityRemarkController,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    okPadding,
    okNotPadding,
    okWarningMat,
    notOkWarningMat,
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
   chainageFromController,
   chainageToController,
   sectionLengthController,
   ductLengthFromController,
   ductLengthToController,
   couplerController,
   activityRemarkController,
  ];
}