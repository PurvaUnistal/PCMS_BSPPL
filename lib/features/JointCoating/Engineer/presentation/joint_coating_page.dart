import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/JointCoating/Engineer/domain/bloc/joint_bloc.dart';
import 'package:bsppl/features/JointCoating/Engineer/domain/bloc/joint_event.dart';
import 'package:bsppl/features/JointCoating/Engineer/domain/bloc/joint_state.dart';
import 'package:bsppl/features/Stringing/Engineer/presentation/widget/check_box_widget.dart';
import 'package:bsppl/features/Trenching/Engineer/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JointCoatingPage extends StatefulWidget {
  const JointCoatingPage({Key? key}) : super(key: key);

  @override
  State<JointCoatingPage> createState() => _JointCoatingPageState();
}

class _JointCoatingPageState extends State<JointCoatingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<JointCoatingBloc>(context).add(JointCoatingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<JointCoatingBloc, JointCoatingState>(
          builder: (context, state) {
            if(state is JointCoatingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },
        )
    );
  }

  Widget _itemBuilder({required JointCoatingFetchDataState dataState}){
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
            _kmController(dataState: dataState),
            _verticalSpace(),
            _jointTypeDropDown(dataState: dataState),
            _verticalSpace(),
            _jointNoController(dataState: dataState),
            _verticalSpace(),
            _suffixController(dataState: dataState),
            _verticalSpace(),
            _visualCheckBox(dataState: dataState),
            _verticalSpace(),
            _holidayTestCheckBox(dataState: dataState),
            _verticalSpace(),
            _pipeDiameterController(dataState: dataState),
            _verticalSpace(),
            _pipeThicknessController(dataState: dataState),
            _verticalSpace(),
            _batchNoController(dataState: dataState),
            _verticalSpace(),
            _roughnessController(dataState: dataState),
            _verticalSpace(),
            _dustContainmentController(dataState: dataState),
            _verticalSpace(),
            _primerAController(dataState: dataState),
            _verticalSpace(),
            _primerBController(dataState: dataState),
            _verticalSpace(),
            _relativeHumidityController(dataState: dataState),
            _verticalSpace(),
            _coatingTypeController(dataState: dataState),
            _verticalSpace(),
            _sleeveOptionController(dataState: dataState),
            _verticalSpace(),
            _onBodyController(dataState: dataState),
            _verticalSpace(),
            _onSeamController(dataState: dataState),
            _verticalSpace(),
            _pipeCoatingController(dataState: dataState),
            _verticalSpace(),
            _weldTempController(dataState: dataState),
            _verticalSpace(),
            _activityRemark(dataState: dataState),
            _verticalSpace(),
            _verticalSpace(),
            _bJointCoatington(),
          ],
        ),
      ),
    );
  }

  Widget _dateController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
      onTap: () {
        BlocProvider.of<JointCoatingBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.reportNumber,
      label: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }


  Widget _weatherDropDown<WeatherModel>({required JointCoatingFetchDataState dataState}) {
    return DropdownWidget(
      hint: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<JointCoatingBloc>(context).add(SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }
  Widget _kmController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmController,
    );
  }

  Widget _jointTypeDropDown({required JointCoatingFetchDataState dataState}) {
    return DropdownWidget(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeValue?.name != null ? dataState.jointTypeValue : null,
      onChanged: (value) {
        BlocProvider.of<JointCoatingBloc>(context).add(SelectJointTypeEvent(jointTypeValue: value));
      },
      items:dataState.jointTypeList,
    );
  }
  Widget _jointNoController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.reportNumberController,
    );
  }

  Widget _suffixController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixController,
    );
  }


  Widget _visualCheckBox({required JointCoatingFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Visual",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        Row(
          children: [
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.accept,
                selectedValue: dataState.isAcceptVisualValue,
                onChanged: (value){
                  BlocProvider.of<JointCoatingBloc>(context)
                      .add(SelectVisualEvent(isAcceptVisualValue: true, isRejectVisualValue: false)
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.reject,
                selectedValue: dataState.isRejectVisualValue,
                onChanged: (value){
                  BlocProvider.of<JointCoatingBloc>(context)
                      .add(SelectVisualEvent(isAcceptVisualValue: false, isRejectVisualValue: true)
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _holidayTestCheckBox({required JointCoatingFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Holiday Test",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColor.appBlueColor
          ),),
        Row(
          children: [
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.accept,
                selectedValue: dataState.isAcceptHolidayTestValue,
                onChanged: (value){
                  BlocProvider.of<JointCoatingBloc>(context)
                      .add(SelectHolidayTestEvent(isAcceptHolidayTestValue: true, isRejectHolidayTestValue: false)
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.reject,
                selectedValue: dataState.isRejectHolidayTestValue,
                onChanged: (value){
                  BlocProvider.of<JointCoatingBloc>(context)
                      .add(SelectHolidayTestEvent(isAcceptHolidayTestValue: false, isRejectHolidayTestValue: true)
                  );
                },
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget _pipeDiameterController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.pipeDiameter,
      hintText: AppString.pipeDiameter,
      controller: dataState.pipeDiameterController,
    );
  }

  Widget _pipeThicknessController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.pipeThick,
      hintText: AppString.pipeThick,
      controller: dataState.pipeThicknessController,
    );
  }

  Widget _batchNoController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.batchNo,
      hintText: AppString.batchNo,
      controller: dataState.batchNoController,
    );
  }

  Widget _roughnessController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.roughness,
      hintText: AppString.roughness,
      controller: dataState.roughnessController,
    );
  }

  Widget _dustContainmentController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.dustContainment,
      hintText: AppString.dustContainment,
      controller: dataState.dustContainmentController,
    );
  }

  Widget _primerAController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.primerA,
      hintText: AppString.primerA,
      controller: dataState.primerAController,
    );
  }

  Widget _primerBController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.primerB,
      hintText: AppString.primerB,
      controller: dataState.primerBController,
    );
  }

  Widget _relativeHumidityController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.relativeHumidity,
      label: AppString.relativeHumidity,
      controller: dataState.relativeHumidityController,
    );
  }

  Widget _coatingTypeController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.coatingType,
      label: AppString.coatingType,
      controller: dataState.coatingTypeController,
    );
  }

  Widget _sleeveOptionController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.sleeveOption,
      hintText: AppString.sleeveOption,
      controller: dataState.sleeveOptionController,
    );
  }

  Widget _onBodyController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.onBody,
      hintText: AppString.onBody,
      controller: dataState.onBodyController,
    );
  }

  Widget _onSeamController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.onSeam,
      hintText: AppString.onSeam,
      controller: dataState.onSeamController,
    );
  }

  Widget _pipeCoatingController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.pipeCoating,
      label: AppString.pipeCoating,
      controller: dataState.pipeCoatingController,
    );
  }

  Widget _weldTempController({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.jointCoatingThickness,
      hintText: AppString.jointCoatingThickness,
      controller: dataState.weldTempController,
    );
  }




  Widget _activityRemark({required JointCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.remarkController,
    );
  }

  Widget _bJointCoatington() {
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

