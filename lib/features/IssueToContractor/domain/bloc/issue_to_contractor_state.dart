import 'package:bsppl/features/IssueToContractor/domain/model/section_name_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IssueToContractorState extends Equatable{}

class IssueToContractorInitialState extends IssueToContractorState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class IssueToContractorPageLoadState extends IssueToContractorState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class IssueToContractorFetchDataState extends IssueToContractorState{
  bool isPageLoader;
  SectionNameModel? sectionNameValue;
  List<SectionNameModel> sectionNameList;
  TextEditingController dateController  ;
  TextEditingController pipeBarCodeController;
  TextEditingController hotoController;

  IssueToContractorFetchDataState({
    required this.isPageLoader,
    required this.sectionNameValue,
    required this.sectionNameList,
    required this.dateController  ,
    required this.pipeBarCodeController,
    required this.hotoController,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    sectionNameValue,
    sectionNameList,
    dateController,
    pipeBarCodeController,
    hotoController,
  ];
}