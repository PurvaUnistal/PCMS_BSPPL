import 'dart:io';

import 'package:bsppl/features/AllCommonModel/PipeNumberModel.dart';
import 'package:bsppl/features/AllCommonModel/check_model.dart';
import 'package:bsppl/features/AllCommonModel/completed_not_model.dart';
import 'package:bsppl/features/AllCommonModel/provide_not_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
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
  final bool isLoader;
  final bool isPostPadding;
  final bool isHolidayCheck;
  final File photo;
  final String jointFrom;
  final String jointTo;
  final AlignSheetModel? alignSheetValue;
  final JointTypeModel? jointTypeFromValue;
  final JointTypeModel? jointTypeToValue;
  final WeatherModel? weatherValue;
  final CheckModel? prePaddingValue;
  final CompletedModel? deWateringValue;
  final ProvideModel? paddingValue;
  final List<AlignSheetModel>  alignSheetList;
  final List<JointTypeModel> jointTypeFromList;
  final List<JointTypeModel> jointTypeToList;
  final List<WeatherModel> weatherList;
  final List<CheckModel> prePaddingList;
  final List<CompletedModel>  deWateringList;
  final List<ProvideModel>   paddingList;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final TextEditingController pipeMeterialController;
  final TextEditingController pipeDiameterController;
  final TextEditingController pipePageController;
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
  final TextEditingController fromKmController;
  final TextEditingController toKmController;
  final TextEditingController dailyProgressController;
  final TextEditingController sectionNoController;
  final TextEditingController visualInspController;
  final TextEditingController trenchAcceptanceController;
  final TextEditingController coatingRepairController;
  final TextEditingController activityRemarkController;
  PipeNumberModel? pipeNumberModel;
  List<String> pipeNumberList;
  String? pipeNumberValue;


  LowerFetchDataState({
    required this.photo,
    required this.isLoader,
    required this.isPageLoader,
    required this.isPostPadding,
    required this.isHolidayCheck,
    required this.jointFrom,
    required this.jointTo,
    required this.alignSheetValue,
    required this.jointTypeFromValue,
    required this.jointTypeToValue,
    required this.weatherValue,
    required this.alignSheetList,
    required this.jointTypeFromList,
    required this.jointTypeToList,
    required this.weatherList,
    required this.dateController,
    required this.pipeMeterialController,
    required this.reportNumberController,
    required this.pipeDiameterController,
    required this.pipePageController,
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
    required this.toKmController,
    required this.visualInspController,
    required this.dailyProgressController,
    required this.sectionNoController,
    required this.coatingRepairController,
    required this.fromKmController,
     required this.trenchAcceptanceController,
     required this.deWateringValue,
    required this.paddingValue,
    required this.prePaddingValue,
    required this.deWateringList,
    required this.paddingList,
    required this.prePaddingList,
    required this.pipeNumberValue,
    required this.pipeNumberList,
    required this.pipeNumberModel,

  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    photo,
    isLoader,
    jointFrom,
    jointTo,
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
    pipeMeterialController,
    pipeDiameterController,
    pipePageController,
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
    toKmController,
    visualInspController,
    dailyProgressController,
    sectionNoController,
    coatingRepairController,
    fromKmController,
    trenchAcceptanceController,
    deWateringValue,
    paddingValue,
    prePaddingValue,
    deWateringList,
    paddingList,
    prePaddingList,
    pipeNumberValue,
    pipeNumberList,
    pipeNumberModel,
  ];
}