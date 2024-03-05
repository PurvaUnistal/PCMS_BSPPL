import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TrenchingEvent extends Equatable{}

class TrenchingPageLoadEvent extends TrenchingEvent{
  final BuildContext context;
  TrenchingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends TrenchingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectAlignmentEvent extends TrenchingEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({ required this.alignSheetValue});
  @override
  // TODO: implement props
  List<Object?> get props => [alignSheetValue];
}

class SelectJointTypeFromEvent extends TrenchingEvent{
  final dynamic jointTypeFromValue;
  SelectJointTypeFromEvent({ required this.jointTypeFromValue});
  @override
  List<Object?> get props => [jointTypeFromValue];
}

class SelectJointTypeToEvent extends TrenchingEvent{
  final dynamic jointTypeToValue;
  SelectJointTypeToEvent({ required this.jointTypeToValue});
  @override
  List<Object?> get props => [jointTypeToValue];
}

class SelectWeatherEvent extends TrenchingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectSectionLengthEvent extends TrenchingEvent{
  @override
  List<Object?> get props => [];
}
class SelectCameraCaptureEvent extends TrenchingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends TrenchingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class TrenchingSubmitEvent extends TrenchingEvent{
  final BuildContext context;
  TrenchingSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}