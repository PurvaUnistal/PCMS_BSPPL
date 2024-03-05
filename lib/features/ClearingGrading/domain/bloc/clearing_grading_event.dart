
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClearingGradingEvent extends Equatable{}

class ClearingGradingPageLoadEvent extends ClearingGradingEvent{
  final BuildContext context;
  ClearingGradingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends ClearingGradingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectAlignmentEvent extends ClearingGradingEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({ required this.alignSheetValue});
  @override
  // TODO: implement props
  List<Object?> get props => [alignSheetValue];
}

class SelectWeatherEvent extends ClearingGradingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectTerrainEvent extends ClearingGradingEvent{
  final dynamic terrainValue;
  SelectTerrainEvent({ required this.terrainValue});
  @override
  List<Object?> get props => [terrainValue];
}


class SelectSectionLengthEvent extends ClearingGradingEvent{
  @override
  List<Object?> get props => [];
}

class SelectCameraCaptureEvent extends ClearingGradingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends ClearingGradingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ClearingGradingSubmitEvent extends ClearingGradingEvent{
  final BuildContext context;
  ClearingGradingSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}