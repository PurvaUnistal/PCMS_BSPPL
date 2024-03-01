import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/ClearingGrading/domain/bloc/clearing_grading_bloc.dart';
import 'package:bsppl/features/ClearingGrading/domain/bloc/clearing_grading_event.dart';
import 'package:bsppl/features/ClearingGrading/domain/bloc/clearing_grading_state.dart';
import 'package:bsppl/features/ClearingGrading/domain/model/terrain_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearingGradingPage extends StatefulWidget {
  const ClearingGradingPage({Key? key}) : super(key: key);

  @override
  State<ClearingGradingPage> createState() => _ClearingGradingPageState();
}

class _ClearingGradingPageState extends State<ClearingGradingPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ClearingGradingBloc>(context).add(ClearingGradingPageLoadEvent(context: context));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<ClearingGradingBloc, ClearingGradingState>(
          builder: (context, state) {
            if(state is ClearingGradingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },
        )
    );
  }
  Widget _itemBuilder({required ClearingGradingFetchDataState dataState}){
    return Container(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child : Column(
          children: [
            _verticalSpace(),
            _dateController(dataState: dataState),
            _verticalSpace(),
            _reportNumberController(dataState: dataState),
            _verticalSpace(),
            _alignmentDropdown(dataState: dataState),
            _verticalSpace(),
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _chainageFromController(dataState: dataState),
            _verticalSpace(),
            _chainageToController(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _ipNoFromController(dataState: dataState),
            _verticalSpace(),
            _ipNoToController(dataState: dataState),
            _verticalSpace(),
            _tpNoFromSController(dataState: dataState),
            _verticalSpace(),
            _tpNoToController(dataState: dataState),
            _verticalSpace(),
            _terrainDropDown(dataState: dataState),
            _verticalSpace(),
            _structureNameController(dataState: dataState),
            _verticalSpace(),
            _chainageController(dataState: dataState),
            _verticalSpace(),
            _boundaryLocationController(dataState: dataState),
            _verticalSpace(),
            _distanceController(dataState: dataState),
            _verticalSpace(),
            _activityRemark(dataState: dataState),
            _verticalSpace(),
            _verticalSpace(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _dateController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }

  Widget _alignmentDropdown({required ClearingGradingFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      label: AppString.selectAlignment,
      hint: AppString.selectAlignment,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }

  Widget _weatherDropDown({required ClearingGradingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _chainageFromController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
    );
  }

  Widget _sectionLengthController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      controller: dataState.sectionLengthController,
    );
  }

  Widget _ipNoFromController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.ipNoFrom,
      hintText: AppString.ipNoFrom,
      controller: dataState.ipNoFromController,
    );
  }

  Widget _ipNoToController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label:  AppString.ipNoTo,
      hintText:  AppString.ipNoTo,
      controller: dataState.ipNoToController,
    );
  }
  Widget _tpNoFromSController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.tpNoFrom,
      hintText: AppString.tpNoFrom,
      controller: dataState.tpNoFromController,
    );
  }

  Widget _tpNoToController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.tpNoTo,
      hintText: AppString.tpNoTo,
      controller: dataState.tpNoToController,
    );
  }

  Widget _terrainDropDown({required ClearingGradingFetchDataState dataState}) {
    return DropdownWidget<TerrainModel>(
      label: AppString.terrain,
      hint: AppString.terrain,
      dropdownValue: dataState.terrainValue?.name != null ? dataState.terrainValue : null,
      onChanged: (value) {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectTerrainEvent(terrainValue: value));
      },
      items:dataState.terrainList,
    );
  }

  Widget _structureNameController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 2,
      label: AppString.structureName,
      hintText: AppString.structureName,
      controller: dataState.structureNameController,
    );
  }

  Widget _chainageController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainage,
      hintText: AppString.chainage,
      controller: dataState.chainageController,
    );
  }

  Widget _boundaryLocationController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.boundaryLocation,
      hintText: AppString.boundaryLocation,
      controller: dataState.locationBoundaryController,
    );
  }

  Widget _distanceController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.distance,
      hintText: AppString.distance,
      controller: dataState.distanceController,
    );
  }

  Widget _activityRemark({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarkController,
    );
  }

  Widget _button() {
    return  ButtonWidget(text: "Submit",
        onPressed: () {
          //    BlocProvider.of<AddClearingGradingBloc>(context).add(AddClearingGradingSubmitDataEvent(context: context));
        }
    );
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

}

