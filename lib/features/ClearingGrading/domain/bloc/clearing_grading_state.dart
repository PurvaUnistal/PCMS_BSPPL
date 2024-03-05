import 'dart:io';

import 'package:bsppl/features/ClearingGrading/domain/model/terrain_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClearingGradingState extends Equatable{}

class ClearingGradingInitialState extends ClearingGradingState {
  @override
  List<Object> get props => [];
}

class ClearingGradingPageLoadState extends ClearingGradingInitialState {
  @override
  List<Object> get props => [];
}

class ClearingGradingFetchDataState extends ClearingGradingState{
   bool isPageLoader;
   bool isLoader;
   File photo;
   TextEditingController dateController;
   TextEditingController reportNumberController;
   AlignSheetModel? alignSheetValue;
   List<AlignSheetModel> alignSheetList;
   WeatherModel? weatherValue;
   List<WeatherModel> weatherList;
   TextEditingController chainageFromController;
   TextEditingController chainageToController;
   TextEditingController sectionLengthController;
   TextEditingController ipNoFromController;
   TextEditingController ipNoToController;
   TextEditingController tpNoFromController;
   TextEditingController tpNoToController;
   TerrainModel? terrainValue;
   List<TerrainModel> terrainList;
   TextEditingController structureNameController;
   TextEditingController chainageController;
   TextEditingController locationBoundaryController;
   TextEditingController distanceController;
   TextEditingController typeGrpController;
   TextEditingController activityRemarkController;

  ClearingGradingFetchDataState({
    required this.isPageLoader,
    required this.isLoader,
    required this.photo,
    required this.dateController,
    required this.reportNumberController,
    required this.alignSheetValue,
    required this.alignSheetList,
    required this.weatherValue,
    required this.weatherList,
    required this.chainageFromController,
    required this.chainageToController,
    required this.sectionLengthController,
    required this.ipNoFromController,
    required this.ipNoToController,
    required this.tpNoFromController,
    required this.tpNoToController,
    required this.terrainValue,
    required this.terrainList,
    required this.structureNameController,
    required this.chainageController,
    required this.locationBoundaryController,
    required this.distanceController,
    required this.typeGrpController,
    required this.activityRemarkController,
  });
  @override
  List<Object?> get props => [
    isPageLoader,
    isLoader,
    photo,
    dateController,
    reportNumberController,
    alignSheetValue,
    alignSheetList,
    weatherValue,
    weatherList,
    chainageFromController,
    chainageToController,
    sectionLengthController,
    ipNoFromController,
    ipNoToController,
    tpNoFromController,
    tpNoToController,
    terrainValue,
    terrainList,
    structureNameController,
    chainageController,
    locationBoundaryController,
    distanceController,
    typeGrpController,
    activityRemarkController,
  ];
}