import 'dart:async';
import 'dart:developer';

import 'package:bsppl/features/YardReceiving/Engineer/domain/bloc/yard_receiving_event.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/bloc/yard_receiving_state.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/model/yard_name_model.dart';
import 'package:bsppl/features/YardReceiving/Engineer/helper/yard_receiving_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class YardReceivingBloc extends Bloc<YardReceivingEvent,YardReceivingState>{
  YardReceivingBloc() : super(YardReceivingInitialState()){
    on<YardReceivingPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectYardNameEvent>(_selectYardName);
  //  on<SelectQrCodeScannerEvent>(_selectQrCodeScanner);
  }
  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  YardNameModel? yardNameValue;

  List<YardNameModel> _yardNameList = [];
  List<YardNameModel> get yardNameList => _yardNameList;

  TextEditingController dateController = TextEditingController();
  TextEditingController pipeBarCodeController = TextEditingController();
  TextEditingController nrcdController = TextEditingController();
  TextEditingController avizController = TextEditingController();
 // QRViewController  qrViewController;

  _pageLoad(YardReceivingPageLoadEvent event, emit) async {
    emit(YardReceivingPageLoadState());
    _isPageLoader = false;
    yardNameValue = YardNameModel();
    _yardNameList = [];
    dateController.text = "";
    pipeBarCodeController.text = "";
    nrcdController.text = "";
    avizController.text = "";
    await yardName(context: event.context);
    _eventComplete(emit);
  }

  yardName({required BuildContext context}) async{
    var res = await YardReceivingHelper.yardNameData(context: context);
    if(res != null){
      _yardNameList = res;
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

  _selectYardName(SelectYardNameEvent event, emit) {
    yardNameValue = event.yardNameValue;
    _eventComplete(emit);
  }
  /*_selectQrCodeScanner(SelectQrCodeScannerEvent event, emit){
    qrViewController.scannedDataStream.listen((scanData))
  }*/

  _eventComplete(Emitter<YardReceivingState>emit) {
    emit(YardReceivingFetchDataState(
      isPageLoader:isPageLoader,
      yardNameValue: yardNameValue,
      yardNameList: yardNameList,
      dateController: dateController,
      pipeBarCodeController: pipeBarCodeController,
      nrcdController:nrcdController,
      avizController: avizController,
    ));
  }
}