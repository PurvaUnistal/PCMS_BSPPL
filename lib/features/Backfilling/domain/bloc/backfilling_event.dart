import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BackfillingEvent extends Equatable{}

class BackfillingPageLoadEvent extends BackfillingEvent{
  final BuildContext context;
  BackfillingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends BackfillingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectAlignmentEvent extends BackfillingEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({ required this.alignSheetValue});
  @override
  // TODO: implement props
  List<Object?> get props => [alignSheetValue];
}

class SelectJointTypeFromEvent extends BackfillingEvent{
  final dynamic jointTypeFromValue;
  SelectJointTypeFromEvent({ required this.jointTypeFromValue});
  @override
  List<Object?> get props => [jointTypeFromValue];
}

class SelectJointTypeToEvent extends BackfillingEvent{
  final dynamic jointTypeToValue;
  SelectJointTypeToEvent({ required this.jointTypeToValue});
  @override
  List<Object?> get props => [jointTypeToValue];
}

class SelectWeatherEvent extends BackfillingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectPlasticGratingEvent extends BackfillingEvent{
  final dynamic plasticGratinValue;
  SelectPlasticGratingEvent({ required this.plasticGratinValue});
  @override
  // TODO: implement props
  List<Object?> get props => [plasticGratinValue];
}
