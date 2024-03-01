import 'dart:developer';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_event.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_state.dart';
import 'package:bsppl/features/Stringing/domain/model/coating_ok_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StringingBloc extends Bloc<StringingEvent,StringingState>{
  StringingBloc() : super(StringingInitialState()){
    on<StringingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectCoatingOkValueEvent>(_coatingOkValue);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isYesValue = false;
  bool get isYesValue => _isYesValue;

  bool _isNoValue = false;
  bool get isNoValue => _isNoValue;


  WeatherModel? weatherValue;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<CoatingOkModel> _coatingOkList = [];
  List<CoatingOkModel> get coatingOkList => _coatingOkList;



  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageController =  TextEditingController();
  TextEditingController pipeNumberController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(StringingPageLoadEvent event,emit) {
    _isPageLoader = false;
    _isYesValue = false;
    _isNoValue = false;
    dateController.text = "";
    reportNumberController.text = "";
    chainageController.text = "";
    pipeNumberController.text = "";
    activityRemarkController.text = "";
    weatherValue = WeatherModel();
    _weatherList = [];
    _coatingOkList = [];
    _weatherList = WeatherModel.getWeatherData();
    _coatingOkList = CoatingOkModel.getCoatingOkData();
    _eventComplete(emit);
  }

  _selectDate(SelectDateEvent event,emit) async {
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

  _selectWeather(SelectWeatherEvent event,emit) {
    weatherValue = event.weatherValue;
    _eventComplete(emit);
  }

  _coatingOkValue(SelectCoatingOkValueEvent event,emit) {
    _isYesValue = event.checkYes;
    _isNoValue = event.checkNo;
    _eventComplete(emit);
  }



  _eventComplete(Emitter<StringingState>emit) {
    emit(StringingFetchDataState(
      isPageLoader : isPageLoader,
      isYesValue : isYesValue,
      isNoValue :  isNoValue,
      weatherValue:weatherValue,
      weatherList :  weatherList,
      coatingOkList :  coatingOkList,
      dateController :  dateController,
      reportNumberController :  reportNumberController,
      chainageController :  chainageController,
      pipeNumberController :  pipeNumberController,
      activityRemarkController :  activityRemarkController,
    ));
  }

}