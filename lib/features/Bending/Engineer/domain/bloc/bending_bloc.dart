import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/Bending/Engineer/domain/bloc/bending_event.dart';
import 'package:bsppl/features/AllCommonModel/bend_model.dart';
import 'package:bsppl/features/AllCommonModel/check_model.dart';
import 'package:bsppl/features/AllCommonModel/holiday_model.dart';
import 'package:bsppl/features/Bending/Engineer/domain/bloc/bending_state.dart';
import 'package:bsppl/features/Bending/Engineer/helper/bending_helper.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/Engineer/helper/stringing_helper.dart';
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
    on<SelectPipePagingEvent>(_selectPipePaging);
    on<SelectPipeNoValueEvent>(_selectPipeNoValue);
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
  String? pipeNumberValue;

  List<String> _pipeNumberList = [];
  List<String> get pipeNumberList => _pipeNumberList;

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

  String userId = '';
  String sectionId = '';

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageController =  TextEditingController();
  TextEditingController pipePageController =  TextEditingController();
  TextEditingController bendNumberController =  TextEditingController();
  TextEditingController bendDegreeController =  TextEditingController();
  TextEditingController minuteController =  TextEditingController();
  TextEditingController bendSecondController =  TextEditingController();
  TextEditingController tpNoController =  TextEditingController();
  TextEditingController toKmController =  TextEditingController();
  TextEditingController fromKmController =  TextEditingController();
  TextEditingController dailyProgressController =  TextEditingController();
  TextEditingController bendChainageToController =  TextEditingController();
  TextEditingController bendDirectionController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(BendPageLoadEvent event,emit) async {
    _isPageLoader = false;
    _isLoader = false;
    _photo = File("");
    dateController.text = "";
    reportNumberController.text = "";
    chainageController.text = "";
    pipePageController.text = "";
    bendNumberController.text = "";
    bendDegreeController.text = "";
    minuteController.text = "";
    bendSecondController.text = "";
    tpNoController.text = "";
    toKmController.text = "";
    fromKmController.text = "";
    dailyProgressController.text = "";
    bendChainageToController.text = "";
    bendDirectionController.text = "";
    activityRemarkController.text = "";
    weatherValue = WeatherModel();
    bendValue = BendModel();
    visualValue = CheckModel();
    guagingValue = CheckModel();
    disbondingValue = CheckModel();
    holidayValue = HolidayModel();
    pipeNumberValue = null;
    _pipeNumberList = [];
    _weatherList = [];
    _bendList = [];
    _visualList = [];
    _guagingList = [];
    _disbondingList = [];
    _holidayList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
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

  _submit(BendSubmitEvent event, emit) async {
    try{
      var validationCheck = await  BendingHelper.validation(
          context: event.context,
          date: dateController.text.trim().toString(),
          reportNo: reportNumberController.text.trim().toString(),
          chainage: chainageController.text.trim().toString(),
          pipeNo: pipePageController.text.trim().toString(),
          bendNo: bendValue!.id.toString(),
          bendDegree: bendDegreeController.text.trim().toString(),
          minuteValue: minuteController.text.trim().toString(),
          secondValue: bendSecondController.text.trim().toString(),
          tpNo: tpNoController.text.trim().toString());
      if(await validationCheck == true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await BendingHelper.submitData(
            context: event.context,
            sectionId: sectionId,
            userId: userId,
            alignmentSheet: "",
            weather: weatherValue!.id.toString(),
            trDate: dateController.text.trim().toString(),
            trReportNumber: reportNumberController.text.trim().toString(),
            trChainage: chainageController.text.trim().toString(),
            pipeNumber: pipePageController.text.trim().toString(),
            bendNumber: bendNumberController.text.trim().toString(),
            tnDegree: bendDegreeController.text.trim().toString(),
            trBend: bendValue!.id.toString(),
            tnMin: minuteController.text.trim().toString(),
            tnSec: bendSecondController.text.trim().toString(),
            tnTP: tpNoController.text.trim().toString(),
            tnVisual: visualValue!.id.toString(),
            tnDisbonding: disbondingValue!.id.toString(),
            tnGauging: guagingValue!.id.toString(),
            tnHoliday: holidayValue!.id.toString(),
            tnOvality: "",
            toKm: toKmController.text.trim().toString(),
            fromKm: fromKmController.text.trim().toString(),
            dailyProgress: dailyProgressController.text.trim().toString(),
            bendChainageTo: bendChainageToController.text.trim().toString(),
            bendDirection: bendDirectionController.text.trim().toString(),
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
          pipePageController.text = "";
          bendNumberController.text = "";
          bendDegreeController.text = "";
          minuteController.text = "";
          bendSecondController.text = "";
          tpNoController.text = "";
          toKmController.text = "";
          fromKmController.text = "";
          dailyProgressController.text = "";
          bendChainageToController.text = "";
          bendDirectionController.text = "";
          activityRemarkController.text = "";
          weatherValue = WeatherModel();
          bendValue = BendModel();
          visualValue = CheckModel();
          guagingValue = CheckModel();
          disbondingValue = CheckModel();
          holidayValue = HolidayModel();
          pipeNumberValue = null;
        }
        _eventComplete(emit);
      }
    }catch(e){
      _isLoader =  false;
      _eventComplete(emit);
      log("BendingCatch-->${e.toString()}");
    }

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
      pipePageController: pipePageController ,
      bendNumberController: bendNumberController ,
      bendDegreeController: bendDegreeController ,
      minuteController: minuteController ,
      bendSecondController: bendSecondController ,
      tpNoController:tpNoController  ,
      activityRemarkController:  activityRemarkController,
      bendChainageToController: bendChainageToController,
      bendDirectionController: bendDirectionController,
       dailyProgressController: dailyProgressController,
      fromKmController: fromKmController,
      toKmController: toKmController,
      pipeNumberList: pipeNumberList,
      pipeNumberValue: pipeNumberValue,
    ));
  }
}