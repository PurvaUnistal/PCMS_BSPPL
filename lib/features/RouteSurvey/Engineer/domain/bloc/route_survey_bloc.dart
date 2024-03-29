import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/bloc/route_survey_event.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/bloc/route_survey_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/helper/route_survey_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RouteSurveyBloc extends Bloc<RouteSurveyEvent, RouteSurveyState>{
  RouteSurveyBloc() : super(RouteSurveyInitialState()){
    on<RouteSurveyPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectSectionLengthEvent>(_sectionLength);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<RouteSurveySubmitEvent>(_submit);

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
    _isLoader = false;
    _photo = File("");
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
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    _weatherList = WeatherModel.getWeatherData();
    typeGrpController.text =  await PreferenceUtil.getString(key: PreferenceValue.grpType);
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

  _submit(RouteSurveySubmitEvent event, emit) async {
    var validationCheck = await RouteSurveyHelper.validation(
        context: event.context,
        date: dateController.text.toString(),
        reportNumber: reportNumberController.text.toString(),
        alignmentSheet : alignSheetValue!.alignmentId.toString(),
        chainageFrom: chainageFromController.text.toString(),
        chainageTo: chainageToController.text.toString());
    if(validationCheck != null){
      _isLoader =  true;
      _eventComplete(emit);
      var res = await RouteSurveyHelper.submitData(
          context: event.context,
          date: dateController.text.trim().toString(),
          mrChainageFrom: chainageFromController.text.trim().toString(),
          mrChainageTo: chainageToController.text.trim().toString(),
          trReportNumber: reportNumberController.text.trim().toString(),
          alignmentSheet: alignSheetValue!.alignmentId.toString(),
          weather: weatherValue!.id.toString(),
          bearingangle: "",
          ipChainage: "",
          nameStructure: "",
          ipNo: tpIpController.text.trim().toString(),
          tpRemark: noteController.text.trim().toString(),
          terrian: "",
          chainage: "",
          others: structureDetailController.text.trim().toString(),
          remarks: activityRemarkController.text.trim().toString(),
          photo: photo.path.toString());
      _isLoader =  false;
      _eventComplete(emit);
      if(res != null){
        _isPageLoader = false;
        _isLoader = false;
        _photo = File("");
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
        alignSheetValue = AlignSheetModel();
        weatherValue = WeatherModel();
      }
    }
    }

  _eventComplete(Emitter<RouteSurveyState>emit) {
    emit(FetchRouteSurveyDataState(
      isPageLoader: isPageLoader,
      isLoader: isLoader,
      photo: photo,
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
      structureDetailController:structureDetailController,
      activityRemarkController:activityRemarkController,

    ));
  }
}