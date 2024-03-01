import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/HydroTesting/domain/bloc/hydro_test_bloc.dart';
import 'package:bsppl/features/HydroTesting/domain/bloc/hydro_test_event.dart';
import 'package:bsppl/features/HydroTesting/domain/bloc/hydro_test_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HydroTextingPage extends StatefulWidget {
  const HydroTextingPage({Key? key}) : super(key: key);

  @override
  State<HydroTextingPage> createState() => _HydroTextingPageState();
}

class _HydroTextingPageState extends State<HydroTextingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HydroTestBloc>(context).add(HydroTestPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<HydroTestBloc, HydroTestState>(
          builder: (context, state) {
            if(state is HydroTestFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required HydroTestFetchDataState dataState}){
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
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _jointFromCard(dataState: dataState),
            _verticalSpace(),
            _jointToCard(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
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

  Widget _dateController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<HydroTestBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }


  Widget _weatherDropDown({required HydroTestFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      label: AppString.selectWeather,
      hint: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<HydroTestBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }



  Widget _jointFromCard({required HydroTestFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Joint From",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        _verticalSpace(),
        _kmFromController(dataState: dataState),
        _verticalSpace(),
        _jointTypeFromDropDown(dataState: dataState),
        _verticalSpace(),
        _jointNoFromController(dataState: dataState),
        _verticalSpace(),
        _suffixFromController(dataState: dataState),
      ],
    );
  }

  Widget _jointToCard({required HydroTestFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Joint To",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        _verticalSpace(),
        _kmToController(dataState: dataState),
        _verticalSpace(),
        _jointTypeToDropDown(dataState: dataState),
        _verticalSpace(),
        _jointNoToController(dataState: dataState),
        _verticalSpace(),
        _suffixToController(dataState: dataState),
      ],
    );
  }

  Widget _kmFromController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      //   controller: dataState.gpsCoordinateNorthController,
    );
  }

  Widget _jointTypeFromDropDown({required HydroTestFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeFromValue?.name != null ? dataState.jointTypeFromValue : null,
      onChanged: (value) {
        BlocProvider.of<HydroTestBloc>(context).add(
            SelectJointTypeFromEvent(jointTypeFromValue: value));
      },
      items:dataState.jointTypeFromList,
    );
  }

  Widget _jointNoFromController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.jointNo,
      label: AppString.jointNo,
      controller: dataState.jointNoFromController,
    );
  }

  Widget _suffixFromController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixFromController,
    );
  }

  Widget _kmToController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
    );
  }

  Widget _jointTypeToDropDown({required HydroTestFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeToValue?.name != null ? dataState.jointTypeToValue : null,
      onChanged: (value) {
        BlocProvider.of<HydroTestBloc>(context).add(
            SelectJointTypeToEvent(jointTypeToValue: value));
      },
      items:dataState.jointTypeToList,
    );
  }

  Widget _jointNoToController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoToController,
    );
  }

  Widget _suffixToController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixToController,
    );
  }

 

  Widget _sectionLengthController({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      controller: dataState.sectionLengthController,
    );
  }


  Widget _activityRemark({required HydroTestFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarkController,
    );
  }
  Widget _button() {
    return ButtonWidget(text: AppString.submit,
        onPressed: () {
          //    BlocProvider.of<AddLevellingBloc>(context).add(AddLevellingSubmitDataEvent(context: context));
        }
    );
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}

