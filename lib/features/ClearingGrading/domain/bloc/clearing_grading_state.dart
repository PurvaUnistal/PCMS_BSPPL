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

class ClearingGradingFetchDataState extends ClearingGradingInitialState{
  final bool isPageLoader;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final AlignSheetModel? alignSheetValue;
  final List<AlignSheetModel> alignSheetList;
  final WeatherModel? weatherValue;
  final List<WeatherModel> weatherList;
  final TextEditingController chainageFromController;
  final TextEditingController chainageToController;
  final TextEditingController sectionLengthController;
  final TextEditingController ipNoFromController;
  final TextEditingController ipNoToController;
  final TextEditingController tpNoFromController;
  final TextEditingController tpNoToController;
  final TerrainModel? terrainValue;
  final List<TerrainModel> terrainList;
  final TextEditingController structureNameController;
  final TextEditingController chainageController;
  final TextEditingController locationBoundaryController;
  final TextEditingController distanceController;
  final TextEditingController activityRemarkController;

  ClearingGradingFetchDataState({
    required this.isPageLoader,
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
    required this.activityRemarkController,
  });

  @override
  List<Object> get props => [
    isPageLoader,
    dateController,
    reportNumberController,
    alignSheetValue!,
    alignSheetList,
    weatherValue!,
    weatherList,
    chainageFromController,
    chainageToController,
    sectionLengthController,
    ipNoFromController,
    ipNoToController,
    tpNoFromController,
    tpNoToController,
    terrainValue!,
    terrainList,
    structureNameController,
    chainageController,
    locationBoundaryController,
    distanceController,
    activityRemarkController,
  ];
}