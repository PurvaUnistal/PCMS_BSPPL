import 'dart:developer';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/bloc/issue_to_contractor_event.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/bloc/issue_to_contractor_state.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/model/section_name_model.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/helper/issue_to_contractor_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class IssueToContractorBloc extends Bloc<IssueToContractorEvent,IssueToContractorState>{
  IssueToContractorBloc() : super(IssueToContractorInitialState()){
    on<IssueToContractorPageLoadEvent>(_pageLoad);
    on<SelectDateEvent>(_selectDate);
    on<SelectSectionNameEvent>(_selectYardName);
  }

  String userId = '';
  String sectionId = '';

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  SectionNameModel? sectionNameValue;

  List<SectionNameModel> _sectionNameList = [];
  List<SectionNameModel> get sectionNameList => _sectionNameList;

  TextEditingController dateController = TextEditingController();
  TextEditingController pipeBarCodeController = TextEditingController();
  TextEditingController hotoController = TextEditingController();

  _pageLoad(IssueToContractorPageLoadEvent event, emit) async {
    emit(IssueToContractorPageLoadState());
    _isPageLoader = false;
    sectionNameValue = SectionNameModel();
    _sectionNameList = [];
    dateController.text = "";
    pipeBarCodeController.text = "";
    hotoController.text = "";
    userId = await PreferenceUtil.getString(key: PreferenceValue.userId);
    sectionId = await PreferenceUtil.getString(key: PreferenceValue.sectionId);
    await yardName(context: event.context);
    _eventComplete(emit);
  }

  yardName({required BuildContext context}) async{
    var res = await IssueToContractorHelper.sectionNameData(context: context,sectionId: sectionId);
    if(res != null){
      _sectionNameList = res;
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

  _selectYardName(SelectSectionNameEvent event, emit) {
    sectionNameValue = event.sectionNameValue;
    _eventComplete(emit);
  }


  _eventComplete(Emitter<IssueToContractorState>emit) {
    emit(IssueToContractorFetchDataState(
      isPageLoader:isPageLoader,
      sectionNameValue: sectionNameValue,
      sectionNameList: sectionNameList,
      dateController: dateController,
      pipeBarCodeController: pipeBarCodeController,
      hotoController:hotoController,
    ));
  }
}