import 'dart:developer';
import 'package:bsppl/features/HDPE%20Duct/Engineer/domain/bloc/hdpe_duct_event.dart';
import 'package:bsppl/features/HDPE%20Duct/Engineer/domain/bloc/hdpe_duct_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HdpeDuctBloc extends Bloc<HdpeDuctEvent, HdpeDuctState>{
  HdpeDuctBloc() :super(HdpeDuctInitialState()){
    on<HdpeDuctPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectJointTypeFromEvent>(_jointTypeFrom);
    on<SelectJointTypeToEvent>(_jointTypeTo);
    on<SelectWeatherEvent>(_selectWeather);
    on<SelectPaddingEvent>(_selectPadding);
    on<SelectWarningMatEvent>(_selectWarningMat);
  }

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _okPadding = false;
  bool get okPadding => _okPadding;

  bool _notOkPadding = false;
  bool get notOkPadding => _notOkPadding;

  bool _okWarningMat = false;
  bool get okWarningMat => _okWarningMat;

  bool _notOkWarningMat = false;
  bool get notOkWarningMat => _notOkWarningMat;

  JointTypeModel? jointTypeFromValue;
  JointTypeModel? jointTypeToValue;
  WeatherModel? weatherValue;

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
  TextEditingController ductLengthFromController =  TextEditingController();
  TextEditingController ductLengthToController =  TextEditingController();
  TextEditingController couplerController =  TextEditingController();
  TextEditingController activityRemarkController = TextEditingController();

  _pageLoad(HdpeDuctPageLoadEvent event, emit) async {
    emit(HdpeDuctPageLoadState());
    _isPageLoader = false;
    _okPadding = false;
    _notOkPadding = false;
    _okWarningMat = false;
    _notOkWarningMat = false;
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
    ductLengthFromController.text = "";
    ductLengthToController.text = "";
    couplerController.text = "";
    activityRemarkController.text = "";
    jointTypeFromValue = JointTypeModel();
    jointTypeToValue = JointTypeModel();
    weatherValue = WeatherModel();
    _jointTypeFromList = [];
    _jointTypeToList = [];
    _weatherList = [];
    _jointTypeFromList = JointTypeModel.getJointTypeData();
    _jointTypeToList = JointTypeModel.getJointTypeData();
    _weatherList = WeatherModel.getWeatherData();
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

  _selectPadding(SelectPaddingEvent event, emit) {
    _okPadding = event.okPadding;
    _notOkPadding = event.notOkPadding;
    _eventComplete(emit);
  }

  _selectWarningMat(SelectWarningMatEvent event, emit) {
    _okWarningMat = event.okWarningMat;
    _notOkWarningMat = event.notOkWarningMat;
    _eventComplete(emit);
  }
  _eventComplete(Emitter<HdpeDuctState>emit) {
    emit(HdpeDuctFetchDataState(
      isPageLoader:isPageLoader,
      okPadding :okPadding,
      okNotPadding : notOkPadding,
      okWarningMat : okWarningMat,
      notOkWarningMat : notOkWarningMat,
      jointTypeFromValue:jointTypeFromValue,
      jointTypeToValue:jointTypeToValue,
      weatherValue:weatherValue,
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
      ductLengthFromController:ductLengthFromController,
      ductLengthToController:ductLengthToController,
      couplerController:couplerController,
      activityRemarkController:activityRemarkController,
    ));
  }
}