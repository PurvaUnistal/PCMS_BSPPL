import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
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
    on<SelectFiller4Welder1Event>(_selectFiller4Welder1);
    on<SelectFiller4Welder2Event>(_selectFiller4Welder2);
    on<SelectFiller5Welder1Event>(_selectFiller5Welder1);
    on<SelectFiller5Welder2Event>(_selectFiller5Welder2);
    on<SelectFiller6Welder1Event>(_selectFiller6Welder1);
    on<SelectFiller6Welder2Event>(_selectFiller6Welder2);
    on<SelectFiller7Welder1Event>(_selectFiller7Welder1);
    on<SelectFiller7Welder2Event>(_selectFiller7Welder2);
    on<SelectFiller8Welder1Event>(_selectFiller8Welder1);
    on<SelectFiller8Welder2Event>(_selectFiller8Welder2);
    on<SelectCapping1Welder1Event>(_selectCapping1Welder1);
    on<SelectCapping2Welder2Event>(_selectCapping2Welder2);
    on<SelectFitUpEvent>(_selectFitUp);
    on<SelectWeldVisualEvent>(_selectWeldVisual);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<WeldingSubmitEvent>(_weldingSubmit);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader =  false;
  bool get isLoader => _isLoader;

  bool _isFitUpValue = false;
  bool get isFitUpValue => _isFitUpValue;

  bool _isWeldVisualValue = false;
  bool get isWeldVisualValue => _isWeldVisualValue;

  File photo =  File("");

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
  WelderModel? filler4Welders1Value;
  WelderModel? filler4Welders2Value;
  WelderModel? filler5Welders1Value;
  WelderModel? filler5Welders2Value;
  WelderModel? filler6Welders1Value;
  WelderModel? filler6Welders2Value;
  WelderModel? filler7Welders1Value;
  WelderModel? filler7Welders2Value;
  WelderModel? filler8Welders1Value;
  WelderModel? filler8Welders2Value;
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

  List<WelderModel> _filler4Welders1List = [];
  List<WelderModel> get filler4Welders1List => _filler4Welders1List;

  List<WelderModel> _filler4Welders2List = [];
  List<WelderModel> get filler4Welders2List => _filler4Welders2List;

  List<WelderModel> _filler5Welders1List = [];
  List<WelderModel> get filler5Welders1List => _filler5Welders1List;

  List<WelderModel> _filler5Welders2List = [];
  List<WelderModel> get filler5Welders2List => _filler5Welders2List;

  List<WelderModel> _filler6Welders1List = [];
  List<WelderModel> get filler6Welders1List => _filler6Welders1List;

  List<WelderModel> _filler6Welders2List = [];
  List<WelderModel> get filler6Welders2List => _filler6Welders2List;

  List<WelderModel> _filler7Welders1List = [];
  List<WelderModel> get filler7Welders1List => _filler7Welders1List;

  List<WelderModel> _filler7Welders2List = [];
  List<WelderModel> get filler7Welders2List => _filler7Welders2List;

  List<WelderModel> _filler8Welders1List = [];
  List<WelderModel> get filler8Welders1List => _filler8Welders1List;

  List<WelderModel> _filler8Welders2List = [];
  List<WelderModel> get filler8Welders2List => _filler8Welders2List;

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
  TextEditingController electrodeDiaE8010Controller = TextEditingController();
  TextEditingController electrodeDiaE6010Controller = TextEditingController();
  TextEditingController electrodeBatchE6010Controller = TextEditingController();
  TextEditingController electrodeBatchE8010Controller = TextEditingController();
  TextEditingController electrodeDiaB22B221868Controller = TextEditingController();
  TextEditingController electrodeBatchB22B221868Controller = TextEditingController();
  TextEditingController electrodeDiaE9045Controller = TextEditingController();
  TextEditingController electrodeBatchE9045p2Controller = TextEditingController();
  TextEditingController electrodeDia806012Controller = TextEditingController();
  TextEditingController electrodeBatch806012Controller = TextEditingController();
  TextEditingController pipeDiameterController = TextEditingController();
  TextEditingController pipeThickController = TextEditingController();
  TextEditingController processController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(WeldingPageLoadEvent event, emit) async {
    emit(WeldingPageLoadState());
    _isPageLoader = false;
    photo = File("");
    _isFitUpValue = false;
    _isWeldVisualValue = false;
    electrodeDiaE6010Controller.text = "";
    electrodeDiaE8010Controller.text = "";
    electrodeBatchE6010Controller.text = "";
    electrodeBatchE8010Controller.text = "";
    electrodeDiaB22B221868Controller.text = "";
    electrodeBatchB22B221868Controller.text = "";
    electrodeDiaE9045Controller.text = "";
    electrodeBatchE9045p2Controller.text = "";
    electrodeDia806012Controller.text = "";
    electrodeBatch806012Controller.text = "";
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
    filler4Welders1Value = WelderModel();
    filler4Welders2Value = WelderModel();
    filler5Welders1Value = WelderModel();
    filler5Welders2Value = WelderModel();
    filler6Welders1Value = WelderModel();
    filler6Welders2Value = WelderModel();
    filler7Welders1Value = WelderModel();
    filler7Welders2Value = WelderModel();
    filler8Welders1Value = WelderModel();
    filler8Welders2Value = WelderModel();
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
    _filler4Welders1List = [];
    _filler4Welders2List = [];
    _filler5Welders1List = [];
    _filler5Welders2List = [];
    _filler6Welders1List = [];
    _filler6Welders2List = [];
    _filler7Welders1List = [];
    _filler7Welders2List = [];
    _filler8Welders1List = [];
    _filler8Welders2List = [];
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
      _filler4Welders1List = res;
      _filler4Welders2List = res;
      _filler5Welders1List = res;
      _filler5Welders2List = res;
      _filler6Welders1List = res;
      _filler6Welders2List = res;
      _filler7Welders1List = res;
      _filler7Welders2List = res;
      _filler8Welders1List = res;
      _filler8Welders2List = res;
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
  _selectFiller4Welder1(SelectFiller4Welder1Event event, emit) {
    filler4Welders1Value = event.filler4Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller4Welder2(SelectFiller4Welder2Event event, emit) {
    filler4Welders2Value = event.filler4Welder2Value;
    _eventComplete(emit);
  }
  _selectFiller5Welder1(SelectFiller5Welder1Event event, emit) {
    filler5Welders1Value = event.filler5Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller5Welder2(SelectFiller5Welder2Event event, emit) {
    filler5Welders2Value = event.filler5Welder2Value;
    _eventComplete(emit);
  }
  _selectFiller6Welder1(SelectFiller6Welder1Event event, emit) {
    filler6Welders1Value = event.filler6Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller6Welder2(SelectFiller6Welder2Event event, emit) {
    filler6Welders2Value = event.filler6Welder2Value;
    _eventComplete(emit);
  }
  _selectFiller7Welder1(SelectFiller7Welder1Event event, emit) {
    filler7Welders1Value = event.filler7Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller7Welder2(SelectFiller7Welder2Event event, emit) {
    filler7Welders2Value = event.filler7Welder2Value;
    _eventComplete(emit);
  }
  _selectFiller8Welder1(SelectFiller8Welder1Event event, emit) {
    filler8Welders1Value = event.filler8Welder1Value;
    _eventComplete(emit);
  }

  _selectFiller8Welder2(SelectFiller8Welder2Event event, emit) {
    filler8Welders2Value = event.filler8Welder2Value;
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

  _selectCameraCapture(SelectCameraCaptureEvent event, emit) async {
    var imgCapture = await ApiServer.cameraCapture();
    log("imgCapture-->$imgCapture");
    if(imgCapture != null){
      photo  = imgCapture;
    }
    _eventComplete(emit);
  }

  _selectGalleryCapture(SelectGalleryCaptureEvent event, emit) async {
    var imgCapture = await ApiServer.galleryCapture();
    log("imgCapture-->$imgCapture");
    if(imgCapture != null){
      photo  = imgCapture;
    }
    _eventComplete(emit);
  }

  _weldingSubmit(WeldingSubmitEvent event, emit) async {
    try{
      var validationCheck = await WeldingHelper.validation(
        context: event.context,
        reportNo: reportNumberController.text.trim().toString(),
        date: dateController.text.trim().toString(),
        chainageFrom: chainageFromController.text.trim().toString(),
        chainageTo: chainageToController.text.trim().toString(),
        leftPipeNumber: leftPipeNumberController.text.trim().toString(),
        rightPipeNumber: rightPipeNumberController.text.trim().toString(),
        jointType: jointTypeValue.toString(),
          jointNo: jointNoController.text.trim().toString()
      );
      if(await validationCheck ==  true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await WeldingHelper.submitData(
            context: event.context,
            alignmentData: alignSheetValue!,
            JointId: jointTypeValue.toString(),
            reportNumber: reportNumberController.text.toString(),
            date: dateController.text.toString(),
            activityRemark: activityRemarkController.text.toString(),
            rootWelders1Data: rootWelders1Value!,
            rootWelders2Data: rootWelders2Value!,
            hotWelders1Data: hotWelders1Value!,
            hotWelders2Data: hotWelders2Value!,
            filler1Welders1Data: filler1Welders1Value!,
            filler1Welders2Data: filler1Welders2Value!,
            filler2Welders1Data: filler2Welders1Value!,
            filler2Welders2Data: filler2Welders2Value!,
            filler3Welders1Data: filler3Welders1Value!,
            filler3Welders2Data: filler3Welders2Value!,
            filler4Welders1Data: filler4Welders1Value!,
            filler4Welders2Data: filler4Welders2Value!,
            filler5Welders1Data: filler5Welders1Value!,
            filler5Welders2Data: filler5Welders2Value!,
            filler6Welders1Data: filler6Welders1Value!,
            filler6Welders2Data: filler6Welders2Value!,
            filler7Welders1Data: filler7Welders1Value!,
            filler7Welders2Data: filler7Welders2Value!,
            filler8Welders1Data: filler8Welders1Value!,
            filler8Welders2Data: filler8Welders2Value!,
            cappingWelder1Data: cappingWelder1Value!,
            cappingWelder2Data: cappingWelder2Value!,
            electrodeDiaE8010: electrodeDiaE8010Controller.text.trim().toString(),
            fitUp: isFitUpValue.toString(),
            leftPipeNumber: leftPipeNumberController.text.trim().toString(),
            material: materialController.text.trim().toString(),
            pipeDia: pipeDiameterController.text.trim().toString(),
            pipeThick: pipeThickController.text.trim().toString(),
            process: processController.text.trim().toString(),
            rightPipeNumber: rightPipeNumberController.text.trim().toString(),
            weather: weatherValue!,
            weldVisual: isWeldVisualValue.toString(),
            wpsNo: wpsValue!,
            chainageFrom: chainageFromController.text.toString(),
            chainageTo: chainageToController.text.toString(),
            electrodeDiaB22B221868: electrodeDiaB22B221868Controller.text.toString(),
            electrodeDia806012: electrodeDia806012Controller.text.toString(),
            electrodeBatch806012: electrodeBatch806012Controller.text.toString(),
            electrodeBatchB22B221868: electrodeBatchB22B221868Controller.text.toString(),
            electrodeBatchE6010: electrodeBatchE6010Controller.text.toString(),
            electrodeBatchE8010:electrodeBatchE8010Controller.text.toString(),
            electrodeBatchE9045p2: electrodeBatchE9045p2Controller.text.toString(),
            electrodeDiaE6010:electrodeDiaE6010Controller.text.toString(),
            electrodeDiaE9045: electrodeDiaE9045Controller.text.toString(),
            photo: File("")
        );
        _isLoader =  false;
        _eventComplete(emit);
        if(res != null){
          _isLoader =  false;
          photo =  File("");
          dateController.text = "";
          reportNumberController.text = "";
          activityRemarkController.text = "";
          electrodeDiaE6010Controller.text = "";
          electrodeDiaE8010Controller.text = "";
          electrodeBatchE6010Controller.text = "";
          electrodeBatchE8010Controller.text = "";
          electrodeDiaB22B221868Controller.text = "";
          electrodeBatchB22B221868Controller.text = "";
          electrodeDiaE9045Controller.text = "";
          electrodeBatchE9045p2Controller.text = "";
          electrodeDia806012Controller.text = "";
          electrodeBatch806012Controller.text = "";
          leftPipeNumberController.text = "";
          rightPipeNumberController.text = "";
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
          filler4Welders1Value = WelderModel();
          filler4Welders2Value = WelderModel();
          filler5Welders1Value = WelderModel();
          filler5Welders2Value = WelderModel();
          filler6Welders1Value = WelderModel();
          filler6Welders2Value = WelderModel();
          filler7Welders1Value = WelderModel();
          filler7Welders2Value = WelderModel();
          filler8Welders1Value = WelderModel();
          filler8Welders2Value = WelderModel();
          cappingWelder1Value = WelderModel();
          cappingWelder2Value = WelderModel();
          chainageFromController.text = "";
          chainageToController.text = "";
          weatherValue =  WeatherModel();
        }
        _eventComplete(emit);
      }
    }catch(e){
      _isLoader =  false;
      _eventComplete(emit);
      log("WeldingCatch-->${e.toString()}");
    }
  }


  _eventComplete(Emitter<WeldingState>emit) {
    emit(WeldingFetchDataState(
      photo: photo,
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
      filler4Welders1Value:filler4Welders1Value ,
      filler4Welders2Value: filler4Welders2Value,
      filler5Welders1Value:filler5Welders1Value ,
      filler5Welders2Value: filler5Welders2Value,
      filler6Welders1Value:filler6Welders1Value ,
      filler6Welders2Value: filler6Welders2Value,
      filler7Welders1Value:filler7Welders1Value ,
      filler7Welders2Value: filler7Welders2Value,
      filler8Welders1Value:filler8Welders1Value ,
      filler8Welders2Value: filler8Welders2Value,
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
      filler4Welders1List:filler4Welders1List ,
      filler4Welders2List: filler4Welders2List,
      filler5Welders1List:filler5Welders1List ,
      filler5Welders2List: filler5Welders2List,
      filler6Welders1List:filler6Welders1List ,
      filler6Welders2List: filler6Welders2List,
      filler7Welders1List:filler7Welders1List ,
      filler7Welders2List: filler7Welders2List,
      filler8Welders1List:filler8Welders1List ,
      filler8Welders2List: filler8Welders2List,
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
      electrodeDiaE8010Controller : electrodeDiaE8010Controller,
      electrodeBatchE6010Controller : electrodeBatchE6010Controller,
      electrodeBatchE8010Controller :electrodeBatchE8010Controller,
      electrodeDiaB22B221868Controller : electrodeDiaB22B221868Controller,
      electrodeBatchB22B221868Controller : electrodeBatchB22B221868Controller,
      electrodeDiaE9045Controller : electrodeDiaE9045Controller,
      electrodeBatchE9045p2Controller : electrodeBatchE9045p2Controller,
      electrodeDia806012Controller : electrodeDia806012Controller,
      electrodeBatch806012Controller : electrodeBatch806012Controller,
      pipeDiameterController: pipeDiameterController,
      pipeThickController: pipeThickController,
      processController: processController,
      materialController: materialController,
      activityRemarkController: activityRemarkController,
      isLoader: isLoader,
    ));
  }

}