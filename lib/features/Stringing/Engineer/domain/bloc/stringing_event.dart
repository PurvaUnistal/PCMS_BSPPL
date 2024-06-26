import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class StringingEvent extends Equatable{}

class StringingPageLoadEvent extends StringingEvent{
  final BuildContext context;
  StringingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends StringingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectWeatherEvent extends StringingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectCoatingOkValueEvent extends StringingEvent{
  final dynamic coatingValue;
  SelectCoatingOkValueEvent({required this.coatingValue});
  @override
  List<Object?> get props => [coatingValue];
}

class SelectPipePagingEvent extends StringingEvent{
  final BuildContext context;
  SelectPipePagingEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SelectPipeNoValueEvent extends StringingEvent{
  final dynamic pipeNoValue;
  SelectPipeNoValueEvent({required this.pipeNoValue});
  @override
  List<Object?> get props => [pipeNoValue];
}

class SelectAlignmentEvent extends StringingEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({required this.alignSheetValue});
  @override
  List<Object?> get props => [alignSheetValue];
}

class SelectCameraCaptureEvent extends StringingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends StringingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StringingSubmitEvent extends StringingEvent{
  final BuildContext context;
  StringingSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}

