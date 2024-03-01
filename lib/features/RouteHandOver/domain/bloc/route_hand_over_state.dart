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
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final WeatherModel? weatherValue;
  final List<WeatherModel> weatherList;
  final TextEditingController chainageFromController;
  final TextEditingController chainageToController;
  final TextEditingController terrainController;
  final TextEditingController skippingController;
  final TextEditingController hindranceController;
  final  TextEditingController panchnamaController;
  final TextEditingController remarkController;

  RouteHandOverFetchDataState({
    required this.isPageLoader,
    required this.dateController,
    required this.reportNumberController,
    required this.weatherValue,
    required this.weatherList,
    required this.chainageFromController,
    required this.chainageToController,
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
   dateController,
   reportNumberController,
   weatherValue,
   weatherList,
   chainageFromController,
   chainageToController,
   terrainController,
   skippingController,
   hindranceController,
   panchnamaController,
   remarkController,
  ];
}