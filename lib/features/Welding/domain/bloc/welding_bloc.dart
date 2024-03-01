import 'dart:developer';

import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/helper/route_survey_helper.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Welding/domain/bloc/welding_event.dart';
import 'package:bsppl/features/Welding/domain/bloc/welding_state.dart';
import 'package:bsppl/features/Welding/domain/model/welder_model.dart';
import 'package:bsppl/features/Welding/domain/model/wps_model.dart';
import 'package:bsppl/features/Welding/helper/welding_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class WeldingBloc extends Bloc<WeldingEvent, WeldingState>{
  WeldingBloc() :super(WeldingInitialState()){
    on<WeldingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectJointTypeEvent>(_selectJointType);
    on<SelectWpsEvent>(_selectWps);
    on<SelectRootWelder1Event>(_selectRootWelder1);
    on<SelectRootWelder2Event>(_selectRootWelder2);
    on<SelectHotWelder1Event>(_selectHotWelder1);
    on<SelectHotWelder2Event>(_selectHotWelder2);
    on<SelectFiller1Welder1Event>(_selectFiller1Welder1);
    on<SelectFiller1Welder2Event>(_selectFiller1Welder2);
    on<SelectFiller2Welder1Event>(_selectFiller2Welder1);
    on<SelectFiller2Welder2Event>(_selectFiller2Welder2);
    on<SelectFiller3Welder1Event>(_selectFiller3Welder1);
    on<SelectFiller3Welder2Event>(_selectFiller3Welder2);
    on<SelectCapping1Welder1Event>(_selectCapping1Welder1);
    on<SelectCapping2Welder2Event>(_selectCapping2Welder2);
    on<SelectFitUpEvent>(_selectFitUp);
    on<SelectWeldVisualEvent>(_selectWeldVisual);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isFitUpValue = false;
  bool get isFitUpValue => _isFitUpValue;

  bool _isWeldVisualValue = false;
  bool get isWeldVisualValue => _isWeldVisualValue;


  AlignSheetModel? alignSheetValue;
  WeatherModel? weatherValue;
  JointTypeModel? jointTypeValue;
  WpsModel? wpsValue;
  WelderModel? rootWelders1Value;
  WelderModel? rootWelders2Value;
  WelderModel? hotWelders1Value;
  WelderModel? hotWelders2Value;
  WelderModel? filler1Welders1Value;
  WelderModel? filler1Welders2Value;
  WelderModel? filler2Welders1Value;
  WelderModel? filler2Welders2Value;
  WelderModel? filler3Welders1Value;
  WelderModel? filler3Welders2Value;
  WelderModel? cappingWelder1Value;
  WelderModel? cappingWelder2Value;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<JointTypeModel> _jointTypeList = [];
  List<JointTypeModel> get jointTypeList => _jointTypeList;

  List<WpsModel> _wpsList = [];
  List<WpsModel> get wpsList => _wpsList;

  List<WelderModel> _rootWelders1List = [];
  List<WelderModel> get rootWelders1List => _rootWelders1List;

  List<WelderModel> _rootWelders2List = [];
  List<WelderModel> get rootWelders2List => _rootWelders2List;

  List<WelderModel> _hotWelders1List = [];
  List<WelderModel> get hotWelders1List => _hotWelders1List;

  List<WelderModel> _hotWelders2List = [];
  List<WelderModel> get hotWelders2List => _hotWelders2List;

  List<WelderModel> _filler1Welders1List = [];
  List<WelderModel> get filler1Welders1List => _filler1Welders1List;

  List<WelderModel> _filler1Welders2List = [];
  List<WelderModel> get filler1Welders2List => _filler1Welders2List;

  List<WelderModel> _filler2Welders1List = [];
  List<WelderModel> get filler2Welders1List => _filler2Welders1List;

  List<WelderModel> _filler2Welders2List = [];
  List<WelderModel> get filler2Welders2List => _filler2Welders2List;

  List<WelderModel> _filler3Welders1List = [];
  List<WelderModel> get filler3Welders1List => _filler3Welders1List;

  List<WelderModel> _filler3Welders2List = [];
  List<WelderModel> get filler3Welders2List => _filler3Welders2List;

  List<WelderModel> _cappingWelder1List = [];
  List<WelderModel> get cappingWelder1List => _cappingWelder1List;

  List<WelderModel> _cappingWelder2List = [];
  List<WelderModel> get cappingWelder2List => _cappingWelder2List;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageFromController = TextEditingController();
  TextEditingController chainageToController = TextEditingController();
  TextEditingController leftPipeNumberController = TextEditingController();
  TextEditingController rightPipeNumberController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController jointNoController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController electrodeDiaE6010Controller = TextEditingController();
  TextEditingController electrodeDiaE6010BatchController = TextEditingController();
  TextEditingController electrodeDiaE8010p1Controller = TextEditingController();
  TextEditingController electrodeDiaE8010p1BatchController = TextEditingController();
  TextEditingController electrodeDiaE9045p2Controller = TextEditingController();
  TextEditingController electrodeDiaE9045p2BatchController = TextEditingController();
  TextEditingController electrodeDiaE81t8gController = TextEditingController();
  TextEditingController electrodeDiaE81t8gBatchController = TextEditingController();
  TextEditingController pipeDiameterController = TextEditingController();
  TextEditingController pipeThickController = TextEditingController();
  TextEditingController processController = TextEditingController();
  TextEditingController materialController = TextEditingController();

  _pageLoad(WeldingPageLoadEvent event, emit) async {
    emit(WeldingPageLoadState());
    _isPageLoader = false;
    _isFitUpValue = false;
    _isWeldVisualValue = false;
    alignSheetValue = AlignSheetModel();
    weatherValue = WeatherModel();
    jointTypeValue = JointTypeModel();
    wpsValue = WpsModel();
    rootWelders1Value = WelderModel();
    rootWelders2Value = WelderModel();
    hotWelders1Value = WelderModel();
    hotWelders2Value = WelderModel();
    filler1Welders1Value = WelderModel();
    filler1Welders2Value = WelderModel();
    filler2Welders1Value = WelderModel();
    filler2Welders2Value = WelderModel();
    filler3Welders1Value = WelderModel();
    filler3Welders2Value = WelderModel();
    cappingWelder1Value = WelderModel();
    cappingWelder2Value = WelderModel();
    _alignSheetList = [];
    _weatherList = [];
    _jointTypeList = [];
    _wpsList = [];
    _rootWelders1List = [];
    _rootWelders2List = [];
    _hotWelders1List = [];
    _hotWelders2List = [];
    _filler1Welders1List = [];
    _filler1Welders2List = [];
    _filler2Welders1List = [];
    _filler2Welders2List = [];
    _filler3Welders1List = [];
    _filler3Welders2List = [];
    _cappingWelder1List = [];
    _cappingWelder2List = [];
    await fetchAlignSheet(context: event.context);
    await fetchWpsType(context: event.context);
    await fetchWelder(context: event.context);
    _weatherList = WeatherModel.getWeatherData();
    _jointTypeList = JointTypeModel.getJointTypeData();
    _eventComplete(emit);
  }

  fetchAlignSheet({required BuildContext context}) async{
    var res = await RouteSurveyHelper.alignSheetData(sectionId: "2",context: context);
    if(res != null){
      _alignSheetList = res;
    }
  }
  fetchWpsType({required BuildContext context}) async{
    var res = await WeldingHelper.wpsTypeAPIData(sectionId: "2",context: context);
    if(res != null){
      _wpsList = res;
    }
  }
  fetchWelder({required BuildContext context}) async{
    var res = await WeldingHelper.welderAPIData(sectionId: "2",context: context);
    if(res != null){
      _rootWelders1List = res;
      _rootWelders2List = res;
      _hotWelders1List = res;
      _hotWelders2List = res;
      _filler1Welders1List = res;
      _filler1Welders2List = res;
      _filler2Welders1List = res;
      _filler2Welders2List = res;
      _filler3Welders1List = res;
      _filler3Welders2List = res;
      _cappingWelder1List = res;
      _cappingWelder2List = res;
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

  _selectJointType(SelectJointTypeEvent event, emit) {
    jointTypeValue = event.jointTypeValue;
    _eventComplete(emit);
  }

  _selectWps(SelectWpsEvent event, emit) {
    wpsValue = event.wpsValue;
    _eventComplete(emit);
  }

  _selectRootWelder1(SelectRootWelder1Event event, emit) {
    rootWelders1Value = event.rootWelder1Value;
    _eventComplete(emit);
  }

  _selectRootWelder2(SelectRootWelder2Event event, emit) {
    rootWelders2Value = event.rootWelder2Value;
    _eventComplete(emit);
  }

  _selectHotWelder1(SelectHotWelder1Event event, emit) {
    hotWelders1Value = event.hotWelder1Value;
    _eventComplete(emit);
  }

  _selectHotWelder2(SelectHotWelder2Event event, emit) {
    hotWelders2Value = event.hotWelder2Value;
    _eventComplete(emit);
  }

  _selectFiller1Welder1(SelectFiller1Welder1Event event, emit) {
    filler1Welders1Value = event.filler1Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller1Welder2(SelectFiller1Welder2Event event, emit) {
    filler1Welders2Value = event.filler1Welder2Value;
    _eventComplete(emit);
  }

  _selectFiller2Welder1(SelectFiller2Welder1Event event, emit) {
    filler2Welders1Value = event.filler2Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller2Welder2(SelectFiller2Welder2Event event, emit) {
    filler2Welders2Value = event.filler2Welder2Value;
    _eventComplete(emit);
  }

  _selectFiller3Welder1(SelectFiller3Welder1Event event, emit) {
    filler3Welders1Value = event.filler3Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller3Welder2(SelectFiller3Welder2Event event, emit) {
    filler3Welders2Value = event.filler3Welder2Value;
    _eventComplete(emit);
  }

  _selectCapping1Welder1(SelectCapping1Welder1Event event, emit) {
    cappingWelder1Value = event.capping1Welder1Value;
    _eventComplete(emit);
  }

  _selectCapping2Welder2(SelectCapping2Welder2Event event, emit) {
    cappingWelder2Value = event.capping2Welder2Value;
    _eventComplete(emit);
  }

  _selectFitUp(SelectFitUpEvent event, emit) {
    _isFitUpValue = event.fitUpValue;
    _eventComplete(emit);
  }

  _selectWeldVisual(SelectWeldVisualEvent event, emit) {
    _isWeldVisualValue = event.weldVisualValue;
    _eventComplete(emit);
  }

  _eventComplete(Emitter<WeldingState>emit) {
    emit(WeldingFetchDataState(
      isPageLoader: isPageLoader,
      isFitUpValue:isFitUpValue ,
      isWeldVisualValue:isWeldVisualValue ,
      alignSheetValue: alignSheetValue,
      weatherValue: weatherValue,
      jointTypeValue:jointTypeValue ,
      wpsValue: wpsValue,
      rootWelders1Value: rootWelders1Value,
      rootWelders2Value: rootWelders2Value,
      hotWelders1Value: hotWelders1Value,
      hotWelders2Value:hotWelders2Value ,
      filler1Welders1Value: filler1Welders1Value,
      filler1Welders2alue: filler1Welders2Value,
      filler2Welders1Value: filler2Welders1Value,
      filler2Welders2Value: filler2Welders2Value,
      filler3Welders1Value:filler3Welders1Value ,
      filler3Welders2Value: filler3Welders2Value,
      cappingWelder1Value: cappingWelder1Value,
      cappingWelder2Value: cappingWelder2Value,
      alignSheetList: alignSheetList,
      weatherList: weatherList,
      jointTypeList: jointTypeList,
      wpsList: wpsList,
      rootWelders1List: rootWelders1List,
      rootWelders2List: rootWelders2List,
      hotWelders1List:hotWelders1List,
      hotWelders2List: hotWelders2List,
      filler1Welders1List:filler1Welders1List ,
      filler1Welders2List: filler1Welders2List,
      filler2Welders1List: filler2Welders1List,
      filler2Welders2List: filler2Welders2List,
      filler3Welders1List:filler3Welders1List ,
      filler3Welders2List: filler3Welders2List,
      cappingWelder1List:cappingWelder1List ,
      cappingWelder2List: cappingWelder2List,
      dateController:dateController ,
      reportNumberController: reportNumberController,
      chainageFromController:chainageFromController ,
      chainageToController: chainageToController,
      leftPipeNumberController:leftPipeNumberController ,
      rightPipeNumberController:rightPipeNumberController ,
      kmController: kmController,
      jointNoController: jointNoController,
      suffixController: suffixController,
      electrodeDiaE6010Controller: electrodeDiaE6010Controller,
      electrodeDiaE6010BatchController:electrodeDiaE6010BatchController ,
      electrodeDiaE8010p1Controller: electrodeDiaE8010p1Controller,
      electrodeDiaE8010p1BatchController: electrodeDiaE8010p1BatchController,
      electrodeDiaE9045p2Controller: electrodeDiaE9045p2Controller,
      electrodeDiaE9045p2BatchController:electrodeDiaE9045p2BatchController ,
      electrodeDiaE81t8gController: electrodeDiaE81t8gController,
      electrodeDiaE81t8gBatchController:electrodeDiaE81t8gBatchController ,
      pipeDiameterController: pipeDiameterController,
      pipeThickController: pipeThickController,
      processController: processController,
      materialController: materialController,
    ));
  }
}