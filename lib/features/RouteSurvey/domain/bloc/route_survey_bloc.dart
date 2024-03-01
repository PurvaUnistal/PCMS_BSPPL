import 'dart:developer';

import 'package:bsppl/features/RouteSurvey/domain/bloc/route_survey_event.dart';
import 'package:bsppl/features/RouteSurvey/domain/bloc/route_survey_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/helper/route_survey_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RouteSurveyBloc extends Bloc<RouteSurveyEvent, RouteSurveyState>{
  RouteSurveyBloc() : super(RouteSurveyInitialState()){
    on<RouteSurveyPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectWeatherEvent>(_selectWeather);
    on<RouteSurveySubmitEvent>(_submit);

  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  AlignSheetModel? alignSheetValue;
  WeatherModel? weatherValue;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageFromController =  TextEditingController();
  TextEditingController chainageToController =  TextEditingController();
  TextEditingController sectionLengthController =  TextEditingController();
  TextEditingController typeGrpController =  TextEditingController();
  TextEditingController tpIpController =  TextEditingController();
  TextEditingController noteController =  TextEditingController();
  TextEditingController structureDetailController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(RouteSurveyPageLoadEvent event, emit) async {
    emit(RouteSurveyPageLoadState());
    _isPageLoader = false;
    dateController.text = "";
    reportNumberController.text = "";
    chainageFromController.text = "";
    chainageToController.text = "";
    sectionLengthController.text = "";
    typeGrpController.text = "";
    tpIpController.text = "";
    noteController.text = "";
    structureDetailController.text = "";
    activityRemarkController.text = "";
    _alignSheetList = [];
    alignSheetValue = AlignSheetModel();
    weatherValue = WeatherModel();
    _weatherList = WeatherModel.getWeatherData();
    await fetchAlignSheet(context: event.context);
    _eventComplete(emit);
  }

  fetchAlignSheet({required BuildContext context}) async{
    var res = await RouteSurveyHelper.alignSheetData(sectionId: "2",context: context);
    if(res != null){
      _alignSheetList = res;
    }
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

  _selectAlignment(SelectAlignmentEvent event, emit) {
    alignSheetValue = event.alignSheetValue;
    _eventComplete(emit);
  }

  _selectWeather(SelectWeatherEvent event, emit) {
    weatherValue = event.weatherValue;
    _eventComplete(emit);
  }

  _submit(RouteSurveySubmitEvent event, state){

  }
  _eventComplete(Emitter<RouteSurveyState>emit) {
    emit(FetchRouteSurveyDataState(
      isPageLoader: isPageLoader,
      dateController: dateController,
      reportNumberController: reportNumberController,
      alignSheetValue: alignSheetValue,
      alignSheetList: alignSheetList,
      weatherValue:weatherValue,
      weatherList:weatherList ,
      chainageFromController:chainageFromController ,
      chainageToController: chainageToController,
      sectionLengthController:sectionLengthController ,
      typeGrpController: typeGrpController,
      tpIpController:tpIpController ,
      noteController: noteController,
      structureDetailController:structureDetailController ,
      activityRemarkController:activityRemarkController ,

    ));
  }
}