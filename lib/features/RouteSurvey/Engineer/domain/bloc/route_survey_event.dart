import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RouteSurveyEvent extends Equatable{}

class RouteSurveyPageLoadEvent extends RouteSurveyEvent{
  final BuildContext context;
  RouteSurveyPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends RouteSurveyEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectAlignmentEvent extends RouteSurveyEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({ required this.alignSheetValue});
  @override
  // TODO: implement props
  List<Object?> get props => [alignSheetValue];
}

class SelectWeatherEvent extends RouteSurveyEvent{
  final dynamic weatherValue;
   SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}
class SelectSectionLengthEvent extends RouteSurveyEvent{
  @override
  List<Object?> get props => [];
}
class SelectCameraCaptureEvent extends RouteSurveyEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends RouteSurveyEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RouteSurveySubmitEvent extends RouteSurveyEvent{
  final BuildContext context;
  RouteSurveySubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}
