import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PipeCoatingEvent extends Equatable{}

class PipeCoatingPageLoadEvent extends PipeCoatingEvent{
  final BuildContext context;
  PipeCoatingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends PipeCoatingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectCameraCaptureEvent extends PipeCoatingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectGalleryCaptureEvent extends PipeCoatingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SelectPipePagingEvent extends PipeCoatingEvent{
  final BuildContext context;
  SelectPipePagingEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SelectPipeNoValueEvent extends PipeCoatingEvent{
  final dynamic pipeNoValue;
  SelectPipeNoValueEvent({required this.pipeNoValue});
  @override
  List<Object?> get props => [pipeNoValue];
}

class PipeCoatingSubmitEvent extends PipeCoatingEvent{
  final BuildContext context;
  PipeCoatingSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}