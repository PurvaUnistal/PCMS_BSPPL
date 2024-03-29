import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BendEvent extends Equatable{}

class BendPageLoadEvent extends BendEvent{
  final BuildContext context;
  BendPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends BendEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectWeatherEvent extends BendEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectBendEvent extends BendEvent{
  final dynamic bendValue;
  SelectBendEvent({ required this.bendValue});
  @override
  List<Object?> get props => [bendValue];
}

class SelectVisualEvent extends BendEvent{
  final dynamic visualValue;
  SelectVisualEvent({ required this.visualValue});
  @override
  List<Object?> get props => [visualValue];
}

class SelectGuagingEvent extends BendEvent{
  final dynamic guagingValue;
  SelectGuagingEvent({ required this.guagingValue});
  @override
  List<Object?> get props => [guagingValue];
}

class SelectDisbondingEvent extends BendEvent{
  final dynamic disbondingValue;
  SelectDisbondingEvent({ required this.disbondingValue});
  @override
  List<Object?> get props => [disbondingValue];
}

class SelectHolidayEvent extends BendEvent{
  final dynamic holidayValue;
  SelectHolidayEvent({ required this.holidayValue});
  @override
  List<Object?> get props => [holidayValue];
}

class SelectSectionLengthEvent extends BendEvent{
  @override
  List<Object?> get props => [];
}

class SelectCameraCaptureEvent extends BendEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends BendEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectPipePagingEvent extends BendEvent{
  final BuildContext context;
  SelectPipePagingEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SelectPipeNoValueEvent extends BendEvent{
  final dynamic pipeNoValue;
  SelectPipeNoValueEvent({required this.pipeNoValue});
  @override
  List<Object?> get props => [pipeNoValue];
}

class BendSubmitEvent extends BendEvent{
  final BuildContext context;
  BendSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}