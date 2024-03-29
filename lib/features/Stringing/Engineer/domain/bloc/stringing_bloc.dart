import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/helper/route_survey_helper.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/bloc/stringing_event.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/bloc/stringing_state.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/model/coating_ok_model.dart';
import 'package:bsppl/features/Stringing/Engineer/helper/stringing_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StringingBloc extends Bloc<StringingEvent,StringingState>{
  StringingBloc() : super(StringingInitialState()){
    on<StringingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectCoatingOkValueEvent>(_coatingOkValue);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<SelectPipePagingEvent>(_selectPipePaging);
    on<SelectPipeNoValueEvent>(_selectPipeNoValue);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<StringingSubmitEvent>(_submit);
  }

  String userId = '';
  String sectionId = '';

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  File _photo = File("");
  File get photo => _photo;


  WeatherModel? weatherValue;
  CoatingOkModel? coatingValue;
  String? pipeNumberValue;
  AlignSheetModel? alignSheetValue;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<String> _pipeNumberList = [];
  List<String> get pipeNumberList => _pipeNumberList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<CoatingOkModel> _coatingOkList = [];
  List<CoatingOkModel> get coatingOkList => _coatingOkList;



  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageController =  TextEditingController();
  TextEditingController pipePageController =  TextEditingController();
  TextEditingController pipeMeterialController =  TextEditingController();
  TextEditingController pipeDiameterController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(StringingPageLoadEvent event,emit) async {
    _isPageLoader = false;
    _isLoader = false;
    _photo = File("");
    dateController.text = "";
    reportNumberController.text = "";
    chainageController.text = "";
    pipePageController.text = "";
    pipeMeterialController.text = "";
    pipeDiameterController.text = "";
    activityRemarkController.text = "";
    pipeNumberValue = null;
    coatingValue = CoatingOkModel();
    weatherValue = WeatherModel();
    alignSheetValue = AlignSheetModel();
    _weatherList = [];
    _coatingOkList = [];
    _pipeNumberList = [];
    _alignSheetList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    _weatherList = WeatherModel.getWeatherData();
    _coatingOkList = CoatingOkModel.getCoatingOkData();
    await fetchAlignSheet(context: event.context);
    _eventComplete(emit);
  }

  fetchAlignSheet({required BuildContext context}) async{
    var res = await RouteSurveyHelper.alignSheetData(sectionId: sectionId,context: context);
    if(res != null){
      _alignSheetList = res;
    }
  }
  _selectAlignment(SelectAlignmentEvent event, emit) {
    alignSheetValue = event.alignSheetValue;
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
    coatingValue = event.coatingValue;
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


  fetchPipeNumberData({required BuildContext context, required String pageNo}) async {
    try{
      var res = await StringingHelper.pipeNumberData(context: context, page:pageNo );
      _pipeNumberList = res!.data;
      return res;
    }catch(e){
      log("pipeNumberDataCatch-->${e.toString()}");
    }
  }

  _selectPipePaging(SelectPipePagingEvent event,emit) async {
    pipeNumberValue = null;
    _pipeNumberList = [];
      await fetchPipeNumberData(context: event.context, pageNo: pipePageController.text.trim().toString());
      _eventComplete(emit);
  }

  _selectPipeNoValue(SelectPipeNoValueEvent event,emit) {
    pipeNumberValue = event.pipeNoValue;
    _eventComplete(emit);
  }

  _submit(StringingSubmitEvent event, emit) async {
    try{
      var validationCheck = await StringingHelper.validation(
          context: event.context,
          date: dateController.text.trim().toString(),
          reportNo: reportNumberController.text.trim().toString(),
          alignmentSheet: alignSheetValue.toString(),
          pipeNumber:pipeNumberValue.toString());
      if(await validationCheck == true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await StringingHelper.submitData(
            context: event.context,
            sectionId: sectionId,
            userId: userId,
            date: dateController.text.trim().toString(),
            reportNo: reportNumberController.text.trim().toString(),
            alignmentSheet:  alignSheetValue!.alignmentId.toString(),
            weather: weatherValue!.id.toString(),
            mrChainageFrom: chainageController.text.trim().toString(),
            pipeDia: pipeDiameterController.text.trim().toString(),
            pipeMaterial: pipeMeterialController.text.trim().toString(),
            pipeID:  pipeNumberValue.toString(),
            latitude: "0.0",
            longitude: "0.0",
            concreteCoating: coatingValue.toString(),
            tnRemarks: activityRemarkController.text.trim().toString(),
            photo: photo);
        _isLoader =  false;
        _eventComplete(emit);
        if(res != null){
          _isPageLoader = false;
          _isLoader = false;
          _photo = File("");
          dateController.text = "";
          reportNumberController.text = "";
          chainageController.text = "";
          chainageController.text = "";
          pipeDiameterController.text = "";
          pipeMeterialController.text = "";
          pipePageController.text = "";
          activityRemarkController.text = "";
          weatherValue = WeatherModel();
          alignSheetValue = AlignSheetModel();
          pipeNumberValue = null;
        }
        _eventComplete(emit);
      }
    }catch(e){
      _isLoader =  false;
      _eventComplete(emit);
      log("StringCatch${e.toString()}");
    }
  }



  _eventComplete(Emitter<StringingState>emit) {
    emit(StringingFetchDataState(
      isPageLoader : isPageLoader,
      isLoader: isLoader,
      photo: photo,
      coatingValue : coatingValue,
      weatherValue:weatherValue,
      weatherList :  weatherList,
      coatingOkList :  coatingOkList,
      pipeNumberList: pipeNumberList,
      pipeNumberValue: pipeNumberValue,
      dateController :  dateController,
      reportNumberController :  reportNumberController,
      chainageController :  chainageController,
      pipePageController :  pipePageController,
      pipeDiameterController :  pipeDiameterController,
      pipeMeterialController :  pipeMeterialController,
      activityRemarkController :  activityRemarkController,
      alignSheetValue:alignSheetValue,
      alignSheetList:alignSheetList,
    ));
  }



}