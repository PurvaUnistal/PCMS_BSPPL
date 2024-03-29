import 'dart:developer';
import 'dart:io';
import 'package:bsppl/Server/api_server.dart';
import 'package:bsppl/features/AllCommonModel/terrain_model.dart';
import 'package:bsppl/features/RouteHandOver/Engineer/domain/bloc/route_hand_over_event.dart';
import 'package:bsppl/features/RouteHandOver/Engineer/domain/bloc/route_hand_over_state.dart';
import 'package:bsppl/features/RouteHandOver/Engineer/helper/route_hand_over_helper.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RouteHandOverBloc extends Bloc<RouteHandOverEvent, RouteHandOverState>{
  RouteHandOverBloc() :super(RouteHandOverInitialState()){
    on<RouteHandOverPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectSectionLengthEvent>(_sectionLength);
    on<SelectCameraCaptureEvent>(_selectCameraCapture);
    on<SelectGalleryCaptureEvent>(_selectGalleryCapture);
    on<RouteHandOverSubmitEvent>(_submit);

  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isLoader = false;
  bool get isLoader => _isLoader;

  WeatherModel? weatherValue;
  TerrainModel? terrainValue;

  List<WeatherModel> _weatherList = [];
  List<WeatherModel> get weatherList => _weatherList;

  List<TerrainModel> _terrainList = [];
  List<TerrainModel> get terrainList => _terrainList;

  File _photo = File("");
  File get photo => _photo;

  TextEditingController dateController = TextEditingController();
  TextEditingController reportNumberController = TextEditingController();
  TextEditingController chainageFromController = TextEditingController();
  TextEditingController chainageToController = TextEditingController();
  TextEditingController sectionLengthController = TextEditingController();
  TextEditingController terrainController = TextEditingController();
  TextEditingController skippingController = TextEditingController();
  TextEditingController hindranceController = TextEditingController();
  TextEditingController panchnamaController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

   _pageLoad(RouteHandOverPageLoadEvent event, emit) async {
     _isPageLoader = false;
     _isLoader = false;
     _photo = File("");
     dateController.text = "";
     reportNumberController.text = "";
     chainageFromController.text = "";
     chainageToController.text = "";
     sectionLengthController.text = "";
     terrainController.text = "";
     skippingController.text = "";
     hindranceController.text = "";
     panchnamaController.text = "";
     remarkController.text = "";
     weatherValue = WeatherModel();
     terrainValue = TerrainModel();
     _weatherList = [];
     _terrainList = [];
     _weatherList = WeatherModel.getWeatherData();
     _terrainList = TerrainModel.getTerrainData();
     _eventCompleted(emit);
  }
  _selectWeather(SelectWeatherEvent event, emit) {
    weatherValue =  event.weatherValue;
    _eventCompleted(emit);
  }
  _selectDate(SelectDateEvent event, emit) async {
    DateTime firstDayCurrentMonth = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day+1);
    DateTime? pickedDate = await showDatePicker(context: event.context,
        initialDate: DateTime.now(),
        firstDate:  DateTime(2023),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String formattedDateChange = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text =  formattedDateChange.toString();
      _eventCompleted(emit);
    } else {
      print("Date is not selected");
    }

  }

  _sectionLength(SelectSectionLengthEvent event, emit) {
    final chainageFromValue = double.parse(chainageFromController.text.toString());
    final chainageToValue = double.parse(chainageToController.text.toString());
    log("sectionLengthController${sectionLengthController}");
    sectionLengthController.text = (chainageToValue - chainageFromValue).toString();
    _eventCompleted(emit);
  }

  _selectCameraCapture(SelectCameraCaptureEvent event, emit) async {
    var imgCapture = await ApiServer.cameraCapture();
    log("imgCapture-->$imgCapture");
    if(imgCapture != null){
      _photo  = imgCapture;
    }
    _eventCompleted(emit);
  }

  _selectGalleryCapture(SelectGalleryCaptureEvent event, emit) async {
    var imgCapture = await ApiServer.galleryCapture();
    log("imgCapture-->$imgCapture");
    if(imgCapture != null){
      _photo  = imgCapture;
    }
    _eventCompleted(emit);
  }
  _submit(RouteHandOverSubmitEvent event, emit) async {
     var validationCheck = await RouteHandOverHelper.validation(
      context: event.context,
      date: dateController.text.toString(),
      reportNumber: reportNumberController.text.toString(),
      chainageFrom: chainageFromController.text.toString(),
      chainageTo: chainageToController.text.toString());
     if(validationCheck != null){
       _isLoader =  true;
       _eventCompleted(emit);
       var res = await RouteHandOverHelper.submitData(
           context: event.context,
           weather: weatherValue!.id.toString(),
           date: dateController.text.trim().toString(),
           trReportNumber: reportNumberController.text.trim().toString(),
           mrChainageFrom: chainageFromController.text.trim().toString(),
           mrChainageTo: chainageToController.text.trim().toString(),
           terrian: terrainValue!.id.toString(),
           village: "", tehsil: terrainController.text.trim().toString(),
           district: sectionLengthController.text.trim().toString(),
           tnRemarks: remarkController.text.trim().toString(), photo: photo.path.toString());
       _isLoader =  false;
       _eventCompleted(emit);
       if(res != null){
         _isPageLoader = false;
         _isLoader = false;
         _photo = File("");
         dateController.text = "";
         reportNumberController.text = "";
         chainageFromController.text = "";
         chainageToController.text = "";
         sectionLengthController.text = "";
         terrainController.text = "";
         skippingController.text = "";
         hindranceController.text = "";
         panchnamaController.text = "";
         remarkController.text = "";
         weatherValue = WeatherModel();
         terrainValue = TerrainModel();
         _weatherList = [];
         _terrainList = [];
         _eventCompleted(emit);
       }
     }
   }

  _eventCompleted(Emitter<RouteHandOverState>emit) {
  emit(RouteHandOverFetchDataState(
  isPageLoader:isPageLoader ,
  isLoader:isLoader ,
  photo:photo ,
  dateController:dateController ,
  reportNumberController: reportNumberController,
  weatherValue:weatherValue,
  weatherList:weatherList,
    terrainValue:terrainValue,
    terrainList: terrainList,
  chainageFromController: chainageFromController,
  chainageToController: chainageToController,
  sectionLengthController: sectionLengthController,
  terrainController:terrainController ,
  skippingController: skippingController ,
  hindranceController:hindranceController ,
  panchnamaController: panchnamaController,
  remarkController:remarkController ,
)
  );
  }

}