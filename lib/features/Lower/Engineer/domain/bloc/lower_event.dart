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

class SelectCalibrationDateEvent extends LowerEvent{
  final BuildContext context;
  SelectCalibrationDateEvent({required this.context});
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

class SelectPrePaddingValueEvent extends LowerEvent{
  final dynamic prePaddingValue;
  SelectPrePaddingValueEvent({ required this.prePaddingValue});
  @override
  // TODO: implement props
  List<Object?> get props => [prePaddingValue];
}

class SelectDeWateringValueEvent extends LowerEvent{
  final dynamic deWateringValue;
  SelectDeWateringValueEvent({ required this.deWateringValue});
  @override
  // TODO: implement props
  List<Object?> get props => [deWateringValue];
}

class SelectPaddingValueEvent extends LowerEvent{
  final dynamic paddingValue;
  SelectPaddingValueEvent({ required this.paddingValue});
  @override
  // TODO: implement props
  List<Object?> get props => [paddingValue];
}

class SelectJointFromEvent extends LowerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectJointToEvent extends LowerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectCameraCaptureEvent extends LowerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends LowerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectSectionLengthEvent extends LowerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectPipePagingEvent extends LowerEvent{
  final BuildContext context;
  SelectPipePagingEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SelectPipeNoValueEvent extends LowerEvent{
  final dynamic pipeNoValue;
  SelectPipeNoValueEvent({required this.pipeNoValue});
  @override
  List<Object?> get props => [pipeNoValue];
}

class LowerSubmitEvent extends LowerEvent{
  final BuildContext context;
  LowerSubmitEvent({ required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}