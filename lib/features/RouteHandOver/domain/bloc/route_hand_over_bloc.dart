import 'dart:async';

import 'package:bsppl/features/RouteHandOver/domain/bloc/route_hand_over_event.dart';
import 'package:bsppl/features/RouteHandOver/domain/bloc/route_hand_over_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RouteHandOverBloc extends Bloc<RouteHandOverEvent, RouteHandOverState>{
  RouteHandOverBloc() :super(RouteHandOverInitialState()){
    on<RouteHandOverPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);

  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  WeatherModel? weatherValue;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageFromController = TextEditingController();
  TextEditingController chainageToController = TextEditingController();
  TextEditingController terrainController = TextEditingController();
  TextEditingController skippingController = TextEditingController();
  TextEditingController hindranceController = TextEditingController();
  TextEditingController panchnamaController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

   _pageLoad(RouteHandOverPageLoadEvent event, emit) async {
     _isPageLoader = false;
     dateController.text = "";
     reportNumberController.text = "";
     chainageFromController.text = "";
     chainageToController.text = "";
     terrainController.text = "";
     skippingController.text = "";
     hindranceController.text = "";
     panchnamaController.text = "";
     remarkController.text = "";
     weatherValue = WeatherModel();
     _weatherList = WeatherModel.getWeatherData();
     _eventCompleted(emit);
  }
  _selectWeather(SelectWeatherEvent event, emit) {
    weatherValue =  event.weatherValue;
    _eventCompleted(emit);
  }
  _selectDate(SelectDateEvent event, emit) async {
    DateTime firstDayCurrentMonth = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day+1);
    DateTime? pickedDate = await showDatePicker(context: event.context,
        initialDate: DateTime.now(),
        firstDate:  DateTime(2023),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String formattedDateChange = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text =  formattedDateChange.toString();
      _eventCompleted(emit);
    } else {
      print("Date is not selected");
    }

  }

  _eventCompleted(Emitter<RouteHandOverState>emit) {
  emit(RouteHandOverFetchDataState(
  isPageLoader:isPageLoader ,
  dateController:dateController ,
  reportNumberController: reportNumberController,
  weatherValue:weatherValue ,
  weatherList:weatherList ,
  chainageFromController: chainageFromController,
  chainageToController: chainageToController,
  terrainController:terrainController ,
  skippingController: skippingController ,
  hindranceController:hindranceController ,
  panchnamaController: panchnamaController,
  remarkController:remarkController ,
)
  );
  }
}