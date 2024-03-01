import 'dart:developer';
import 'package:bsppl/features/Lower/domain/bloc/lower_event.dart';
import 'package:bsppl/features/Lower/domain/bloc/lower_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/helper/route_survey_helper.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LowerBloc extends Bloc<LowerEvent, LowerState>{
  LowerBloc() :super(LowerInitialState()){
    on<LowerPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectJointTypeFromEvent>(_jointTypeFrom);
    on<SelectJointTypeToEvent>(_jointTypeTo);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectPostPaddingEvent>(_selectPostPadding);
    on<SelectHolidayCheckEvent>(_selectHolidayCheck);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isPostPadding = false;
  bool get isPostPadding => _isPostPadding;

  bool _isHolidayCheck = false;
  bool get isHolidayCheck => _isHolidayCheck;

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
  TextEditingController locationController =  TextEditingController();
  TextEditingController holidayDetailsController =  TextEditingController();
  TextEditingController makeModelController =  TextEditingController();
  TextEditingController testVoltageController =  TextEditingController();
  TextEditingController calibrationDoneController =  TextEditingController();
  TextEditingController repairDamagesController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(LowerPageLoadEvent event, emit) async {
    emit(LowerPageLoadState());
    _isPageLoader = false;
    _isPostPadding = false;
    _isHolidayCheck = false;
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
    locationController.text = "";
    holidayDetailsController.text = "";
    makeModelController.text = "";
    testVoltageController.text = "";
    calibrationDoneController.text = "";
    repairDamagesController.text = "";
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

  _selectPostPadding(SelectPostPaddingEvent event, emit) {
    _isPostPadding = event.isPostPadding;
    _eventComplete(emit);
  }

  _selectHolidayCheck(SelectHolidayCheckEvent event, emit) {
    _isHolidayCheck = event.isHolidayCheck;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<LowerState>emit) {
    emit(LowerFetchDataState(
      isPageLoader:isPageLoader,
      isPostPadding:isPostPadding,
      isHolidayCheck:isHolidayCheck,
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
      locationController:locationController,
      holidayDetailsController:holidayDetailsController,
      makeModelController:makeModelController,
      testVoltageController:testVoltageController,
      calibrationDoneController: calibrationDoneController,
      repairDamagesController: repairDamagesController,
      activityRemarkController:activityRemarkController,
    ));
  }
}