import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HdpeDuctEvent extends Equatable{}

class HdpeDuctPageLoadEvent extends HdpeDuctEvent{
  final BuildContext context;
  HdpeDuctPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends HdpeDuctEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}


class SelectJointTypeFromEvent extends HdpeDuctEvent{
  final dynamic jointTypeFromValue;
  SelectJointTypeFromEvent({ required this.jointTypeFromValue});
  @override
  List<Object?> get props => [jointTypeFromValue];
}

class SelectJointTypeToEvent extends HdpeDuctEvent{
  final dynamic jointTypeToValue;
  SelectJointTypeToEvent({ required this.jointTypeToValue});
  @override
  List<Object?> get props => [jointTypeToValue];
}

class SelectWeatherEvent extends HdpeDuctEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectPaddingEvent extends HdpeDuctEvent{
  final dynamic okPadding;
  final dynamic notOkPadding;
  SelectPaddingEvent({ required this.okPadding, required this.notOkPadding});
  @override
  List<Object?> get props => [okPadding,notOkPadding];
}

class SelectWarningMatEvent extends HdpeDuctEvent{
  final dynamic okWarningMat;
  final dynamic notOkWarningMat;
  SelectWarningMatEvent({ required this.okWarningMat, required this.notOkWarningMat});
  @override
  List<Object?> get props => [okWarningMat,notOkWarningMat];
}