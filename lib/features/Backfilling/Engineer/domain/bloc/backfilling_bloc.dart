import 'dart:developer';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/AllCommonModel/plastic_grating_model.dart';
import 'package:bsppl/features/Backfilling/Engineer/domain/bloc/backfilling_event.dart';
import 'package:bsppl/features/Backfilling/Engineer/domain/bloc/backfilling_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/helper/route_survey_helper.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BackfillingBloc extends Bloc<BackfillingEvent, BackfillingState>{
  BackfillingBloc() :super(BackfillingInitialState()){
    on<BackfillingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectJointTypeFromEvent>(_jointTypeFrom);
    on<SelectJointTypeToEvent>(_jointTypeTo);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectPlasticGratingEvent>(_selectPlasticGrating);
  }
  String userId = '';
  String sectionId = '';

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  AlignSheetModel? alignSheetValue;
  JointTypeModel? jointTypeFromValue;
  JointTypeModel? jointTypeToValue;
  WeatherModel? weatherValue;
  PlasticGratingModel? plasticGratingValue;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<JointTypeModel> _jointTypeFromList = [];
  List<JointTypeModel> get jointTypeFromList => _jointTypeFromList;

  List<JointTypeModel> _jointTypeToList = [];
  List<JointTypeModel> get jointTypeToList => _jointTypeToList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<PlasticGratingModel> _plasticGratingList = [];
  List<PlasticGratingModel> get plasticGratingList => _plasticGratingList;


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
  TextEditingController postPoddingController =  TextEditingController();
  TextEditingController slopeBreakerController =  TextEditingController();
  TextEditingController antiBuoancyController =  TextEditingController();
  TextEditingController warningMaterialController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(BackfillingPageLoadEvent event, emit) async {
    emit(BackfillingPageLoadState());
    _isPageLoader = false;
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
    postPoddingController.text = "";
    slopeBreakerController.text = "";
    antiBuoancyController.text = "";
    warningMaterialController.text = "";
    activityRemarkController.text = "";
    alignSheetValue = AlignSheetModel();
    jointTypeFromValue = JointTypeModel();
    jointTypeToValue = JointTypeModel();
    weatherValue = WeatherModel();
    plasticGratingValue = PlasticGratingModel();
    _alignSheetList = [];
    _jointTypeFromList = [];
    _jointTypeToList = [];
    _weatherList = [];
    _plasticGratingList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    await fetchAlignSheet(context: event.context);
    _jointTypeFromList = JointTypeModel.getJointTypeData();
    _jointTypeToList = JointTypeModel.getJointTypeData();
    _weatherList = WeatherModel.getWeatherData();
    _plasticGratingList = PlasticGratingModel.getPlasticGratingData();
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

  _selectPlasticGrating(SelectPlasticGratingEvent event, emit) {
    plasticGratingValue = event.plasticGratinValue;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<BackfillingState>emit) {
    emit(BackfillingFetchDataState(
      isPageLoader:isPageLoader,
      alignSheetValue:alignSheetValue,
      jointTypeFromValue:jointTypeFromValue,
      jointTypeToValue:jointTypeToValue,
      weatherValue:weatherValue,
      plasticGratingValue:plasticGratingValue,
      alignSheetList:alignSheetList,
      jointTypeFromList:jointTypeFromList,
      jointTypeToList:jointTypeToList,
      weatherList:weatherList,
      plasticGratingList:plasticGratingList,
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
      postPoddingController:postPoddingController,
      slopeBreakerController:slopeBreakerController,
      antiBuoancyController:antiBuoancyController,
      warningMaterialController:warningMaterialController,
      activityRemarkController:activityRemarkController,
    ));
  }
}