import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/helper/route_survey_helper.dart';
import 'package:bsppl/features/Trenching/domain/bloc/trenching_event.dart';
import 'package:bsppl/features/Trenching/domain/bloc/trenching_state.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TrenchingBloc extends Bloc<TrenchingEvent, TrenchingState>{
  TrenchingBloc() :super(TrenchingInitialState()){
    on<TrenchingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectJointTypeFromEvent>(_jointTypeFrom);
    on<SelectJointTypeToEvent>(_jointTypeTo);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectSectionLengthEvent>(_sectionLength);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<TrenchingSubmitEvent>(_submit);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  File _photo = File("");
  File get photo => _photo;

  AlignSheetModel? alignSheetValue;
  JointTypeModel? jointTypeFromValue;
  JointTypeModel? jointTypeToValue;
  WeatherModel? weatherValue;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<JointTypeModel> _jointTypeFromList = [];
  List<JointTypeModel> get jointTypeFromList => _jointTypeFromList;

  List<JointTypeModel> _jointTypeToList = [];
  List<JointTypeModel> get jointTypeToList => _jointTypeToList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;


  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController kmFromController =  TextEditingController();
  TextEditingController jointNoFromController =  TextEditingController();
  TextEditingController suffixFromController =  TextEditingController();
  TextEditingController kmToController =  TextEditingController();
  TextEditingController jointNoToController =  TextEditingController();
  TextEditingController suffixToController =  TextEditingController();
  TextEditingController chainageFromController =  TextEditingController();
  TextEditingController chainageToController =  TextEditingController();
  TextEditingController sectionLengthController =  TextEditingController();
  TextEditingController trenchingDepthController =  TextEditingController();
  TextEditingController trenchWidthController =  TextEditingController();
  TextEditingController terrainController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(TrenchingPageLoadEvent event, emit) async {
    emit(TrenchingPageLoadState());
    _isPageLoader = false;
    _isLoader = false;
    _photo = File("");
    dateController.text = "";
    reportNumberController.text = "";
    kmFromController.text = "";
    jointNoFromController.text = "";
    suffixFromController.text = "";
    kmToController.text = "";
    jointNoToController.text = "";
    suffixToController.text = "";
    chainageFromController.text = "";
    chainageToController.text = "";
    sectionLengthController.text = "";
    trenchingDepthController.text = "";
    trenchWidthController.text = "";
    terrainController.text = "";
    activityRemarkController.text = "";
    alignSheetValue = AlignSheetModel();
    jointTypeFromValue = JointTypeModel();
    jointTypeToValue = JointTypeModel();
    weatherValue = WeatherModel();
    _alignSheetList = [];
    _jointTypeFromList = [];
    _jointTypeToList = [];
    _weatherList = [];
     await fetchAlignSheet(context: event.context);
    _jointTypeFromList = JointTypeModel.getJointTypeData();
    _jointTypeToList = JointTypeModel.getJointTypeData();
    _weatherList = WeatherModel.getWeatherData();
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

  _submit(TrenchingSubmitEvent event, emit){

  }

  _eventComplete(Emitter<TrenchingState>emit) {
    emit(TrenchingFetchDataState(
      isPageLoader:isPageLoader,
      isLoader:isLoader,
      photo:photo,
      alignSheetValue:alignSheetValue,
      jointTypeFromValue:jointTypeFromValue,
      jointTypeToValue:jointTypeToValue,
      weatherValue:weatherValue,
      alignSheetList:alignSheetList,
      jointTypeFromList:jointTypeFromList,
      jointTypeToList:jointTypeToList,
      weatherList:weatherList,
      dateController:dateController,
      reportNumberController:reportNumberController,
      kmFromController:kmFromController,
      jointNoFromController:jointNoFromController,
      suffixFromController:suffixFromController,
      kmToController:kmToController,
      jointNoToController:jointNoToController,
      suffixToController:suffixToController,
      chainageFromController:chainageFromController,
      chainageToController:chainageToController,
      sectionLengthController:sectionLengthController,
      trenchingDepthController:trenchingDepthController,
      trenchWidthController:trenchWidthController,
      terrainController:terrainController,
      activityRemarkController:activityRemarkController,
    ));
  }
}