import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_event.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_state.dart';
import 'package:bsppl/features/Stringing/domain/model/coating_ok_model.dart';
import 'package:bsppl/features/Stringing/helper/stringing_helper.dart';
import 'package:flutter/cupertino.dart';
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

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<CoatingOkModel> _coatingOkList = [];
  List<CoatingOkModel> get coatingOkList => _coatingOkList;



  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageController =  TextEditingController();
  TextEditingController pipeNumberController =  TextEditingController();
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
    pipeNumberController.text = "";
    pipeMeterialController.text = "";
    pipeDiameterController.text = "";
    activityRemarkController.text = "";
    coatingValue = CoatingOkModel();
    weatherValue = WeatherModel();
    _weatherList = [];
    _coatingOkList = [];
    await fetchPipeNumberData(context: event.context, pageNo: "1");
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
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
      return res;
    }catch(e){

    }
  }

  _submit(StringingSubmitEvent event, emit) async {
    try{
      var validationCheck = await StringingHelper.validation(
          context: event.context,
          date: dateController.text.trim().toString(),
          reportNo: reportNumberController.text.trim().toString(),
          pipeNumber: pipeNumberController.text.trim().toString());
      if(await validationCheck == true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await StringingHelper.submitData(
            context: event.context,
            sectionId: sectionId,
            userId: userId,
            date: dateController.text.trim().toString(),
            reportNo: reportNumberController.text.trim().toString(),
            alignmentSheet: "0",
            weather: weatherValue!.id.toString(),
            mrChainageFrom: chainageController.text.trim().toString(),
            pipeDia: pipeDiameterController.text.trim().toString(),
            pipeMaterial: pipeMeterialController.text.trim().toString(),
            pipeID:  pipeNumberController.text.trim().toString(),
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
          activityRemarkController.text = "";
          weatherValue = WeatherModel();
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
      dateController :  dateController,
      reportNumberController :  reportNumberController,
      chainageController :  chainageController,
      pipeNumberController :  pipeNumberController,
      pipeDiameterController :  pipeDiameterController,
      pipeMeterialController :  pipeMeterialController,
      activityRemarkController :  activityRemarkController,
    ));
  }

}