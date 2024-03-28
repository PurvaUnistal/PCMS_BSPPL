import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Radiography/domain/bloc/radiography_bloc.dart';
import 'package:bsppl/features/Radiography/domain/bloc/radiography_event.dart';
import 'package:bsppl/features/Radiography/domain/bloc/radiography_state.dart';
import 'package:bsppl/features/Stringing/presentation/widget/check_box_widget.dart';
import 'package:bsppl/features/Trenching/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadiographyPage extends StatefulWidget {
  const RadiographyPage({Key? key}) : super(key: key);

  @override
  State<RadiographyPage> createState() => _RadiographyPageState();
}

class _RadiographyPageState extends State<RadiographyPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<RadioGraphyBloc>(context).add(RadiographyPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RadioGraphyBloc, RadiographyState>(
        builder: (context, state) {
      if(state is RadiographyFetchDataState) {
        return _itemBuilder(dataState: state);
      } else{
        return const Center(child: CenterLoaderWidget(),);
      }
    },
        )
    );
  }

  Widget _itemBuilder({required RadiographyFetchDataState dataState}){
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
            _segment1(dataState: dataState),
            _verticalSpace(),
            _segment2(dataState: dataState),
            _verticalSpace(),
            _segment3(dataState: dataState),
            _verticalSpace(),
            _segment4(dataState: dataState),
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

  Widget _dateController({required RadiographyFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      hintText: AppString.date,
      label: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<RadioGraphyBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required RadiographyFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }


  Widget _weatherDropDown<WeatherModel>({required RadiographyFetchDataState dataState}) {
    return DropdownWidget(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<RadioGraphyBloc>(context).add(SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }
  Widget _kmController({required RadiographyFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.km,
      hintText: AppString.km,
        controller: dataState.kmController,
    );
  }

  Widget _jointTypeDropDown({required RadiographyFetchDataState dataState}) {
    return DropdownWidget(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeValue?.name != null ? dataState.jointTypeValue : null,
      onChanged: (value) {
        BlocProvider.of<RadioGraphyBloc>(context).add(SelectJointTypeEvent(jointTypeValue: value));
      },
      items:dataState.jointTypeList,
    );
  }
  Widget _jointNoController({required RadiographyFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.jointNo,
      hintText: AppString.jointNo,
       controller: dataState.reportNumberController,
    );
  }

  Widget _suffixController({required RadiographyFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.suffix,
      hintText: AppString.suffix,
        controller: dataState.suffixController,
    );
  }


  Widget _segment1({required RadiographyFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Segment 1",
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
                selectedValue: dataState.isAccept1Value,
                onChanged: (value){
                       BlocProvider.of<RadioGraphyBloc>(context)
                           .add(SelectSegment1Event(accept1Value: true, reject1Value: false)
                       );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.reject,
                selectedValue: dataState.isReject1Value,
                onChanged: (value){
                  BlocProvider.of<RadioGraphyBloc>(context)
                      .add(SelectSegment1Event(accept1Value: false, reject1Value: true)
                  );
                },
              ),
            ),
          ],
        ),
        TextFieldWidget(
          label: AppString.observation,
          hintText: AppString.observation,
            controller: dataState.observation1Controller,
        ),
      ],

    );
  }

  Widget _segment2({required RadiographyFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Segment 2",
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
                selectedValue: dataState.isAccept2Value,
                onChanged: (value){
                  BlocProvider.of<RadioGraphyBloc>(context)
                      .add(SelectSegment2Event(accept2Value: true, reject2Value: false)
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.reject,
                selectedValue: dataState.isReject2Value,
                onChanged: (value){
                  BlocProvider.of<RadioGraphyBloc>(context)
                      .add(SelectSegment2Event(accept2Value: false, reject2Value: true)
                  );
                },
              ),
            ),
          ],
        ),
        TextFieldWidget(
          label: AppString.observation,
          hintText: AppString.observation,
          controller: dataState.observation2Controller,
        ),
      ],
    );
  }
  Widget _segment3({required RadiographyFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Segment 3",
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
                selectedValue: dataState.isAccept3Value,
                onChanged: (value){
                  BlocProvider.of<RadioGraphyBloc>(context)
                      .add(SelectSegment3Event(accept3Value: true, reject3Value: false)
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.reject,
                  selectedValue: dataState.isReject3Value,
                  onChanged: (value){
                    BlocProvider.of<RadioGraphyBloc>(context)
                        .add(SelectSegment3Event(accept3Value: false, reject3Value: true)
                    );
                  },
              ),
            ),
          ],
        ),
        TextFieldWidget(
          label: AppString.observation,
          hintText: AppString.observation,
            controller: dataState.observation3Controller,
        ),
      ],
    );
  }
  Widget _segment4({required RadiographyFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("Segment 4",
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
                selectedValue: dataState.isAccept4Value,
                onChanged: (value){
                  BlocProvider.of<RadioGraphyBloc>(context)
                      .add(SelectSegment4Event(accept4Value: true, reject4Value: false)
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CheckBoxWidget(
                label: AppString.reject,
                selectedValue: dataState.isReject4Value,
                onChanged: (value){
                  BlocProvider.of<RadioGraphyBloc>(context)
                      .add(SelectSegment4Event(accept4Value: false, reject4Value: true)
                  );
                },
              ),
            ),
          ],
        ),
        TextFieldWidget(
          label: AppString.observation,
          hintText: AppString.observation,
            controller: dataState.observation4Controller,
        ),
      ],
    );}






  Widget _activityRemark({required RadiographyFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      hintText: AppString.activityRemark,
      label: AppString.activityRemark,
       controller: dataState.remarkController,
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

