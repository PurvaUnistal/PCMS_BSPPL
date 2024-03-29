import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeldingEvent extends Equatable{}

class WeldingPageLoadEvent extends WeldingEvent{
  final BuildContext context;
  WeldingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends WeldingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectAlignmentEvent extends WeldingEvent{
  final dynamic alignSheetValue;
  SelectAlignmentEvent({ required this.alignSheetValue});
  @override
  // TODO: implement props
  List<Object?> get props => [alignSheetValue];
}

class SelectWeatherEvent extends WeldingEvent{
  final dynamic weatherValue;
  SelectWeatherEvent({ required this.weatherValue});
  @override
  List<Object?> get props => [weatherValue];
}

class SelectJointTypeEvent extends WeldingEvent{
  final dynamic jointTypeValue;
  SelectJointTypeEvent({ required this.jointTypeValue});
  @override
  List<Object?> get props => [jointTypeValue];
}

class SelectWpsEvent extends WeldingEvent{
  final dynamic wpsValue;
  SelectWpsEvent({ required this.wpsValue});
  @override
  List<Object?> get props => [wpsValue];
}

class SelectRootWelder1Event extends WeldingEvent{
  final dynamic rootWelder1Value;
  SelectRootWelder1Event({ required this.rootWelder1Value});
  @override
  List<Object?> get props => [rootWelder1Value];
}

class SelectRootWelder2Event extends WeldingEvent{
  final dynamic rootWelder2Value;
  SelectRootWelder2Event({ required this.rootWelder2Value});
  @override
  List<Object?> get props => [rootWelder2Value];
}

class SelectHotWelder1Event extends WeldingEvent{
  final dynamic hotWelder1Value;
  SelectHotWelder1Event({ required this.hotWelder1Value});
  @override
  List<Object?> get props => [hotWelder1Value];
}

class SelectHotWelder2Event extends WeldingEvent{
  final dynamic hotWelder2Value;
  SelectHotWelder2Event({ required this.hotWelder2Value});
  @override
  List<Object?> get props => [hotWelder2Value];
}

class SelectFiller1Welder1Event extends WeldingEvent{
  final dynamic filler1Welder1Value;
  SelectFiller1Welder1Event({ required this.filler1Welder1Value});
  @override
  List<Object?> get props => [filler1Welder1Value];
}

class SelectFiller1Welder2Event extends WeldingEvent{
  final dynamic filler1Welder2Value;
  SelectFiller1Welder2Event({ required this.filler1Welder2Value});
  @override
  List<Object?> get props => [filler1Welder2Value];
}

class SelectFiller2Welder1Event extends WeldingEvent{
  final dynamic filler2Welder1Value;
  SelectFiller2Welder1Event({ required this.filler2Welder1Value});
  @override
  List<Object?> get props => [filler2Welder1Value];
}

class SelectFiller2Welder2Event extends WeldingEvent{
  final dynamic filler2Welder2Value;
  SelectFiller2Welder2Event({ required this.filler2Welder2Value});
  @override
  List<Object?> get props => [filler2Welder2Value];
}

class SelectFiller3Welder1Event extends WeldingEvent{
  final dynamic filler3Welder1Value;
  SelectFiller3Welder1Event({ required this.filler3Welder1Value});
  @override
  List<Object?> get props => [filler3Welder1Value];
}

class SelectFiller3Welder2Event extends WeldingEvent{
  final dynamic filler3Welder2Value;
  SelectFiller3Welder2Event({ required this.filler3Welder2Value});
  @override
  List<Object?> get props => [filler3Welder2Value];
}

class SelectFiller4Welder1Event extends WeldingEvent{
  final dynamic filler4Welder1Value;
  SelectFiller4Welder1Event({ required this.filler4Welder1Value});
  @override
  List<Object?> get props => [filler4Welder1Value];
}

class SelectFiller4Welder2Event extends WeldingEvent{
  final dynamic filler4Welder2Value;
  SelectFiller4Welder2Event({ required this.filler4Welder2Value});
  @override
  List<Object?> get props => [filler4Welder2Value];
}
class SelectFiller5Welder1Event extends WeldingEvent{
  final dynamic filler5Welder1Value;
  SelectFiller5Welder1Event({ required this.filler5Welder1Value});
  @override
  List<Object?> get props => [filler5Welder1Value];
}

class SelectFiller5Welder2Event extends WeldingEvent{
  final dynamic filler5Welder2Value;
  SelectFiller5Welder2Event({ required this.filler5Welder2Value});
  @override
  List<Object?> get props => [filler5Welder2Value];
}
class SelectFiller6Welder1Event extends WeldingEvent{
  final dynamic filler6Welder1Value;
  SelectFiller6Welder1Event({ required this.filler6Welder1Value});
  @override
  List<Object?> get props => [filler6Welder1Value];
}

class SelectFiller6Welder2Event extends WeldingEvent{
  final dynamic filler6Welder2Value;
  SelectFiller6Welder2Event({ required this.filler6Welder2Value});
  @override
  List<Object?> get props => [filler6Welder2Value];
}
class SelectFiller7Welder1Event extends WeldingEvent{
  final dynamic filler7Welder1Value;
  SelectFiller7Welder1Event({ required this.filler7Welder1Value});
  @override
  List<Object?> get props => [filler7Welder1Value];
}

class SelectFiller7Welder2Event extends WeldingEvent{
  final dynamic filler7Welder2Value;
  SelectFiller7Welder2Event({ required this.filler7Welder2Value});
  @override
  List<Object?> get props => [filler7Welder2Value];
}
class SelectFiller8Welder1Event extends WeldingEvent{
  final dynamic filler8Welder1Value;
  SelectFiller8Welder1Event({ required this.filler8Welder1Value});
  @override
  List<Object?> get props => [filler8Welder1Value];
}

class SelectFiller8Welder2Event extends WeldingEvent{
  final dynamic filler8Welder2Value;
  SelectFiller8Welder2Event({ required this.filler8Welder2Value});
  @override
  List<Object?> get props => [filler8Welder2Value];
}
class SelectCapping1Welder1Event extends WeldingEvent{
  final dynamic capping1Welder1Value;
  SelectCapping1Welder1Event({ required this.capping1Welder1Value});
  @override
  List<Object?> get props => [capping1Welder1Value];
}

class SelectCapping2Welder2Event extends WeldingEvent{
  final dynamic capping2Welder2Value;
  SelectCapping2Welder2Event({ required this.capping2Welder2Value});
  @override
  List<Object?> get props => [capping2Welder2Value];
}

class SelectFitUpEvent extends WeldingEvent{
  final dynamic fitUpValue;
  SelectFitUpEvent({ required this.fitUpValue});
  @override
  List<Object?> get props => [fitUpValue];
}

class SelectWeldVisualEvent extends WeldingEvent{
  final dynamic weldVisualValue;
  SelectWeldVisualEvent({ required this.weldVisualValue});
  @override
  List<Object?> get props => [weldVisualValue];
}

class SelectCameraCaptureEvent extends WeldingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends WeldingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeldingSubmitEvent extends WeldingEvent{
 final BuildContext context;
  WeldingSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}