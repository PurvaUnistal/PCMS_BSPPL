import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/ClearingGrading/Engineer/domain/bloc/clearing_grading_event.dart';
import 'package:bsppl/features/ClearingGrading/Engineer/domain/bloc/clearing_grading_state.dart';
import 'package:bsppl/features/AllCommonModel/terrain_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/helper/route_survey_helper.dart';
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
    on<SelectSectionLengthEvent>(_sectionLength);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<ClearingGradingSubmitEvent>(_submit);

  }

  String userId = '';
  String sectionId = '';

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  File _photo = File("");
  File get photo => _photo;

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
  TextEditingController typeGrpController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(ClearingGradingPageLoadEvent event, emit) async {
    emit(ClearingGradingPageLoadState());
    _isPageLoader= false;
    _isLoader = false;
    _photo = File("");
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
    typeGrpController.text = "";
    activityRemarkController.text = "";
    alignSheetValue = AlignSheetModel();
    weatherValue = WeatherModel();
    terrainValue = TerrainModel();
    _alignSheetList = [];
    _weatherList = [];
    _terrainList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    typeGrpController.text =  await PreferenceUtil.getString(key: PreferenceValue.grpType);
    _weatherList = WeatherModel.getWeatherData();
    _terrainList = TerrainModel.getTerrainData();
    await fetchAlignSheet(context: event.context);
    _eventComplete(emit);
  }

  fetchAlignSheet({required BuildContext context}) async{
    var res = await RouteSurveyHelper.alignSheetData(sectionId: sectionId,context: context);
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

  _sectionLength(SelectSectionLengthEvent event, emit) {
    final chainageFromValue = double.parse(chainageFromController.text.toString());
    final chainageToValue = double.parse(chainageToController.text.toString());
    log("sectionLengthController${sectionLengthController}");
    sectionLengthController.text = (chainageToValue - chainageFromValue).toString();
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
  _submit(ClearingGradingSubmitEvent event, emit){

  }

  _eventComplete(Emitter<ClearingGradingState>emit) {
    emit(ClearingGradingFetchDataState(
      isPageLoader: isPageLoader,
      isLoader: isLoader,
      photo: photo,
      dateController:  dateController,
      reportNumberController: reportNumberController ,
      alignSheetValue: alignSheetValue,
      alignSheetList: alignSheetList ,
      weatherValue:  weatherValue,
      weatherList: weatherList ,
      chainageFromController: chainageFromController ,
      chainageToController: chainageToController ,
      sectionLengthController: sectionLengthController,
      ipNoFromController: ipNoFromController,
      ipNoToController: ipNoToController ,
      tpNoFromController: tpNoFromController,
      tpNoToController: tpNoToController,
      terrainValue:terrainValue,
      terrainList: terrainList,
      structureNameController: structureNameController,
      chainageController: chainageController,
      locationBoundaryController: locationBoundaryController,
      distanceController: distanceController,
      typeGrpController: typeGrpController,
      activityRemarkController: activityRemarkController,
    ));
  }

}