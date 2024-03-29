import 'dart:developer';
import 'package:bsppl/features/Radiography/Engineer/domain/bloc/radiography_event.dart';
import 'package:bsppl/features/Radiography/Engineer/domain/bloc/radiography_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RadioGraphyBloc extends Bloc<RadiographyEvent,RadiographyState>{
  RadioGraphyBloc() : super(RadiographyInitialState()){
    on<RadiographyPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectJointTypeEvent>(_selectJointType);
    on<SelectSegment1Event>(_selectSegment1);
    on<SelectSegment2Event>(_selectSegment2);
    on<SelectSegment3Event>(_selectSegment3);
    on<SelectSegment4Event>(_selectSegment4);
  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isAccept1Value = false;
  bool get isAccept1Value => _isAccept1Value;

  bool _isReject1Value = false;
  bool get isReject1Value => _isReject1Value;

  bool _isAccept2Value = false;
  bool get isAccept2Value => _isAccept2Value;

  bool _isReject2Value = false;
  bool get isReject2Value => _isReject2Value;

  bool _isAccept3Value = false;
  bool get isAccept3Value => _isAccept3Value;

  bool _isReject3Value = false;
  bool get isReject3Value => _isReject3Value;

  bool _isAccept4Value = false;
  bool get isAccept4Value => _isAccept4Value;

  bool _isReject4Value = false;
  bool get isReject4Value => _isReject4Value;

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
  TextEditingController observation1Controller = TextEditingController();
  TextEditingController observation2Controller = TextEditingController();
  TextEditingController observation3Controller = TextEditingController();
  TextEditingController observation4Controller = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  _pageLoad(RadiographyPageLoadEvent event, emit) {
    emit(RadiographyPageLoadState());
    _isPageLoader = false;
    _isAccept1Value = false;
    _isReject1Value = false;
    _isAccept2Value = false;
    _isReject2Value = false;
    _isAccept3Value = false;
    _isReject3Value = false;
    _isAccept4Value = false;
    _isReject4Value = false;
    dateController.text = "";
    reportNumberController.text = "";
    kmController.text = "";
    jointNoController.text = "";
    suffixController.text = "";
    observation1Controller.text = "";
    observation2Controller.text = "";
    observation3Controller.text = "";
    observation4Controller.text = "";
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

  _selectSegment1(SelectSegment1Event event, emit) {
    _isAccept1Value = event.accept1Value;
    _isReject1Value = event.reject1Value;
    _eventComplete(emit);
  }

  _selectSegment2(SelectSegment2Event event, emit) {
    _isAccept2Value = event.accept2Value;
    _isReject2Value = event.reject2Value;
    _eventComplete(emit);
  }

  _selectSegment3(SelectSegment3Event event, emit) {
    _isAccept3Value = event.accept3Value;
    _isReject3Value = event.reject3Value;
    _eventComplete(emit);
  }

  _selectSegment4(SelectSegment4Event event, emit) {
    _isAccept4Value = event.accept4Value;
    _isReject4Value = event.reject4Value;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<RadiographyState>emit) {
    emit(RadiographyFetchDataState(
      isPageLoader:isPageLoader,
      isAccept1Value:isAccept1Value,
      isAccept2Value:isAccept2Value,
      isAccept3Value:isAccept3Value,
      isAccept4Value:isAccept4Value,
      isReject1Value:isReject1Value,
      isReject2Value:isReject2Value,
      isReject3Value:isReject3Value,
      isReject4Value:isReject4Value,
      weatherValue:weatherValue,
      jointTypeValue:jointTypeValue,
      weatherList:weatherList,
      jointTypeList:jointTypeList,
      dateController:dateController,
      reportNumberController:reportNumberController,
      kmController:kmController,
      jointNoController:jointNoController,
      suffixController:suffixController,
      observation1Controller:observation1Controller,
      observation2Controller:observation2Controller,
      observation3Controller:observation3Controller,
      observation4Controller:observation4Controller,
      remarkController:remarkController,
    ));
  }
}