import 'dart:io';

import 'package:bsppl/features/ClearingGrading/domain/model/terrain_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RouteHandOverState extends Equatable{}

class RouteHandOverPageLoadState extends RouteHandOverState{
  final BuildContext context;
  RouteHandOverPageLoadState({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class RouteHandOverInitialState extends RouteHandOverState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RouteHandOverFetchDataState extends RouteHandOverState{
  final bool isPageLoader;
  final bool isLoader;
  final File photo;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final WeatherModel? weatherValue;
  final List<WeatherModel> weatherList;
  final TerrainModel? terrainValue;
  final List<TerrainModel> terrainList;
  final TextEditingController chainageFromController;
  final TextEditingController chainageToController;
  final TextEditingController sectionLengthController;
  final TextEditingController terrainController;
  final TextEditingController skippingController;
  final TextEditingController hindranceController;
  final  TextEditingController panchnamaController;
  final TextEditingController remarkController;

  RouteHandOverFetchDataState({
    required this.isPageLoader,
    required this.isLoader,
    required this.photo,
    required this.dateController,
    required this.reportNumberController,
    required this.weatherValue,
    required this.weatherList,
    required this.terrainValue,
    required this.terrainList,
    required this.chainageFromController,
    required this.chainageToController,
    required this.sectionLengthController,
    required this.terrainController,
    required this.skippingController,
    required this.hindranceController,
    required this.panchnamaController,
    required this.remarkController,
});
  @override
  // TODO: implement props
  List<Object?> get props => [
   isPageLoader,
    isLoader,
    photo,
   dateController,
   reportNumberController,
   weatherValue,
   weatherList,
    terrainValue,
    terrainList,
   chainageFromController,
   chainageToController,
   terrainController,
    sectionLengthController,
   skippingController,
   hindranceController,
   panchnamaController,
   remarkController,
  ];
}