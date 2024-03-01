import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Levelling/domain/bloc/levelling_bloc.dart';
import 'package:bsppl/features/Levelling/domain/bloc/levelling_event.dart';
import 'package:bsppl/features/Levelling/domain/bloc/levelling_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevellingPage extends StatefulWidget {
  const LevellingPage({Key? key}) : super(key: key);

  @override
  State<LevellingPage> createState() => _LevellingPageState();
}

class _LevellingPageState extends State<LevellingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<LevellingBloc>(context).add(LevellingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<LevellingBloc, LevellingState>(
          builder: (context, state) {
            if(state is LevellingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required LevellingFetchDataState dataState}){
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
            _jointNoCard(dataState: dataState),
            _verticalSpace(),
            _eastingController(dataState: dataState),
            _verticalSpace(),
            _northingController(dataState: dataState),
            _verticalSpace(),
            _pipeTopController(dataState: dataState),
            _verticalSpace(),
            _nglController(dataState: dataState),
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

  Widget _dateController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<LevellingBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }


  Widget _weatherDropDown({required LevellingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<LevellingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _jointNoCard({required LevellingFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Joint Number",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        _verticalSpace(),
        _kmController(dataState: dataState),
        _verticalSpace(),
        _jointTypeDropDown(dataState: dataState),
        _verticalSpace(),
        _jointNoController(dataState: dataState),
        _verticalSpace(),
        _suffixController(dataState: dataState),
        _verticalSpace(),
        _coverController(dataState: dataState),
      ],
    );
  }

  Widget _kmController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
         controller: dataState.kmController,
    );
  }

  Widget _jointTypeDropDown({required LevellingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeValue?.name != null ? dataState.jointTypeValue : null,
      onChanged: (value) {
        BlocProvider.of<LevellingBloc>(context).add(
            SelectJointTypeEvent(jointTypeValue: value));
      },
      items:dataState.jointTypeList,
    );
  }

  Widget _jointNoController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoController,
    );
  }

  Widget _suffixController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixController,
    );
  }

  Widget _coverController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.cover,
      hintText: AppString.cover,
      controller: dataState.coverController,
    );
  }


  Widget _eastingController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.lat,
      hintText: AppString.lat,
      controller: dataState.eastingController,
    );
  }

  Widget _northingController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.long,
      hintText: AppString.long,
      controller: dataState.northingController,
    );
  }

  Widget _pipeTopController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.pipeline,
      label: AppString.pipeline,
      controller: dataState.pipeTopController,
    );
  }

  Widget _nglController({required LevellingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.naturalGroundLeve,
      hintText: AppString.naturalGroundLeve,
      controller: dataState.nglController,
    );
  }



  Widget _activityRemark({required LevellingFetchDataState dataState}) {
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

