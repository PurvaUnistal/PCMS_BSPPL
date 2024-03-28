import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PipeCoatingState extends Equatable{}

class PipeCoatingInitialState extends PipeCoatingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class PipeCoatingPageLoadState extends PipeCoatingState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PipeCoatingFetchDataState extends PipeCoatingState{
  final bool isPageLoader;
  final bool isLoader;
  final File photo;
  final TextEditingController dateController;
  final TextEditingController reportNumberController;
  final TextEditingController pipeNoController;
  final TextEditingController kmFromController;
  final TextEditingController kmToController;
  final TextEditingController dailyProgressController;
  final TextEditingController relativeHumidityController;
  final TextEditingController airTemperatureController;
  final TextEditingController dewPointProgessController;
  final TextEditingController pipeTemperatureController;
  final TextEditingController manufactureController;
  final TextEditingController materialType1Controller;
  final TextEditingController materialType2Controller;
  final TextEditingController materialBatchController;
  final TextEditingController defectLocationController;
  final TextEditingController repairAreaController;
  final TextEditingController surfaceRemovalController;
  final TextEditingController visualInspController;
  final TextEditingController preHeatController;
  final TextEditingController dftCheckController;
  final TextEditingController holidayTestController;
  final TextEditingController activityRemarksController;

  PipeCoatingFetchDataState({
    required this.photo,
    required this.dateController,
     required this.reportNumberController,
     required this.visualInspController,
     required this.kmToController,
     required this.dailyProgressController,
     required this.kmFromController,
     required this.isLoader,
     required this.isPageLoader,
     required this.relativeHumidityController,
     required this.activityRemarksController,
     required this.airTemperatureController,
     required this.defectLocationController,
     required this.dewPointProgessController,
     required this.dftCheckController,
     required this.holidayTestController,
     required this.manufactureController,
    required this.materialBatchController,
     required this.materialType1Controller,
     required this.materialType2Controller,
    required this.pipeNoController,
    required this.pipeTemperatureController,
    required this.preHeatController,
     required this.repairAreaController,
    required this.surfaceRemovalController,

});

  @override
// TODO: implement props
List<Object?> get props => [
    photo,
    dateController,
    reportNumberController,
    visualInspController,
    kmToController,
    dailyProgressController,
    kmFromController,
    isLoader,
    isPageLoader,
    relativeHumidityController,
    activityRemarksController,
    airTemperatureController,
    defectLocationController,
    dewPointProgessController,
    dftCheckController,
    holidayTestController,
    manufactureController,
    materialBatchController,
    materialType1Controller,
    materialType2Controller,
    pipeNoController,
    pipeTemperatureController,
    preHeatController,
    repairAreaController,
    surfaceRemovalController,
  ];
}