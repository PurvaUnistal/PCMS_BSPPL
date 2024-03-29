import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class JointCoatingState extends Equatable{}

class JointCoatingInitialState extends JointCoatingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class JointCoatingPageLoadState extends JointCoatingState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class JointCoatingFetchDataState extends JointCoatingState{
  bool isPageLoader;
  bool isAcceptVisualValue;
  bool isAcceptHolidayTestValue;
  bool isRejectVisualValue;
  bool isRejectHolidayTestValue;
  WeatherModel? weatherValue;
  JointTypeModel? jointTypeValue;
  List<WeatherModel> weatherList;
  List<JointTypeModel> jointTypeList;
  TextEditingController dateController;
  TextEditingController reportNumberController;
  TextEditingController kmController;
  TextEditingController jointNoController;
  TextEditingController suffixController;
  TextEditingController pipeDiameterController;
  TextEditingController pipeThicknessController;
  TextEditingController batchNoController;
  TextEditingController roughnessController;
  TextEditingController dustContainmentController;
  TextEditingController primerAController;
  TextEditingController primerBController;
  TextEditingController relativeHumidityController;
  TextEditingController coatingTypeController;
  TextEditingController sleeveOptionController;
  TextEditingController onBodyController;
  TextEditingController onSeamController;
  TextEditingController pipeCoatingController;
  TextEditingController weldTempController;
  TextEditingController remarkController;

  JointCoatingFetchDataState({
    required this.isPageLoader,
    required this.isAcceptVisualValue,
    required this.isAcceptHolidayTestValue,
    required this.isRejectVisualValue,
    required this.isRejectHolidayTestValue,
    required this.weatherValue,
    required this.jointTypeValue,
    required this.weatherList,
    required this.jointTypeList,
    required this.dateController,
    required this.reportNumberController,
    required this.kmController,
    required this.jointNoController,
    required this.suffixController,
    required this.pipeDiameterController,
    required this.pipeThicknessController,
    required this.batchNoController,
    required this.roughnessController,
    required this.dustContainmentController,
    required this.primerAController,
    required this.primerBController,
    required this.relativeHumidityController,
    required this.coatingTypeController,
    required this.sleeveOptionController,
    required this.onBodyController,
    required this.onSeamController,
    required this.pipeCoatingController,
    required this.weldTempController,
    required this.remarkController,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
   isPageLoader,
   isAcceptVisualValue,
   isAcceptHolidayTestValue,
   isRejectVisualValue,
   isRejectHolidayTestValue,
   weatherValue,
   jointTypeValue,
   weatherList,
   jointTypeList,
   dateController,
   reportNumberController,
   kmController,
   jointNoController,
   suffixController,
   pipeDiameterController,
   pipeThicknessController,
   batchNoController,
   roughnessController,
   dustContainmentController,
   primerAController,
   primerBController,
   relativeHumidityController,
   coatingTypeController,
   sleeveOptionController,
   onBodyController,
   onSeamController,
   pipeCoatingController,
   weldTempController,
   remarkController,

  ];
}