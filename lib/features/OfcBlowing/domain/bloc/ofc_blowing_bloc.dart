import 'dart:developer';
import 'package:bsppl/features/OfcBlowing/domain/bloc/ofc_blowing_event.dart';
import 'package:bsppl/features/OfcBlowing/domain/bloc/ofc_blowing_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OfcBlowingBloc extends Bloc<OfcBlowingEvent, OfcBlowingState>{
  OfcBlowingBloc() :super(OfcBlowingInitialState()){
    on<OfcBlowingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectJointTypeFromEvent>(_jointTypeFrom);
    on<SelectJointTypeToEvent>(_jointTypeTo);
    on<SelectWeatherEvent>(_selectWeather);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  JointTypeModel? jointTypeFromValue;
  JointTypeModel? jointTypeToValue;
  WeatherModel? weatherValue;

  List<JointTypeModel> _jointTypeFromList = [];
  List<JointTypeModel> get jointTypeFromList => _jointTypeFromList;

  List<JointTypeModel> _jointTypeToList = [];
  List<JointTypeModel> get jointTypeToList => _jointTypeToList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;


  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();

  final TextEditingController drumNumberController = TextEditingController();
  final TextEditingController drumLengthController = TextEditingController();
  final TextEditingController sectionLengthController = TextEditingController();
  final TextEditingController sequentialMakerController = TextEditingController();
  TextEditingController kmFromController =  TextEditingController();
  TextEditingController jointNoFromController =  TextEditingController();
  TextEditingController suffixFromController =  TextEditingController();
  TextEditingController kmToController =  TextEditingController();
  TextEditingController jointNoToController =  TextEditingController();
  TextEditingController suffixToController =  TextEditingController();
  final TextEditingController pitCableLengthController = TextEditingController();
  final TextEditingController noLocPitController = TextEditingController();
  final TextEditingController loopAtPitController = TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(OfcBlowingPageLoadEvent event, emit) async {
    emit(OfcBlowingPageLoadState());
    _isPageLoader = false;
    dateController.text = "";
    reportNumberController.text = "";
    drumNumberController.text = "";
    drumLengthController.text = "";
    sectionLengthController.text = "";
    sequentialMakerController.text = "";
    kmFromController.text = "";
    jointNoFromController.text = "";
    suffixFromController.text = "";
    kmToController.text = "";
    jointNoToController.text = "";
    suffixToController.text = "";
    pitCableLengthController.text = "";
    noLocPitController.text = "";
    loopAtPitController.text = "";
    activityRemarkController.text = "";
    jointTypeFromValue = JointTypeModel();
    jointTypeToValue = JointTypeModel();
    weatherValue = WeatherModel();
    _jointTypeFromList = [];
    _jointTypeToList = [];
    _weatherList = [];
    _jointTypeFromList = JointTypeModel.getJointTypeData();
    _jointTypeToList = JointTypeModel.getJointTypeData();
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

  _jointTypeFrom(SelectJointTypeFromEvent event, emit) {
    jointTypeFromValue = event.jointTypeFromValue;
    _eventComplete(emit);
  }

  _jointTypeTo(SelectJointTypeToEvent event, emit) {
    jointTypeToValue = event.jointTypeToValue;
    _eventComplete(emit);
  }

  _selectWeather(SelectWeatherEvent event, emit) {
    weatherValue = event.weatherValue;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<OfcBlowingState>emit) {
    emit(OfcBlowingFetchDataState(
      isPageLoader:isPageLoader,
      jointTypeFromValue:jointTypeFromValue,
      jointTypeToValue:jointTypeToValue,
      weatherValue:weatherValue,
      jointTypeFromList:jointTypeFromList,
      jointTypeToList:jointTypeToList,
      weatherList:weatherList,
      dateController:dateController,
      reportNumberController:reportNumberController,
      drumNumberController : drumNumberController,
      drumLengthController : drumLengthController,
      sectionLengthController : sectionLengthController,
      sequentialMakerController : sequentialMakerController,
      kmFromController:kmFromController,
      jointNoFromController:jointNoFromController,
      suffixFromController:suffixFromController,
      kmToController:kmToController,
      jointNoToController:jointNoToController,
      suffixToController:suffixToController,
      pitCableLengthController : pitCableLengthController,
      noLocPitController : noLocPitController,
      loopAtPitController : loopAtPitController,
      activityRemarkController:activityRemarkController,
    ));
  }
}