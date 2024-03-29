import 'package:bsppl/features/YardReceiving/Engineer/domain/model/yard_name_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class YardReceivingState extends Equatable{}

class YardReceivingInitialState extends YardReceivingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class YardReceivingPageLoadState extends YardReceivingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class YardReceivingFetchDataState extends YardReceivingState{
  bool isPageLoader;
  YardNameModel? yardNameValue;
  List<YardNameModel> yardNameList;
  TextEditingController dateController  ;
  TextEditingController pipeBarCodeController;
  TextEditingController nrcdController;
  TextEditingController avizController;

  YardReceivingFetchDataState({
    required this.isPageLoader,
    required this.yardNameValue,
    required this.yardNameList,
    required this.dateController  ,
    required this.pipeBarCodeController,
    required this.nrcdController,
    required this.avizController,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isPageLoader,
    yardNameValue,
    yardNameList,
    dateController,
    pipeBarCodeController,
    nrcdController,
    avizController,
  ];
}