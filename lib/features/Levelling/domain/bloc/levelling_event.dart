import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LevellingEvent extends Equatable{}

class LevellingPageLoadEvent extends LevellingEvent{
  final BuildContext context;
  LevellingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends LevellingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}


class SelectJointTypeEvent extends LevellingEvent{
  final dynamic jointTypeValue;
  SelectJointTypeEvent({ required this.jointTypeValue});
  @override
  List<Object?> get props => [jointTypeValue];
}

class SelectWeatherEvent extends LevellingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}