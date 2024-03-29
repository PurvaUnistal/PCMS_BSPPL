import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UTEvent extends Equatable{}

class UTPageLoadEvent extends UTEvent{
  final BuildContext context;
  UTPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends UTEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectWeatherEvent extends UTEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectJointTypeEvent extends UTEvent{
  final dynamic jointTypeValue;
  SelectJointTypeEvent({ required this.jointTypeValue});
  @override
  List<Object?> get props => [jointTypeValue];
}

class SelectSegment1Event extends UTEvent{
  final dynamic accept1Value;
  final dynamic reject1Value;
  SelectSegment1Event({ required this.accept1Value, required this.reject1Value});
  @override
  List<Object?> get props => [accept1Value,reject1Value];
}

class SelectSegment2Event extends UTEvent{
  final dynamic accept2Value;
  final dynamic reject2Value;
  SelectSegment2Event({ required this.accept2Value, required this.reject2Value});
  @override
  List<Object?> get props => [accept2Value,reject2Value];
}

class SelectSegment3Event extends UTEvent{
  final dynamic accept3Value;
  final dynamic reject3Value;
  SelectSegment3Event({ required this.accept3Value, required this.reject3Value});
  @override
  List<Object?> get props => [accept3Value,reject3Value];
}

class SelectSegment4Event extends UTEvent{
  final dynamic accept4Value;
  final dynamic reject4Value;
  SelectSegment4Event({ required this.accept4Value, required this.reject4Value});
  @override
  List<Object?> get props => [accept4Value,reject4Value];
}