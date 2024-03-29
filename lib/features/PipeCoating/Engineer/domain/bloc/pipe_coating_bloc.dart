import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/PipeCoating/Engineer/domain/bloc/pipe_coating_event.dart';
import 'package:bsppl/features/PipeCoating/Engineer/domain/bloc/pipe_coating_state.dart';
import 'package:bsppl/features/PipeCoating/Engineer/helper/pipe_coating_helper.dart';
import 'package:bsppl/features/Stringing/Engineer/helper/stringing_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PipeCoatingBloc extends Bloc<PipeCoatingEvent, PipeCoatingState>{
  PipeCoatingBloc() : super(PipeCoatingInitialState()){
    on<PipeCoatingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<SelectPipePagingEvent>(_selectPipePaging);
    on<SelectPipeNoValueEvent>(_selectPipeNoValue);
    on<PipeCoatingSubmitEvent>(_submit);
  }
  
  String userId = '';
  String sectionId = '';
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  File _photo = File("");
  File get photo => _photo;

  String? pipeNumberValue;

  List<String> _pipeNumberList = [];
  List<String> get pipeNumberList => _pipeNumberList;

   TextEditingController dateController = TextEditingController();
   TextEditingController reportNumberController = TextEditingController();
   TextEditingController pipePageController = TextEditingController();
   TextEditingController kmFromController = TextEditingController();
   TextEditingController kmToController = TextEditingController();
   TextEditingController dailyProgressController = TextEditingController();
   TextEditingController relativeHumidityController = TextEditingController();
   TextEditingController airTemperatureController = TextEditingController();
   TextEditingController dewPointProgessController = TextEditingController();
   TextEditingController pipeTemperatureController = TextEditingController();
   TextEditingController manufactureController = TextEditingController();
   TextEditingController materialType1Controller = TextEditingController();
   TextEditingController materialType2Controller = TextEditingController();
   TextEditingController materialBatchController = TextEditingController();
   TextEditingController defectLocationController = TextEditingController();
   TextEditingController repairAreaController = TextEditingController();
   TextEditingController surfaceRemovalController = TextEditingController();
   TextEditingController visualInspController = TextEditingController();
   TextEditingController preHeatController = TextEditingController();
   TextEditingController dftCheckController = TextEditingController();
   TextEditingController holidayTestController = TextEditingController();
   TextEditingController activityRemarksController = TextEditingController();

  _pageLoad(PipeCoatingPageLoadEvent event, emit) async {
    emit(PipeCoatingPageLoadState());
    _isPageLoader = false;
    _isLoader = false;
    _photo = File("");
    dateController.text = "";
    reportNumberController.text = "";
    visualInspController.text = "";
    kmToController.text = "";
    dailyProgressController.text = "";
    kmFromController.text = "";
    relativeHumidityController.text = "";
    activityRemarksController.text = "";
    airTemperatureController.text = "";
    defectLocationController.text = "";
    dewPointProgessController.text = "";
    dftCheckController.text = "";
    holidayTestController.text = "";
    manufactureController.text = "";
    materialBatchController.text = "";
    materialType1Controller.text = "";
    materialType2Controller.text = "";
    pipePageController.text = "";
    pipeTemperatureController.text = "";
    preHeatController.text = "";
    repairAreaController.text = "";
    surfaceRemovalController.text = "";
    pipeNumberValue = null;
    _pipeNumberList = [];
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    _eventComplete(emit);
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


  _submit(PipeCoatingSubmitEvent event, emit) async {
    try{
      var validationCheck = await PipeCoatingHelper.validation(
          context: event.context,
          date: dateController.text.trim().toString(),
          reportNo: reportNumberController.text.trim().toString(),
          pipeNo: pipeNumberValue.toString(),
      );
      if(await validationCheck == true){
        _isLoader =  true;
        _eventComplete(emit);
        var res = await PipeCoatingHelper.submitData(
            context: event.context,
            sectionId: sectionId,
            reportNo: reportNumberController.text.trim().toString(),
            userId: userId,
            pipeCoatingDate: dateController.text.trim().toString(),
          photo: photo,
          remarks: activityRemarksController.text.trim().toString(),
          airTemperature: airTemperatureController.text.trim().toString(),
          dailyProgress: dailyProgressController.text.trim().toString(),
          defectLocation: defectLocationController.text.trim().toString(),
          dewPoint: dewPointProgessController.text.trim().toString(),
          dftCheck: dftCheckController.text.trim().toString(),
          from_km: kmFromController.text.trim().toString(),
          holidayTest: holidayTestController.text.trim().toString(),
          manufacturer: manufactureController.text.trim().toString(),
          materialBatch: materialBatchController.text.trim().toString(),
          materialType1: materialType1Controller.text.trim().toString(),
          materialType2: materialType2Controller.text.trim().toString(),
          pipeNumber: pipePageController.text.trim().toString(),
          pipeTemperature: pipeTemperatureController.text.trim().toString(),
          preHeat: preHeatController.text.trim().toString(),
          relativeHumidity: relativeHumidityController.text.trim().toString(),
          repairArea: repairAreaController.text.trim().toString(),
          serverURL: "",
          surfaceRemoval:surfaceRemovalController.text.trim().toString(),
          to_km: kmToController.text.trim().toString(),
          visualInsp: visualInspController.text.trim().toString(),
        );
        _isLoader =  false;
        _eventComplete(emit);
        if(res != null){
          _isPageLoader = false;
          _isLoader = false;
          _photo = File("");
          dateController.text = "";
          reportNumberController.text = "";
          visualInspController.text = "";
          kmToController.text = "";
          dailyProgressController.text = "";
          kmFromController.text = "";
          relativeHumidityController.text = "";
          activityRemarksController.text = "";
          airTemperatureController.text = "";
          defectLocationController.text = "";
          dewPointProgessController.text = "";
          dftCheckController.text = "";
          holidayTestController.text = "";
          manufactureController.text = "";
          materialBatchController.text = "";
          materialType1Controller.text = "";
          materialType2Controller.text = "";
          pipePageController.text = "";
          pipeTemperatureController.text = "";
          preHeatController.text = "";
          repairAreaController.text = "";
          surfaceRemovalController.text = "";
          pipeNumberValue = null;
        }
      }
      _eventComplete(emit);
    }catch(e){
      _isLoader =  false;
      _eventComplete(emit);
      log("TrenchingCatch${e.toString()}");
    }
  }


  _eventComplete(Emitter<PipeCoatingState>emit) {
    emit(PipeCoatingFetchDataState(
        photo: photo,
        dateController: dateController,
        reportNumberController: reportNumberController,
        visualInspController: visualInspController,
        kmToController: kmToController,
        dailyProgressController: dailyProgressController,
        kmFromController: kmFromController,
        isLoader: isLoader,
        isPageLoader: isPageLoader,
        relativeHumidityController: relativeHumidityController,
        activityRemarksController: activityRemarksController,
        airTemperatureController: airTemperatureController,
        defectLocationController: defectLocationController,
        dewPointProgessController: dewPointProgessController,
        dftCheckController: dftCheckController,
        holidayTestController: holidayTestController,
        manufactureController: manufactureController,
        materialBatchController: materialBatchController,
        materialType1Controller: materialType1Controller,
        materialType2Controller: materialType2Controller,
        pipePageController: pipePageController,
        pipeTemperatureController: pipeTemperatureController,
        preHeatController: preHeatController,
        repairAreaController: repairAreaController,
        surfaceRemovalController: surfaceRemovalController,
      pipeNumberList: pipeNumberList,
      pipeNumberValue: pipeNumberValue,

    )
    );
    }

}