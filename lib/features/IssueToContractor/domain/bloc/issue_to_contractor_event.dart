import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IssueToContractorEvent extends Equatable{}

class IssueToContractorPageLoadEvent extends IssueToContractorEvent{
  final BuildContext context;
  IssueToContractorPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends IssueToContractorEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectSectionNameEvent extends IssueToContractorEvent{
  final dynamic sectionNameValue;
  SelectSectionNameEvent({required this.sectionNameValue});
  @override
  // TODO: implement props
  List<Object?> get props => [sectionNameValue];
}


