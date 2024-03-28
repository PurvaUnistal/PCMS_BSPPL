import 'dart:io';

import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TrenchingState extends Equatable{}

class TrenchingInitialState extends TrenchingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class TrenchingPageLoadState extends TrenchingState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class TrenchingFetchDataState extends TrenchingState{
  final bool isPageLoader;
  final bool isLoader;
  final File photo;
  final String jointFrom;
  final String jointTo;
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
  final TextEditingController trenchingDepthController;
  final TextEditingController trenchTopWidthController;
  final TextEditingController trenchBottomWidthController;
  final TextEditingController terrainController;
  final TextEditingController activityRemarkController;
  final TextEditingController kmDELA_FROMController;
  final TextEditingController kmPANA_LA_TOController;
  final TextEditingController dailyProgressController;
  final TextEditingController methodOfTrenchingController;
  final TextEditingController beddingAcceptedController;
  final TextEditingController sectionNoController;
  TrenchingFetchDataState({
    required this.isPageLoader,
    required this.isLoader,
    required this.photo,
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
    required this.trenchingDepthController,
    required this.trenchTopWidthController,
    required this.trenchBottomWidthController,
    required this.terrainController,
    required this.activityRemarkController,
    required this.beddingAcceptedController,
    required this.kmDELA_FROMController,
    required this.kmPANA_LA_TOController,
    required this.dailyProgressController,
    required this.methodOfTrenchingController,
    required this.sectionNoController,
});
  @override
  // TODO: implement props
  List<Object?> get props => [
   isPageLoader,
    isLoader,
    photo,
    jointFrom,
    jointTo,
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
   trenchingDepthController,
   trenchTopWidthController,
    trenchBottomWidthController,
   terrainController,
   activityRemarkController,
    beddingAcceptedController,
    kmDELA_FROMController,
    kmPANA_LA_TOController,
    dailyProgressController,
    methodOfTrenchingController,
    sectionNoController,
  ];
}