import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/HDPE%20Duct/domain/bloc/hdpe_duct_bloc.dart';
import 'package:bsppl/features/HDPE%20Duct/domain/bloc/hdpe_duct_event.dart';
import 'package:bsppl/features/HDPE%20Duct/domain/bloc/hdpe_duct_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/presentation/widget/check_box_widget.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HdpeDuctPage extends StatefulWidget {
  const HdpeDuctPage({Key? key}) : super(key: key);

  @override
  State<HdpeDuctPage> createState() => _HdpeDuctPageState();
}

class _HdpeDuctPageState extends State<HdpeDuctPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HdpeDuctBloc>(context).add(HdpeDuctPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<HdpeDuctBloc, HdpeDuctState>(
          builder: (context, state) {
            if(state is HdpeDuctFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required HdpeDuctFetchDataState dataState}){
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
            _chainageFromController(dataState: dataState),
            _verticalSpace(),
            _chainageToController(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _ductLengthFromController(dataState: dataState),
            _verticalSpace(),
            _ductLengthToController(dataState: dataState),
            _verticalSpace(),
            _paddingCheckBox(dataState: dataState),
            _verticalSpace(),
            _warningCheckBox(dataState: dataState),
            _verticalSpace(),
            _couplerController(dataState: dataState),
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

  Widget _dateController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<HdpeDuctBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }


  Widget _weatherDropDown({required HdpeDuctFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<HdpeDuctBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }



  Widget _jointFromCard({required HdpeDuctFetchDataState dataState}){
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

  Widget _jointToCard({required HdpeDuctFetchDataState dataState}){
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

  Widget _kmFromController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      //   controller: dataState.gpsCoordinateNorthController,
    );
  }

  Widget _jointTypeFromDropDown({required HdpeDuctFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeFromValue?.name != null ? dataState.jointTypeFromValue : null,
      onChanged: (value) {
        BlocProvider.of<HdpeDuctBloc>(context).add(
            SelectJointTypeFromEvent(jointTypeFromValue: value));
      },
      items:dataState.jointTypeFromList,
    );
  }

  Widget _jointNoFromController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoFromController,
    );
  }

  Widget _suffixFromController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixFromController,
    );
  }

  Widget _kmToController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
    );
  }

  Widget _jointTypeToDropDown({required HdpeDuctFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeToValue?.name != null ? dataState.jointTypeToValue : null,
      onChanged: (value) {
        BlocProvider.of<HdpeDuctBloc>(context).add(
            SelectJointTypeToEvent(jointTypeToValue: value));
      },
      items:dataState.jointTypeToList,
    );
  }

  Widget _jointNoToController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoToController,
    );
  }

  Widget _suffixToController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixToController,
    );
  }

  Widget _chainageFromController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
    );
  }


  Widget _sectionLengthController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      controller: dataState.sectionLengthController,
    );
  }


  Widget _ductLengthFromController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.ductLengthFrom,
      hintText: AppString.ductLengthFrom,
      controller: dataState.ductLengthFromController,
    );
  }

  Widget _ductLengthToController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.ductLengthTo,
      hintText: AppString.ductLengthTo,
      controller: dataState.ductLengthToController,
    );
  }

  Widget _paddingCheckBox({required HdpeDuctFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Padding",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        Row(
          children: [
            Flexible(
                flex : 3,
                child: CheckBoxWidget(
                  label:AppString.ok,
                  selectedValue: dataState.okPadding,
                  onChanged: (value) {
                   BlocProvider.of<HdpeDuctBloc>(context).add( SelectPaddingEvent(okPadding: true, notOkPadding: false));
                  },
                )
            ),
            Flexible(
                flex : 3,
                child: CheckBoxWidget(
                  label: AppString.notOk,
                  selectedValue: dataState.okNotPadding,
                  onChanged: (value) {
                    BlocProvider.of<HdpeDuctBloc>(context).add(SelectPaddingEvent(okPadding: false, notOkPadding: true));
                  },)),
          ],
        )
      ],);
  }

  Widget _warningCheckBox({required HdpeDuctFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Warning Mat",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        Row(
          children: [
            Flexible(
                flex : 6,
                child:
                CheckBoxWidget(
                  label:AppString.ok,
                  selectedValue: dataState.okWarningMat,
                  onChanged: ( value) {
                    BlocProvider.of<HdpeDuctBloc>(context).add(SelectWarningMatEvent(okWarningMat: true, notOkWarningMat: false));
                  },
                )
            ),
            Flexible(
                flex : 6,
                child: CheckBoxWidget(
                  label: AppString.notOk,
                  selectedValue: dataState.notOkWarningMat,
                  onChanged: ( value) {
                   BlocProvider.of<HdpeDuctBloc>(context).add( SelectWarningMatEvent(okWarningMat: false, notOkWarningMat: true));
                  },)),
          ],
        )
      ],
    );

  }

  Widget _couplerController({required HdpeDuctFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.coupler,
      label: AppString.coupler,
      controller: dataState.couplerController,
    );
  }


  Widget _activityRemark({required HdpeDuctFetchDataState dataState}) {
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

