import 'dart:developer';
import 'package:bsppl/features/JointCoating/Engineer/domain/bloc/joint_event.dart';
import 'package:bsppl/features/JointCoating/Engineer/domain/bloc/joint_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class JointCoatingBloc extends Bloc<JointCoatingEvent,JointCoatingState>{
  JointCoatingBloc() : super(JointCoatingInitialState()){
    on<JointCoatingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectJointTypeEvent>(_selectJointType);
    on<SelectVisualEvent>(_selectVisual);
    on<SelectHolidayTestEvent>(_selectHolidayTest);
  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isAcceptVisualValue = false;
  bool get isAcceptVisualValue => _isAcceptVisualValue;

  bool _isRejectVisualValue = false;
  bool get isRejectVisualValue => _isRejectVisualValue;

  bool _isAcceptHolidayTestValue = false;
  bool get isAcceptHolidayTestValue => _isAcceptHolidayTestValue;

  bool _isRejectHolidayTestValue = false;
  bool get isRejectHolidayTestValue => _isRejectHolidayTestValue;


  WeatherModel? weatherValue;
  JointTypeModel? jointTypeValue;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<JointTypeModel> _jointTypeList = [];
  List<JointTypeModel> get jointTypeList => _jointTypeList;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController jointNoController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController pipeDiameterController= TextEditingController();
  TextEditingController pipeThicknessController= TextEditingController();
  TextEditingController batchNoController= TextEditingController();
  TextEditingController roughnessController= TextEditingController();
  TextEditingController dustContainmentController= TextEditingController();
  TextEditingController primerAController= TextEditingController();
  TextEditingController primerBController= TextEditingController();
  TextEditingController relativeHumidityController= TextEditingController();
  TextEditingController coatingTypeController= TextEditingController();
  TextEditingController sleeveOptionController= TextEditingController();
  TextEditingController onBodyController= TextEditingController();
  TextEditingController onSeamController= TextEditingController();
  TextEditingController pipeCoatingController= TextEditingController();
  TextEditingController weldTempController= TextEditingController();
  TextEditingController remarkController= TextEditingController();

  _pageLoad(JointCoatingPageLoadEvent event, emit) {
    emit(JointCoatingPageLoadState());
    _isPageLoader = false;
    _isAcceptVisualValue = false;
    _isRejectVisualValue = false;
    _isAcceptHolidayTestValue = false;
    _isRejectHolidayTestValue = false;
    dateController.text = "";
    reportNumberController.text = "";
    kmController.text = "";
    jointNoController.text = "";
    suffixController.text = "";
    pipeDiameterController.text = "";
    pipeThicknessController.text = "";
    batchNoController.text = "";
    roughnessController.text = "";
    dustContainmentController.text = "";
    primerAController.text = "";
    primerBController.text = "";
    relativeHumidityController.text = "";
    coatingTypeController.text = "";
    sleeveOptionController.text = "";
    onBodyController.text = "";
    onSeamController.text = "";
    pipeCoatingController.text = "";
    weldTempController.text = "";
    remarkController.text = "";
    weatherValue = WeatherModel();
    jointTypeValue = JointTypeModel();
    _weatherList = [];
    _jointTypeList = [];
    _weatherList = WeatherModel.getWeatherData();
    _jointTypeList = JointTypeModel.getJointTypeData();
    _eventComplete(emit);
  }

  _selectDate(SelectDateEvent event, emit) async {
    DateTime? dateTime = await showDatePicker(
        context: event.context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (dateTime != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      dateController.text = formattedDate.toString();
      _eventComplete(emit);
    } else {
      log("Date is not selected");
    }
  }

  _selectWeather(SelectWeatherEvent event, emit) {
    weatherValue = event.weatherValue;
    _eventComplete(emit);
  }

  _selectJointType(SelectJointTypeEvent event, emit) {
    jointTypeValue = event.jointTypeValue;
    _eventComplete(emit);
  }

  _selectVisual(SelectVisualEvent event, emit) {
    _isAcceptVisualValue = event.isAcceptVisualValue;
    _isRejectVisualValue = event.isRejectVisualValue;
    _eventComplete(emit);
  }

  _selectHolidayTest(SelectHolidayTestEvent event, emit) {
    _isAcceptHolidayTestValue = event.isAcceptHolidayTestValue;
    _isRejectHolidayTestValue = event.isRejectHolidayTestValue;
    _eventComplete(emit);
  }


  _eventComplete(Emitter<JointCoatingState>emit) {
    emit(JointCoatingFetchDataState(
      isPageLoader : isPageLoader,
      isAcceptVisualValue : isAcceptVisualValue,
      isAcceptHolidayTestValue :isAcceptHolidayTestValue,
      isRejectVisualValue : isRejectVisualValue,
      isRejectHolidayTestValue : isRejectHolidayTestValue,
      weatherValue :weatherValue ,
      jointTypeValue : jointTypeValue,
      weatherList : weatherList,
      jointTypeList : jointTypeList,
      dateController :dateController ,
      reportNumberController : reportNumberController,
      kmController : kmController,
      jointNoController : jointNoController,
      suffixController : suffixController,
      pipeDiameterController : pipeDiameterController,
      pipeThicknessController :pipeThicknessController ,
      batchNoController :batchNoController ,
      roughnessController : roughnessController,
      dustContainmentController :dustContainmentController ,
      primerAController : primerAController,
      primerBController :primerBController ,
      relativeHumidityController :relativeHumidityController ,
      coatingTypeController :coatingTypeController ,
      sleeveOptionController :sleeveOptionController ,
      onBodyController : onBodyController,
      onSeamController : onSeamController,
      pipeCoatingController :pipeCoatingController ,
      weldTempController : weldTempController,
      remarkController : remarkController,

    ));
  }
}