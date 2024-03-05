import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/image_pop_widget.dart';
import 'package:bsppl/Utils/common_widget/img_layout.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/domain/bloc/trenching_bloc.dart';
import 'package:bsppl/features/Trenching/domain/bloc/trenching_event.dart';
import 'package:bsppl/features/Trenching/domain/bloc/trenching_state.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/presentation/widget/card_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrenchingPage extends StatefulWidget {
  const TrenchingPage({Key? key}) : super(key: key);

  @override
  State<TrenchingPage> createState() => _TrenchingPageState();
}

class _TrenchingPageState extends State<TrenchingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<TrenchingBloc>(context).add(TrenchingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<TrenchingBloc, TrenchingState>(
        builder: (context, state) {
      if(state is TrenchingFetchDataState) {
        return _itemBuilder(dataState: state);
      } else{
        return const Center(child: CenterLoaderWidget(),);
      }
    },)
    );
  }

  Widget _itemBuilder({required TrenchingFetchDataState dataState}){
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
            _trenchDepthController(dataState: dataState),
            _verticalSpace(),
            _trenchWidthController(dataState: dataState),
            _verticalSpace(),
            _terrainController(dataState: dataState),
            _verticalSpace(),
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _activityRemark(dataState: dataState),
            _verticalSpace(),
            _photo(dataState: dataState),
            _verticalSpace(),
            _verticalSpace(),
            _button(dataState: dataState),
          ],
        ),
      ),
    );
  }

  Widget _dateController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<TrenchingBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
        controller: dataState.reportNumberController,
    );
  }


  Widget _alignmentDropdown({required TrenchingFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      star: AppString.star,
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      hint: AppString.selectAlignment,
      label: AppString.selectAlignment,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }


  Widget _jointFromCard({required TrenchingFetchDataState dataState}){
    return CardWidget(
      children: [
        Text("*  Joint From",
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

  Widget _jointToCard({required TrenchingFetchDataState dataState}){
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

  Widget _kmFromController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      //   controller: dataState.gpsCoordinateNorthController,
    );
  }

  Widget _jointTypeFromDropDown({required TrenchingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      star: AppString.star,
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeFromValue?.name != null ? dataState.jointTypeFromValue : null,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointTypeFromEvent(jointTypeFromValue: value));
      },
      items:dataState.jointTypeFromList,
    );
  }

  Widget _jointNoFromController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoFromController,
    );
  }

  Widget _suffixFromController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixFromController,
    );
  }

  Widget _kmToController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
    );
  }

  Widget _jointTypeToDropDown({required TrenchingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      star: AppString.star,
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeToValue?.name != null ? dataState.jointTypeToValue : null,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointTypeToEvent(jointTypeToValue: value));
      },
      items:dataState.jointTypeToList,
    );
  }

  Widget _jointNoToController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
         controller: dataState.jointNoToController,
    );
  }

  Widget _suffixToController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
         controller: dataState.suffixToController,
    );
  }

  Widget _chainageFromController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
       controller: dataState.chainageFromController,
      onChanged: (val){
        BlocProvider.of<TrenchingBloc>(context).add(SelectSectionLengthEvent());
      },
    );
  }

  Widget _chainageToController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
         controller: dataState.chainageToController,
      onChanged: (val){
        BlocProvider.of<TrenchingBloc>(context).add(SelectSectionLengthEvent());
      },
    );
  }

  Widget _sectionLengthController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
          controller: dataState.sectionLengthController,
    );
  }

  Widget _trenchDepthController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.trenchingDepth,
      hintText: AppString.trenchingDepth,
          controller: dataState.trenchingDepthController,
    );
  }

  Widget _trenchWidthController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.trenchWidth,
      hintText: AppString.trenchWidth,
         controller: dataState.trenchWidthController,
    );
  }

  Widget _terrainController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.terrain,
      hintText: AppString.terrain,
          controller: dataState.terrainController,
    );
  }

  Widget _weatherDropDown({required TrenchingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      label: AppString.selectWeather,
      hint: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _activityRemark({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
       controller: dataState.activityRemarkController,
    );
  }

  Widget _photo({required TrenchingFetchDataState dataState}) {
    return ImgLayoutWidget(
      file: dataState.photo,
      onTapCamera: () async {
        Navigator.of(context).pop();
        BlocProvider.of<TrenchingBloc>(context).add(SelectCameraCaptureEvent());
      },
      onTapGallery: () async {
        Navigator.of(context).pop();
        BlocProvider.of<TrenchingBloc>(context).add(SelectCameraCaptureEvent());
      },
    );
  }

  Widget _button({required TrenchingFetchDataState dataState}) {
    return dataState.isLoader == false ? ButtonWidget(
        text: AppString.submit,
        onPressed: () {
              BlocProvider.of<TrenchingBloc>(context).add(TrenchingSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
