import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class JointCoatingEvent extends Equatable{}

class JointCoatingPageLoadEvent extends JointCoatingEvent{
  final BuildContext context;
  JointCoatingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends JointCoatingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectJointTypeEvent extends JointCoatingEvent{
  final dynamic jointTypeValue;
  SelectJointTypeEvent({ required this.jointTypeValue});
  @override
  List<Object?> get props => [jointTypeValue];
}

class SelectWeatherEvent extends JointCoatingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectVisualEvent extends JointCoatingEvent{
  final dynamic isAcceptVisualValue;
  final dynamic isRejectVisualValue;
  SelectVisualEvent({ required this.isAcceptVisualValue, required this.isRejectVisualValue});
  @override
  List<Object?> get props => [isAcceptVisualValue,isRejectVisualValue];
}

class SelectHolidayTestEvent extends JointCoatingEvent{
  final dynamic isAcceptHolidayTestValue;
  final dynamic isRejectHolidayTestValue;
  SelectHolidayTestEvent({ required this.isAcceptHolidayTestValue, required this.isRejectHolidayTestValue});
  @override
  List<Object?> get props => [isAcceptHolidayTestValue,isRejectHolidayTestValue];
}