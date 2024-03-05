import 'dart:developer';
import 'dart:io';

import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/features/Bending/domain/bloc/bending_event.dart';
import 'package:bsppl/features/Bending/domain/bloc/bending_state.dart';
import 'package:bsppl/features/Bending/domain/model/bend_model.dart';
import 'package:bsppl/features/Bending/domain/model/check_model.dart';
import 'package:bsppl/features/Bending/domain/model/holiday_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BendingBloc extends Bloc<BendEvent,BendState>{
  BendingBloc() : super(BendInitialState()){
    on<BendPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectBendEvent>(_selectBend);
    on<SelectVisualEvent>(_selectVisual);
    on<SelectGuagingEvent>(_selectGuaging);
    on<SelectDisbondingEvent>(_selectDisbonding);
    on<SelectHolidayEvent>(_selectHoliday);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<BendSubmitEvent>(_submit);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  File _photo = File("");
  File get photo => _photo;

  WeatherModel? weatherValue;
  BendModel? bendValue;
  CheckModel? visualValue;
  CheckModel? guagingValue;
  CheckModel? disbondingValue;
  HolidayModel? holidayValue;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<BendModel> _bendList = [];
  List<BendModel> get bendList => _bendList;

  List<CheckModel> _visualList = [];
  List<CheckModel> get visualList => _visualList;

  List<CheckModel> _guagingList = [];
  List<CheckModel> get guagingList => _guagingList;

  List<CheckModel> _disbondingList = [];
  List<CheckModel> get disbondingList => _disbondingList;

  List<HolidayModel> _holidayList = [];
  List<HolidayModel> get holidayList => _holidayList;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageController =  TextEditingController();
  TextEditingController pipeNumberController =  TextEditingController();
  TextEditingController bendNumberController =  TextEditingController();
  TextEditingController bendDegreeController =  TextEditingController();
  TextEditingController minuteController =  TextEditingController();
  TextEditingController bendSecondController =  TextEditingController();
  TextEditingController tpNoController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(BendPageLoadEvent event,emit) {
    _isPageLoader = false;
    _isLoader = false;
    _photo = File("");
    dateController.text = "";
    reportNumberController.text = "";
    chainageController.text = "";
    pipeNumberController.text = "";
    bendNumberController.text = "";
    bendDegreeController.text = "";
    minuteController.text = "";
    bendSecondController.text = "";
    tpNoController.text = "";
    activityRemarkController.text = "";
    weatherValue = WeatherModel();
    bendValue = BendModel();
    visualValue = CheckModel();
    guagingValue = CheckModel();
    disbondingValue = CheckModel();
    holidayValue = HolidayModel();
    _weatherList = [];
    _bendList = [];
    _visualList = [];
    _guagingList = [];
    _disbondingList = [];
    _holidayList = [];
    _weatherList = WeatherModel.getWeatherData();
    _bendList = BendModel.getBendData();
    _visualList = CheckModel.getCheckData();
    _guagingList = CheckModel.getCheckData();
    _disbondingList = CheckModel.getCheckData();
    _holidayList = HolidayModel.getHolidayData();
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

  _selectBend(SelectBendEvent event,emit) {
    bendValue = event.bendValue;
    _eventComplete(emit);
  }

  _selectVisual(SelectVisualEvent event,emit) {
    visualValue = event.visualValue;
    _eventComplete(emit);
  }

  _selectGuaging(SelectGuagingEvent event,emit) {
    guagingValue = event.guagingValue;
    _eventComplete(emit);
  }

  _selectDisbonding(SelectDisbondingEvent event,emit) {
    disbondingValue = event.disbondingValue;
    _eventComplete(emit);
  }

  _selectHoliday(SelectHolidayEvent event,emit) {
    holidayValue = event.holidayValue;
    _eventComplete(emit);
  }


  _selectCameraCapture(SelectCameraCaptureEvent event, emit) async {
    var imgCapture = await ApiServer.cameraCapture();
    log("imgCapture-->$imgCapture");
    if(imgCapture != null){
      _photo  = imgCapture;
    }
    _eventComplete(emit);
  }

  _selectGalleryCapture(SelectGalleryCaptureEvent event, emit) async {
    var imgCapture = await ApiServer.galleryCapture();
    log("imgCapture-->$imgCapture");
    if(imgCapture != null){
      _photo  = imgCapture;
    }
    _eventComplete(emit);
  }
  _submit(BendSubmitEvent event, emit){

  }

  _eventComplete(Emitter<BendState>emit) {
    emit(BendFetchDataState(
      isPageLoader: isPageLoader,
      isLoader: isLoader,
      photo: photo,
      weatherValue: weatherValue ,
      bendValue: bendValue ,
      visualValue: visualValue ,
      guagingValue: guagingValue ,
      disbondingValue:  disbondingValue,
      holidayValue: holidayValue,
      weatherList: weatherList ,
      bendList: bendList ,
      visualList: visualList  ,
      guagingList: guagingList ,
      disbondingList:  disbondingList,
      holidayList: holidayList ,
      dateController: dateController ,
      reportNumberController: reportNumberController ,
      chainageController: chainageController  ,
      pipeNumberController: pipeNumberController ,
      bendNumberController: bendNumberController ,
      bendDegreeController: bendDegreeController ,
      minuteController: minuteController ,
      bendSecondController: bendSecondController ,
      tpNoController:tpNoController  ,
      activityRemarkController:  activityRemarkController,
    ));
  }
}