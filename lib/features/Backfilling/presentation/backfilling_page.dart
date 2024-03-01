import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Backfilling/domain/bloc/backfilling_bloc.dart';
import 'package:bsppl/features/Backfilling/domain/bloc/backfilling_event.dart';
import 'package:bsppl/features/Backfilling/domain/bloc/backfilling_state.dart';
import 'package:bsppl/features/Backfilling/domain/model/plastic_grating_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackfillingPage extends StatefulWidget {
  const BackfillingPage({Key? key}) : super(key: key);

  @override
  State<BackfillingPage> createState() => _BackfillingPageState();
}

class _BackfillingPageState extends State<BackfillingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BackfillingBloc>(context).add(BackfillingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<BackfillingBloc, BackfillingState>(
          builder: (context, state) {
            if(state is BackfillingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required BackfillingFetchDataState dataState}){
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
            _alignmentDropdown(dataState: dataState),
            _verticalSpace(),
            _jointFromCard(dataState: dataState),
            _verticalSpace(),
            _jointToCard(dataState: dataState),
            _verticalSpace(),
            _chainageFromController(dataState: dataState),
            _verticalSpace(),
            _chainageToController(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _postPoddingController(dataState: dataState),
            _verticalSpace(),
            _slopeBreakerController(dataState: dataState),
            _verticalSpace(),
            _antiBuoancyController(dataState: dataState),
            _verticalSpace(),
            _warningMaterialController(dataState: dataState),
            _verticalSpace(),
            _plasticGratingDropDown(dataState: dataState),
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

  Widget _dateController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.date,
      label: AppString.date,
      enabled: true,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<BackfillingBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.reportNumber,
      label: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }
  Widget _weatherDropDown({required BackfillingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<BackfillingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _alignmentDropdown({required BackfillingFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      hint: AppString.selectAlignment,
      label: AppString.selectAlignment,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<BackfillingBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }


  Widget _jointFromCard({required BackfillingFetchDataState dataState}){
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

  Widget _jointToCard({required BackfillingFetchDataState dataState}){
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

  Widget _kmFromController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.km,
      label: AppString.km,
      keyboardType: TextInputType.number,
      //   controller: dataState.gpsCoordinateNorthController,
    );
  }

  Widget _jointTypeFromDropDown({required BackfillingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeFromValue?.name != null ? dataState.jointTypeFromValue : null,
      onChanged: (value) {
        BlocProvider.of<BackfillingBloc>(context).add(
            SelectJointTypeFromEvent(jointTypeFromValue: value));
      },
      items:dataState.jointTypeFromList,
    );
  }

  Widget _jointNoFromController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.jointNo,
      label: AppString.jointNo,
      controller: dataState.jointNoFromController,
    );
  }

  Widget _suffixFromController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.suffix,
      label: AppString.suffix,
      controller: dataState.suffixFromController,
    );
  }

  Widget _kmToController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
    );
  }

  Widget _jointTypeToDropDown({required BackfillingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeToValue?.name != null ? dataState.jointTypeToValue : null,
      onChanged: (value) {
        BlocProvider.of<BackfillingBloc>(context).add(
            SelectJointTypeToEvent(jointTypeToValue: value));
      },
      items:dataState.jointTypeToList,
    );
  }

  Widget _jointNoToController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoToController,
    );
  }

  Widget _suffixToController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixToController,
    );
  }

  Widget _chainageFromController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
    );
  }

  Widget _sectionLengthController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.sectionLength,
      label: AppString.sectionLength,
      controller: dataState.sectionLengthController,
    );
  }

  Widget _postPoddingController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.postPadding,
      label: AppString.postPadding,
      controller: dataState.postPoddingController,
    );
  }

  Widget _slopeBreakerController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.slopBreaker,
      label: AppString.slopBreaker,
      controller: dataState.slopeBreakerController,
    );
  }

  Widget _antiBuoancyController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.antiBuoancy,
      hintText: AppString.antiBuoancy,
      controller: dataState.antiBuoancyController,
    );
  }

  Widget _warningMaterialController({required BackfillingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.warningMaterial,
      label: AppString.warningMaterial,
      controller: dataState.warningMaterialController,
    );
  }
  Widget _plasticGratingDropDown({required BackfillingFetchDataState dataState}) {
    return DropdownWidget<PlasticGratingModel>(
      hint: AppString.selectPlasticGrating,
      dropdownValue: dataState.plasticGratingValue?.name != null ? dataState.plasticGratingValue : null,
      onChanged: (value) {
        BlocProvider.of<BackfillingBloc>(context).add(
            SelectPlasticGratingEvent(plasticGratinValue: value));
      },
      items:dataState.plasticGratingList,
    );
  }


  Widget _activityRemark({required BackfillingFetchDataState dataState}) {
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

