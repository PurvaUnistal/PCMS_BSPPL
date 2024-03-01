import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LowerState extends Equatable{}

class LowerInitialState extends LowerState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LowerPageLoadState extends LowerState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LowerFetchDataState extends LowerState{
  final bool isPageLoader;
  final bool isPostPadding;
  final bool isHolidayCheck;
  final AlignSheetModel? alignSheetValue;
  final JointTypeModel? jointTypeFromValue;
  final JointTypeModel? jointTypeToValue;
  final WeatherModel? weatherValue;
  final List<AlignSheetModel>  alignSheetList;
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
  final TextEditingController locationController;
  final TextEditingController holidayDetailsController;
  final TextEditingController makeModelController;
  final TextEditingController testVoltageController;
  final TextEditingController calibrationDoneController;
  final TextEditingController repairDamagesController;
  final TextEditingController activityRemarkController;
  LowerFetchDataState({
    required this.isPageLoader,
    required this.isPostPadding,
    required this.isHolidayCheck,
    required this.alignSheetValue,
    required this.jointTypeFromValue,
    required this.jointTypeToValue,
    required this.weatherValue,
    required this.alignSheetList,
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
    required this.locationController,
    required this.holidayDetailsController,
    required this.makeModelController,
    required this.testVoltageController,
    required this.calibrationDoneController,
    required this.repairDamagesController,
    required this.activityRemarkController,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    isPostPadding,
    isHolidayCheck,
    alignSheetValue,
    jointTypeFromValue,
    jointTypeToValue,
    weatherValue,
    alignSheetList,
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
    locationController,
    holidayDetailsController,
    makeModelController,
    testVoltageController,
    calibrationDoneController,
    repairDamagesController,
    activityRemarkController,
  ];
}