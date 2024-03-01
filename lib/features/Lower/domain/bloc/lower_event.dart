import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LowerEvent extends Equatable{}

class LowerPageLoadEvent extends LowerEvent{
  final BuildContext context;
  LowerPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends LowerEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectAlignmentEvent extends LowerEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({ required this.alignSheetValue});
  @override
  // TODO: implement props
  List<Object?> get props => [alignSheetValue];
}

class SelectJointTypeFromEvent extends LowerEvent{
  final dynamic jointTypeFromValue;
  SelectJointTypeFromEvent({ required this.jointTypeFromValue});
  @override
  List<Object?> get props => [jointTypeFromValue];
}

class SelectJointTypeToEvent extends LowerEvent{
  final dynamic jointTypeToValue;
  SelectJointTypeToEvent({ required this.jointTypeToValue});
  @override
  List<Object?> get props => [jointTypeToValue];
}

class SelectWeatherEvent extends LowerEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectPostPaddingEvent extends LowerEvent{
  final dynamic isPostPadding;
  SelectPostPaddingEvent({ required this.isPostPadding});
  @override
  // TODO: implement props
  List<Object?> get props => [isPostPadding];
}

class SelectHolidayCheckEvent extends LowerEvent{
  final dynamic isHolidayCheck;
  SelectHolidayCheckEvent({ required this.isHolidayCheck});
  @override
  // TODO: implement props
  List<Object?> get props => [isHolidayCheck];
}