import 'dart:developer';
import 'package:bsppl/features/Levelling/domain/bloc/levelling_event.dart';
import 'package:bsppl/features/Levelling/domain/bloc/levelling_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LevellingBloc extends Bloc<LevellingEvent, LevellingState>{
  LevellingBloc() :super(LevellingInitialState()){
    on<LevellingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectJointTypeEvent>(_jointTypeFrom);
    on<SelectWeatherEvent>(_selectWeather);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

 
  JointTypeModel? jointTypeValue;
  WeatherModel? weatherValue;

  List<JointTypeModel> _jointTypeList = [];
  List<JointTypeModel> get jointTypeList => _jointTypeList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;


  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController kmController =  TextEditingController();
  TextEditingController jointNoController =  TextEditingController();
  TextEditingController suffixFromController =  TextEditingController();
  TextEditingController kmToController =  TextEditingController();
  TextEditingController jointNoToController =  TextEditingController();
  TextEditingController suffixController =  TextEditingController();
  TextEditingController coverController =  TextEditingController();
  TextEditingController eastingController =  TextEditingController();
  TextEditingController northingController =  TextEditingController();
  TextEditingController pipeTopController =  TextEditingController();
  TextEditingController nglController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  
  _pageLoad(LevellingPageLoadEvent event, emit) async {
    emit(LevellingPageLoadState());
    _isPageLoader = false;
    dateController.text = "";
    reportNumberController.text = "";
    kmController.text = "";
    jointNoController.text = "";
    suffixFromController.text = "";
    kmToController.text = "";
    jointNoToController.text = "";
    suffixController.text = "";
    coverController.text = "";
    eastingController.text = "";
    northingController.text = "";
    pipeTopController.text = "";
    nglController.text = "";
    activityRemarkController.text = "";
    jointTypeValue = JointTypeModel();
    weatherValue = WeatherModel();
    _jointTypeList = [];
    _weatherList = [];
    _jointTypeList = JointTypeModel.getJointTypeData();
    _weatherList = WeatherModel.getWeatherData();
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

 

  _jointTypeFrom(SelectJointTypeEvent event, emit) {
    jointTypeValue = event.jointTypeValue;
    _eventComplete(emit);
  }
  
  _selectWeather(SelectWeatherEvent event, emit) {
    weatherValue = event.weatherValue;
    _eventComplete(emit);
  }

  
  _eventComplete(Emitter<LevellingState>emit) {
    emit(LevellingFetchDataState(
      isPageLoader:isPageLoader,
      weatherValue:weatherValue,
      jointTypeValue: jointTypeValue,
      jointTypeList: jointTypeList,
      weatherList:weatherList,
      dateController:dateController,
      reportNumberController:reportNumberController,
      kmController:kmController,
      jointNoController:jointNoController,
      suffixController:suffixController,
      coverController:coverController,
      eastingController:eastingController,
      northingController:northingController,
      pipeTopController:pipeTopController,
      nglController:nglController,
      activityRemarkController:activityRemarkController,
    ));
  }
}