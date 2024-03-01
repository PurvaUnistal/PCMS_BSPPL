import 'dart:developer';
import 'package:bsppl/features/ClearingGrading/domain/bloc/clearing_grading_event.dart';
import 'package:bsppl/features/ClearingGrading/domain/bloc/clearing_grading_state.dart';
import 'package:bsppl/features/ClearingGrading/domain/model/terrain_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/helper/route_survey_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class ClearingGradingBloc extends Bloc<ClearingGradingEvent, ClearingGradingState>{
  ClearingGradingBloc() : super(ClearingGradingInitialState()){
    on<ClearingGradingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectTerrainEvent>(_selectTerrain);

  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  AlignSheetModel? alignSheetValue;
  WeatherModel? weatherValue;
  TerrainModel? terrainValue;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<TerrainModel> _terrainList = [];
  List<TerrainModel> get terrainList => _terrainList;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageFromController =  TextEditingController();
  TextEditingController chainageToController =  TextEditingController();
  TextEditingController sectionLengthController =  TextEditingController();
  TextEditingController ipNoFromController =  TextEditingController();
  TextEditingController ipNoToController =  TextEditingController();
  TextEditingController tpNoFromController =  TextEditingController();
  TextEditingController tpNoToController =  TextEditingController();
  TextEditingController structureNameController =  TextEditingController();
  TextEditingController chainageController =  TextEditingController();
  TextEditingController locationBoundaryController =  TextEditingController();
  TextEditingController distanceController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(ClearingGradingPageLoadEvent event, emit) async {
    emit(ClearingGradingPageLoadState());
    _isPageLoader= false;
    dateController.text = "";
    reportNumberController.text = "";
    chainageFromController.text = "";
    chainageToController.text = "";
    sectionLengthController.text = "";
    ipNoFromController.text = "";
    ipNoToController.text = "";
    tpNoFromController.text = "";
    tpNoToController.text = "";
    structureNameController.text = "";
    chainageController.text = "";
    locationBoundaryController.text = "";
    distanceController.text = "";
    activityRemarkController.text = "";
    alignSheetValue = AlignSheetModel();
    weatherValue = WeatherModel();
    terrainValue = TerrainModel();
    _alignSheetList = [];
    _weatherList = [];
    _terrainList = [];
    _weatherList = WeatherModel.getWeatherData();
    _terrainList = TerrainModel.getTerrainData();
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

  _selectTerrain(SelectTerrainEvent event, emit) {
    terrainValue = event.terrainValue;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<ClearingGradingState>emit) {
    emit(ClearingGradingFetchDataState(
      isPageLoader: isPageLoader ,
      dateController:  dateController,
      reportNumberController: reportNumberController ,
      alignSheetValue: alignSheetValue,
      alignSheetList: alignSheetList ,
      weatherValue:  weatherValue,
      weatherList: weatherList ,
      chainageFromController: chainageFromController ,
      chainageToController: chainageToController ,
      sectionLengthController: sectionLengthController ,
      ipNoFromController: ipNoFromController ,
      ipNoToController: ipNoToController ,
      tpNoFromController: tpNoFromController ,
      tpNoToController: tpNoToController ,
      terrainValue:terrainValue ,
      terrainList: terrainList ,
      structureNameController: structureNameController ,
      chainageController: chainageController ,
      locationBoundaryController: locationBoundaryController ,
      distanceController: distanceController ,
      activityRemarkController: activityRemarkController ,
    ));
  }

}