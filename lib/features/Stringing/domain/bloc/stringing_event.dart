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
  final bool checkYes;
  final bool checkNo;
  SelectCoatingOkValueEvent({required this.checkYes, required this.checkNo});
  @override
  List<Object?> get props => [checkYes,checkNo];
}


