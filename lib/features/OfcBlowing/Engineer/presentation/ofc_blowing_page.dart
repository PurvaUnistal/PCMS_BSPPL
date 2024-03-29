import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/OfcBlowing/Engineer/domain/bloc/ofc_blowing_bloc.dart';
import 'package:bsppl/features/OfcBlowing/Engineer/domain/bloc/ofc_blowing_event.dart';
import 'package:bsppl/features/OfcBlowing/Engineer/domain/bloc/ofc_blowing_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/Engineer/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfcBlowingPage extends StatefulWidget {
  const OfcBlowingPage({Key? key}) : super(key: key);

  @override
  State<OfcBlowingPage> createState() => _OfcBlowingPageState();
}

class _OfcBlowingPageState extends State<OfcBlowingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<OfcBlowingBloc>(context).add(OfcBlowingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<OfcBlowingBloc, OfcBlowingState>(
          builder: (context, state) {
            if(state is OfcBlowingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required OfcBlowingFetchDataState dataState}){
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
            _drumNumberController(dataState: dataState),
            _verticalSpace(),
            _drumLengthController(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _sequentialMakerController(dataState: dataState),
            _verticalSpace(),
            _jointFromCard(dataState: dataState),
            _verticalSpace(),
            _jointToCard(dataState: dataState),
            _verticalSpace(),
            _pitCableLengthController(dataState: dataState),
            _verticalSpace(),
            _noLocPitController(dataState: dataState),
            _verticalSpace(),
            _loopAtPitController(dataState: dataState),
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

  Widget _dateController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<OfcBlowingBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }

  Widget _weatherDropDown({required OfcBlowingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      label: AppString.selectWeather,
      hint: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<OfcBlowingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _drumNumberController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.drumNo,
      hintText: AppString.drumNo,
      controller: dataState.drumNumberController,
    );
  }

  Widget _drumLengthController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.drumLength,
      hintText: AppString.drumLength,
      controller: dataState.drumLengthController,
    );
  }

  Widget _sectionLengthController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      controller: dataState.sectionLengthController,
    );
  }

  Widget _sequentialMakerController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.sequentialMaker,
      hintText: AppString.sequentialMaker,
      controller: dataState.sequentialMakerController,
    );
  }
  
  Widget _jointFromCard({required OfcBlowingFetchDataState dataState}){
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

  Widget _jointToCard({required OfcBlowingFetchDataState dataState}){
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

  Widget _kmFromController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      //   controller: dataState.gpsCoordinateNorthController,
    );
  }

  Widget _jointTypeFromDropDown({required OfcBlowingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeFromValue?.name != null ? dataState.jointTypeFromValue : null,
      onChanged: (value) {
        BlocProvider.of<OfcBlowingBloc>(context).add(
            SelectJointTypeFromEvent(jointTypeFromValue: value));
      },
      items:dataState.jointTypeFromList,
    );
  }

  Widget _jointNoFromController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoFromController,
    );
  }

  Widget _suffixFromController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixFromController,
    );
  }

  Widget _kmToController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
    );
  }

  Widget _jointTypeToDropDown({required OfcBlowingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeToValue?.name != null ? dataState.jointTypeToValue : null,
      onChanged: (value) {
        BlocProvider.of<OfcBlowingBloc>(context).add(
            SelectJointTypeToEvent(jointTypeToValue: value));
      },
      items:dataState.jointTypeToList,
    );
  }

  Widget _jointNoToController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.jointNo,
      label: AppString.jointNo,
      controller: dataState.jointNoToController,
    );
  }

  Widget _suffixToController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixToController,
    );
  }



  Widget _pitCableLengthController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.pitCableLength,
      label: AppString.pitCableLength,
      controller: dataState.pitCableLengthController,
    );
  }

  Widget _noLocPitController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.noLocBlowingPit,
      hintText: AppString.noLocBlowingPit,
      controller: dataState.noLocPitController,
    );
  }

  Widget _loopAtPitController({required OfcBlowingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.loopAtPit,
      hintText: AppString.loopAtPit,
      controller: dataState.loopAtPitController,
    );
  } 
  Widget _activityRemark({required OfcBlowingFetchDataState dataState}) {
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

