import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/AllCommonModel/PipeNumberModel.dart';
import 'package:bsppl/features/AllCommonModel/check_model.dart';
import 'package:bsppl/features/AllCommonModel/completed_not_model.dart';
import 'package:bsppl/features/AllCommonModel/provide_not_model.dart';
import 'package:bsppl/features/Lower/Engineer/domain/bloc/lower_event.dart';
import 'package:bsppl/features/Lower/Engineer/domain/bloc/lower_state.dart';
import 'package:bsppl/features/Lower/Engineer/helper/lower_helper.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/helper/route_survey_helper.dart';
import 'package:bsppl/features/Stringing/Engineer/helper/stringing_helper.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LowerBloc extends Bloc<LowerEvent, LowerState>{
  LowerBloc() :super(LowerInitialState()){
    on<LowerPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectCalibrationDateEvent>(_selectCalibrationDate);
    on<SelectAlignmentEvent>(_selectAlignment);
    on<SelectJointTypeFromEvent>(_jointTypeFrom);
    on<SelectJointTypeToEvent>(_jointTypeTo);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectPostPaddingEvent>(_selectPostPadding);
    on<SelectHolidayCheckEvent>(_selectHolidayCheck);
    on<SelectJointFromEvent>(_selectJointFrom);
    on<SelectJointToEvent>(_selectJointTo);
    on<SelectPrePaddingValueEvent>(_electPrePaddingValueEvent);
    on<SelectDeWateringValueEvent>(_electDeWateringValueEvent);
    on<SelectPaddingValueEvent>(_electPaddingValueEvent);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<SelectSectionLengthEvent>(_sectionLength);
    on<SelectPipePagingEvent>(_selectPipePaging);
    on<SelectPipeNoValueEvent>(_selectPipeNoValue);
    on<LowerSubmitEvent>(_lowerSubmit);
  }
  String jointFrom = "";
  String jointTo = "";

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  bool _isPostPadding = false;
  bool get isPostPadding => _isPostPadding;

  File photo =  File("");

  bool _isHolidayCheck = false;
  bool get isHolidayCheck => _isHolidayCheck;

  AlignSheetModel? alignSheetValue;
  JointTypeModel? jointTypeFromValue;
  JointTypeModel? jointTypeToValue;
  WeatherModel? weatherValue;
  CheckModel? prePaddingValue;
  CompletedModel? deWateringValue;
  ProvideModel? paddingValue;
  String? pipeNumberValue;
  PipeNumberModel? pipeNumberModel;

  List<String> _pipeNumberList = [];
  List<String> get pipeNumberList => _pipeNumberList;

  List<AlignSheetModel> _alignSheetList = [];
  List<AlignSheetModel> get alignSheetList => _alignSheetList;

  List<JointTypeModel> _jointTypeFromList = [];
  List<JointTypeModel> get jointTypeFromList => _jointTypeFromList;

  List<JointTypeModel> _jointTypeToList = [];
  List<JointTypeModel> get jointTypeToList => _jointTypeToList;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<CheckModel> _prePaddingList = [];
  List<CheckModel> get prePaddingList => _prePaddingList;

  List<CompletedModel> _deWateringList = [];
  List<CompletedModel> get deWateringList => _deWateringList;

  List<ProvideModel> _paddingList = [];
  List<ProvideModel>  get paddingList => _paddingList;

  String userId = '';
  String sectionId = '';

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController pipePageController = TextEditingController();
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
  TextEditingController fromKmController =  TextEditingController();
  TextEditingController toKmController =  TextEditingController();
  TextEditingController dailyProgressController =  TextEditingController();
  TextEditingController sectionNoController =  TextEditingController();
  TextEditingController visualInspController =  TextEditingController();
  TextEditingController trenchAcceptanceController =  TextEditingController();
  TextEditingController pipeDiameterController =  TextEditingController();
  TextEditingController pipeMeterialController =  TextEditingController();
  TextEditingController coatingRepairController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(LowerPageLoadEvent event, emit) async {
    emit(LowerPageLoadState());
    _isPageLoader = false;
    _isLoader = false;
    _isPostPadding = false;
    _isHolidayCheck = false;
    photo =  File("");
    jointFrom = "";
    jointTo = "";
    dateController.text = "";
    pipePageController.text = "";
    reportNumberController.text = "";
    pipeDiameterController.text = "";
    pipeMeterialController.text = "";
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
    toKmController.text = "";
    visualInspController.text = "";
    dailyProgressController.text = "";
    sectionNoController.text = "";
    coatingRepairController.text = "";
    fromKmController.text = "";
    trenchAcceptanceController.text = "";
    pipeNumberValue = null;
    alignSheetValue = AlignSheetModel();
    jointTypeFromValue = JointTypeModel();
    jointTypeToValue = JointTypeModel();
    weatherValue = WeatherModel();
    prePaddingValue = CheckModel();
    deWateringValue = CompletedModel();
    paddingValue = ProvideModel();
    pipeNumberModel = PipeNumberModel();
    _alignSheetList = [];
    _jointTypeFromList = [];
    _jointTypeToList = [];
    _weatherList = [];
    _prePaddingList = [];
    _deWateringList = [];
    _paddingList = [];
    _pipeNumberList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    await fetchAlignSheet(context: event.context);
    _jointTypeFromList = JointTypeModel.getJointTypeData();
    _jointTypeToList = JointTypeModel.getJointTypeData();
    _weatherList = WeatherModel.getWeatherData();
    _prePaddingList = CheckModel.getCheckData();
    _deWateringList = CompletedModel.getCompletedData();
    _paddingList = ProvideModel.getProvideData();
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

  _selectCalibrationDate(SelectCalibrationDateEvent event, emit) async {
    DateTime? dateTime = await showDatePicker(
        context: event.context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (dateTime != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      calibrationDoneController.text = formattedDate.toString();
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
    if(jointTypeFromValue!.name != null){
      jointFrom = kmFromController.text + jointTypeFromValue!.name!.trim()+ jointNoFromController.text.trim() + suffixFromController.text.trim();
    }else{
      jointFrom = kmFromController.text.trim() + "" + jointNoFromController.text.trim() + suffixFromController.text.trim();
    }
    _eventComplete(emit);
  }

  _jointTypeTo(SelectJointTypeToEvent event, emit) {
    jointTypeToValue = event.jointTypeToValue;
    if(jointTypeToValue!.name != null){
      jointTo = kmToController.text.trim() + jointTypeToValue!.name!.trim()+ jointNoToController.text.trim() + suffixToController.text.trim();
    }else{
      jointTo = kmToController.text.trim() + "" +jointNoToController.text.trim() + suffixToController.text.trim();
    }
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
  _selectJointFrom(SelectJointFromEvent event, emit) {
    if(jointTypeFromValue!.name == null){
      jointFrom = kmFromController.text.trim() + ""+ jointNoFromController.text.trim() + suffixFromController.text.trim();
    }else {
      jointFrom = kmFromController.text.trim() + jointTypeFromValue!.name.toString() + jointNoFromController.text.trim() + suffixFromController.text.trim();
    }
    _eventComplete(emit);
  }

  _selectJointTo(SelectJointToEvent event, emit) {
    if(jointTypeToValue!.name == null){
      jointTo = kmToController.text.trim() +""+jointNoToController.text.trim() + suffixToController.text.trim();
    } else{
      jointTo = kmToController.text.trim() +jointTypeToValue!.name!.trim()+jointNoToController.text.trim() + suffixToController.text.trim();
    }
    _eventComplete(emit);
  }

  _electPrePaddingValueEvent(SelectPrePaddingValueEvent event, emit) {
    prePaddingValue = event.prePaddingValue;
    _eventComplete(emit);
  }

  _electDeWateringValueEvent(SelectDeWateringValueEvent event, emit) {
    deWateringValue = event.deWateringValue;
    _eventComplete(emit);
  }

  _electPaddingValueEvent(SelectPaddingValueEvent event, emit) {
    paddingValue = event.paddingValue;
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

  _sectionLength(SelectSectionLengthEvent event, emit) {
    final chainageFromValue = double.parse(chainageFromController.text.toString());
    final chainageToValue = double.parse(chainageToController.text.toString());
    log("sectionLengthController${sectionLengthController}");
    sectionLengthController.text = (chainageToValue - chainageFromValue).toString();
    _eventComplete(emit);
  }

  fetchPipeNumberData({required BuildContext context, required String pageNo}) async {
    try{
      var res = await StringingHelper.pipeNumberData(context: context, page:pageNo);
      if(res != null){
        pipeNumberModel = res;
        if(res.data != null){
          _pipeNumberList = res.data!;
        }
        return res;
      }
    } catch(e){
      log("pipeNumberModel-->${e.toString()}");
    }
  }

  _selectPipePaging(SelectPipePagingEvent event,emit) async {
    _pipeNumberList = [];
    pipeNumberValue = null;
    if(pipePageController.text.isNotEmpty){
      await fetchPipeNumberData(context: event.context, pageNo: pipePageController.text.trim().toString());
      _eventComplete(emit);
    }
  }

  _selectPipeNoValue(SelectPipeNoValueEvent event,emit) {
    pipeNumberValue = event.pipeNoValue;
    _eventComplete(emit);
  }

  _lowerSubmit(LowerSubmitEvent event, emit) async{
    try{
      var validationCheck = await LowerHelper.validation(
          context: event.context,
          date: dateController.text.trim().toString(),
          reportNo: reportNumberController.text.trim().toString(),
          pipeNumber: pipeNumberValue.toString());
      if(await validationCheck == true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await LowerHelper.submitData(
            context: event.context,
            sectionId: sectionId,
            userId: userId,
            loweringDate: dateController.text.trim().toString(),
            loweringRepNo: reportNumberController.text.trim().toString(),
            chainageFrom: chainageFromController.text.trim().toString(),
            chainageTo: chainageToController.text.trim().toString(),
            sectionLength: sectionLengthController.text.trim().toString(),
            alignmentSheet:alignSheetValue!.alignmentId == null ? "" :alignSheetValue!.alignmentId.toString(),
            jointFrom: jointFrom.toString(),
            jointTo: jointTo.toString(),
            prePadding: prePaddingValue!.id == null ? "" : prePaddingValue!.id.toString(),
            holidayChecking: holidayDetailsController.text.trim().toString(),
            postPadding: isPostPadding.toString(),
            pipeMaterial: pipeMeterialController.text.trim().toString(),
            pipeDia: pipeDiameterController.text.trim().toString(),
            location: locationController.text.trim().toString(),
            holidayDetector: holidayDetailsController.text.trim().toString(),
            model: makeModelController.text.trim().toString(),
            voltage: testVoltageController.text.trim().toString(),
            calibration: calibrationDoneController.text.trim().toString(),
            repairDamages: repairDamagesController.text.trim().toString(),
            weather:  weatherValue!.id == null ? "" : weatherValue!.id.toString(),
            deWatering: deWateringValue!.id == null ? "" : deWateringValue!.id.toString(),
            paddingMaterial: "",
            padding: paddingValue!.id == null ? "" :paddingValue!.id.toString(),
            remarks: activityRemarkController.text.trim().toString(),
            sectionNo: sectionNoController.text.trim().toString(),
            dailyProgress: dailyProgressController.text.trim().toString(),
            coatingRepair: coatingRepairController.text.trim().toString(),
            fromKm: kmFromController.text.trim().toString(),
            toKm: kmToController.text.trim().toString(),
            trenchAcceptance: trenchAcceptanceController.text.trim().toString(),
            visualInsp: visualInspController.text.trim().toString(),
            photo: photo);
        _isLoader =  false;
        _eventComplete(emit);
        if(res != null){
          _isPageLoader = false;
          _isLoader = false;
          _isPostPadding = false;
          _isHolidayCheck = false;
          dateController.text = "";
          photo =  File("");
          pipeDiameterController.text = "";
          pipeMeterialController.text = "";
          reportNumberController.text = "";
          pipePageController.text = "";
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
          pipeNumberValue = null;
          alignSheetValue = AlignSheetModel();
          jointTypeFromValue = JointTypeModel();
          jointTypeToValue = JointTypeModel();
          weatherValue = WeatherModel();
        }
        _eventComplete(emit);
      }
    }catch(e){
      _isLoader =  false;
      _eventComplete(emit);
      log("LowerCatch-->${e.toString()}");
    }
  }

  _eventComplete(Emitter<LowerState>emit) {
    emit(LowerFetchDataState(
        photo:photo,
        isLoader: isLoader,
        jointFrom: jointFrom,
        jointTo: jointTo,
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
        pipePageController:pipePageController,
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
        toKmController : toKmController,
        visualInspController : visualInspController,
        dailyProgressController : dailyProgressController,
        sectionNoController : sectionNoController,
        coatingRepairController : coatingRepairController,
        fromKmController : fromKmController,
        trenchAcceptanceController :trenchAcceptanceController,
        deWateringValue :deWateringValue,
        paddingValue : paddingValue,
        prePaddingValue : prePaddingValue,
        deWateringList : deWateringList,
        paddingList : paddingList,
        prePaddingList :prePaddingList,
        pipeDiameterController :pipeDiameterController,
        pipeMeterialController: pipeMeterialController,
        pipeNumberList: pipeNumberList,
        pipeNumberValue: pipeNumberValue,
        pipeNumberModel:pipeNumberModel
    ));
  }




}