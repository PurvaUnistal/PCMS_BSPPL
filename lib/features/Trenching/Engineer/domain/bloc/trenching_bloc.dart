import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/helper/route_survey_helper.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/bloc/trenching_event.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/bloc/trenching_state.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/Engineer/helper/trenching_helper.dart';
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
    on<SelectJointFromEvent>(_selectJointFrom);
    on<SelectJointToEvent>(_selectJointTo);
    on<TrenchingSubmitEvent>(_submit);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  File _photo = File("");
  File get photo => _photo;

  String userId = '';
  String sectionId = '';
  String jointFrom = "";
  String jointTo = "";

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
  TextEditingController trenchTopWidthController =  TextEditingController();
  TextEditingController trenchBottomWidthController =  TextEditingController();
  TextEditingController terrainController =  TextEditingController();
  TextEditingController kmDELA_FROMController =  TextEditingController();
  TextEditingController kmPANA_LA_TOController =  TextEditingController();
  TextEditingController dailyProgressController =  TextEditingController();
  TextEditingController methodOfTrenchingController =  TextEditingController();
  TextEditingController sectionNoController =  TextEditingController();
  TextEditingController beddingAcceptedController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(TrenchingPageLoadEvent event, emit) async {
    emit(TrenchingPageLoadState());
    _isPageLoader = false;
    _isLoader = false;
    _photo = File("");
    jointFrom = "";
    jointTo = "";
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
    trenchTopWidthController.text = "";
    trenchBottomWidthController.text = "";
    terrainController.text = "";
    beddingAcceptedController.text = "";
    kmDELA_FROMController.text = "";
    kmPANA_LA_TOController.text = "";
    dailyProgressController.text = "";
    methodOfTrenchingController.text = "";
    activityRemarkController.text = "";
    sectionNoController.text = "";
    alignSheetValue = AlignSheetModel();
    jointTypeFromValue = JointTypeModel();
    jointTypeToValue = JointTypeModel();
    weatherValue = WeatherModel();
    _alignSheetList = [];
    _jointTypeFromList = [];
    _jointTypeToList = [];
    _weatherList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    await fetchAlignSheet(context: event.context);
    _jointTypeFromList = JointTypeModel.getJointTypeData();
    _jointTypeToList = JointTypeModel.getJointTypeData();
    _weatherList = WeatherModel.getWeatherData();
    _eventComplete(emit);
  }

  fetchAlignSheet({required BuildContext context}) async{
    var res = await RouteSurveyHelper.alignSheetData(sectionId:sectionId,context: context);
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


  _submit(TrenchingSubmitEvent event, emit) async{
    try{
      var validationCheck = await TrenchingHelper.validation(
        context: event.context,
        date: dateController.text.trim().toString(),
        reportNo: reportNumberController.text.trim().toString(),
        alignmentSheet: alignSheetValue.toString(),
        chainageFrom: chainageFromController.text.trim().toString(),
        chainageTo: chainageToController.text.trim().toString(),
        distanceCleared: sectionLengthController.text.trim().toString()
      );
      if(await validationCheck == true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await TrenchingHelper.submitData(
            context: event.context,
            sectionId: sectionId,
            userId: userId,
            trTrenchingDate: dateController.text.trim().toString(),
            trReportNumber: reportNumberController.text.trim().toString(),
            chainageFrom: chainageFromController.text.trim().toString(),
            chainageTo: chainageToController.text.trim().toString(),
            tnTrenchingLowerWidth: trenchBottomWidthController.text.trim().toString(),
            alignmentSheet: alignSheetValue!.alignmentId.toString(),
            tnJointNumberFrom: jointFrom.toString(),
            tnJointNumberTo: jointTo.toString(),
            mrDistanceCleared: sectionLengthController.text.trim().toString(),
            mnTrenchingDepth: trenchingDepthController.text.trim().toString(),
            mnTrenchingUpperWidth: trenchTopWidthController.text.trim().toString(),
            typeOfTerrain: terrainController.text.trim().toString(),
            weather: weatherValue!.id.toString(),
            tnRemarks: activityRemarkController.text.trim().toString(),
            beddingAccepted: beddingAcceptedController.text.trim().toString(),
            dailyProgress:  dailyProgressController.text.trim().toString(),
            from_km:  kmDELA_FROMController.text.trim().toString(),
            methodOfTrenching: methodOfTrenchingController.text.trim().toString(),
            sectionNo: sectionNoController.text.trim().toString(),
            to_km: kmPANA_LA_TOController.text.trim().toString(),
            photo: photo);
        _isLoader =  false;
        _eventComplete(emit);
        if(res != null){
          _isPageLoader = false;
          _isLoader = false;
          _photo = File("");
          jointFrom = "";
          jointTo = "";
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
          trenchTopWidthController.text = "";
          trenchBottomWidthController.text = "";
          terrainController.text = "";
          beddingAcceptedController.text = "";
          kmDELA_FROMController.text = "";
          kmPANA_LA_TOController.text = "";
          dailyProgressController.text = "";
          methodOfTrenchingController.text = "";
          activityRemarkController.text = "";
          sectionNoController.text = "";
          alignSheetValue = AlignSheetModel();
          jointTypeFromValue = JointTypeModel();
          jointTypeToValue = JointTypeModel();
          weatherValue = WeatherModel();
        }
      }
      _eventComplete(emit);
    }catch(e){
      _isLoader =  false;
      _eventComplete(emit);
      log("TrenchingCatch${e.toString()}");
    }
  }

  _eventComplete(Emitter<TrenchingState>emit) {
    emit(TrenchingFetchDataState(
      isPageLoader:isPageLoader,
      isLoader:isLoader,
      photo:photo,
      jointFrom: jointFrom,
      jointTo: jointTo,
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
      trenchTopWidthController:trenchTopWidthController,
      trenchBottomWidthController:trenchBottomWidthController,
      terrainController:terrainController,
      activityRemarkController:activityRemarkController,
      beddingAcceptedController :beddingAcceptedController,
      kmDELA_FROMController : kmDELA_FROMController,
      kmPANA_LA_TOController : kmPANA_LA_TOController,
      dailyProgressController : dailyProgressController,
      methodOfTrenchingController : methodOfTrenchingController,
      sectionNoController : sectionNoController,
    ));
  }

}