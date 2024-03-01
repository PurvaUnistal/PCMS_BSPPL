import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_search_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/RouteSurvey/domain/bloc/route_survey_bloc.dart';
import 'package:bsppl/features/RouteSurvey/domain/bloc/route_survey_event.dart';
import 'package:bsppl/features/RouteSurvey/domain/bloc/route_survey_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteSurveyPage extends StatefulWidget {
  const RouteSurveyPage({Key? key}) : super(key: key);

  @override
  State<RouteSurveyPage> createState() => _RouteSurveyPageState();
}

class _RouteSurveyPageState extends State<RouteSurveyPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<RouteSurveyBloc>(context).add(RouteSurveyPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<RouteSurveyBloc, RouteSurveyState>(
        builder: (context, state) {
      if(state is FetchRouteSurveyDataState) {
        return _itemBuilder(dataState: state);
      } else{
        return const Center(child: CenterLoaderWidget(),);
      }
    },
    )
    );
  }
  Widget _itemBuilder({required FetchRouteSurveyDataState dataState}){
    return Container(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child : Column(
          children: [
            _verticalSpace(),
            _dateController(dataState:dataState),
            _verticalSpace(),
            _reportNumberController(dataState:dataState),
            _verticalSpace(),
            _alignmentDropdown(dataState:dataState),
            _verticalSpace(),
            _weatherDropDown(dataState:dataState),
            _verticalSpace(),
            _chainageFromController(dataState:dataState),
            _verticalSpace(),
            _chainageToController(dataState:dataState),
            _verticalSpace(),
            _sectionLengthController(dataState:dataState),
            _verticalSpace(),
            _tpIpChainageController(dataState:dataState),
            _verticalSpace(),
            _tpRemarkController(dataState:dataState),
            _verticalSpace(),
            _structureDetailsController(dataState:dataState),
            _verticalSpace(),
            _activityRemark(dataState:dataState),
            _verticalSpace(),
            _verticalSpace(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _dateController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
     onTap: () {
       BlocProvider.of<RouteSurveyBloc>(context).add(
           SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }
  Widget _alignmentDropdown({required FetchRouteSurveyDataState dataState}) {
    return  DropdownWidget<AlignSheetModel>(
      hint: AppString.selectAlignment,
      label: AppString.selectAlignment,
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<RouteSurveyBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }
  Widget _weatherDropDown({required FetchRouteSurveyDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<RouteSurveyBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _chainageFromController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
       controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.chainageTo,
      label: AppString.chainageTo,
        controller: dataState.chainageToController,
    );
  }

  Widget _sectionLengthController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
        controller: dataState.sectionLengthController,
    );
  }

  Widget _tpIpChainageController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.tPIP,
      hintText: AppString.tPIP,
      controller: dataState.tpIpController,
    );
  }

  Widget _structureDetailsController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.structureDetails,
      label: AppString.structureDetails,
      controller: dataState.structureDetailController,
    );
  }


  Widget _tpRemarkController({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      maxLength: 2,
      label: AppString.tpRemark,
      hintText: AppString.tpRemark,
     controller: dataState.noteController,
    );
  }



  Widget _activityRemark({required FetchRouteSurveyDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarkController,
    );
  }


  Widget _button() {
   // return dataState.isLoader == false ?
   return ButtonWidget(text: "Submit",
        onPressed: () {
      //    BlocProvider.of<AddRouteSurveyBloc>(context).add(AddRouteSurveySubmitDataEvent(context: context));
        }
   );
  //  ): const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

}

