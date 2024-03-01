import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OfcBlowingEvent extends Equatable{}

class OfcBlowingPageLoadEvent extends OfcBlowingEvent{
  final BuildContext context;
  OfcBlowingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends OfcBlowingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}


class SelectJointTypeFromEvent extends OfcBlowingEvent{
  final dynamic jointTypeFromValue;
  SelectJointTypeFromEvent({ required this.jointTypeFromValue});
  @override
  List<Object?> get props => [jointTypeFromValue];
}

class SelectJointTypeToEvent extends OfcBlowingEvent{
  final dynamic jointTypeToValue;
  SelectJointTypeToEvent({ required this.jointTypeToValue});
  @override
  List<Object?> get props => [jointTypeToValue];
}

class SelectWeatherEvent extends OfcBlowingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}