import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RouteHandOverEvent extends Equatable{}

class RouteHandOverPageLoadEvent extends RouteHandOverEvent{
  final BuildContext context;
  RouteHandOverPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends RouteHandOverEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectWeatherEvent extends RouteHandOverEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectTerrainEvent extends RouteHandOverEvent{
  final dynamic terrainValue;
  SelectTerrainEvent({ required this.terrainValue});
  @override
  List<Object?> get props => [terrainValue];
}

class SelectSectionLengthEvent extends RouteHandOverEvent{
  @override
  List<Object?> get props => [];
}

class SelectCameraCaptureEvent extends RouteHandOverEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends RouteHandOverEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RouteHandOverSubmitEvent extends RouteHandOverEvent{
  final BuildContext context;
  RouteHandOverSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}