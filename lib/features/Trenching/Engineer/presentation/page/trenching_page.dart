import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/image_pop_widget.dart';
import 'package:bsppl/Utils/common_widget/local_img.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/bloc/trenching_bloc.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/bloc/trenching_event.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/bloc/trenching_state.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/Engineer/presentation/widget/RowWidget.dart';
import 'package:bsppl/features/Trenching/Engineer/presentation/widget/card_widget.dart';
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
            _trenchDepthController(dataState: dataState),
            _verticalSpace(),
            _trenchTopWidthController(dataState: dataState),
            _verticalSpace(),
            _trenchBottomWidthController(dataState: dataState),
            _verticalSpace(),
            _terrainController(dataState: dataState),
            _verticalSpace(),
            _sectionNoController(dataState: dataState),
            _verticalSpace(),
            _kmDELA_FROMController(dataState: dataState),
            _verticalSpace(),
            _kmPANA_LA_TOController(dataState: dataState),
            _verticalSpace(),
            _dailyProgressController(dataState: dataState),
            _verticalSpace(),
            _methodOfTrenchingController(dataState: dataState),
            _verticalSpace(),
            _beddingAcceptedController(dataState: dataState),
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
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
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
        RowWidget(title: "Joint From${dataState.jointFrom == "" ?"":"(${dataState.jointFrom})"}"),
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
        RowWidget(title: "Joint To${dataState.jointTo == "" ?"":"(${dataState.jointTo})"}"),
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
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
         controller: dataState.kmFromController,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointFromEvent());
      },
    );
  }

  Widget _jointTypeFromDropDown({required TrenchingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
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
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoFromController,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointFromEvent());
      },
    );
  }

  Widget _suffixFromController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixFromController,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointFromEvent());
      },
    );
  }

  Widget _kmToController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointToEvent());
      },
    );
  }

  Widget _jointTypeToDropDown({required TrenchingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
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
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
         controller: dataState.jointNoToController,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointToEvent());
      },
    );
  }

  Widget _suffixToController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
         controller: dataState.suffixToController,
      onChanged: (value) {
        BlocProvider.of<TrenchingBloc>(context).add(
            SelectJointToEvent());
      },
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
      keyboardType: TextInputType.number,
      label: AppString.trenchingDepth,
      hintText: AppString.trenchingDepth,
          controller: dataState.trenchingDepthController,
    );
  }

  Widget _trenchTopWidthController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.trenchTopWidth,
      hintText: AppString.trenchTopWidth,
         controller: dataState.trenchTopWidthController,
    );
  }
  Widget _trenchBottomWidthController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.trenchBottomWidth,
      hintText: AppString.trenchBottomWidth,
      controller: dataState.trenchBottomWidthController,
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

  Widget _sectionNoController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.sectionNo,
      hintText: AppString.sectionNo,
      controller: dataState.sectionNoController,
    );
  }
  Widget _kmDELA_FROMController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.kmDELA_FROM,
      hintText: AppString.kmDELA_FROM,
      controller: dataState.kmDELA_FROMController,
    );
  }

  Widget _kmPANA_LA_TOController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.kmPANA_LA_TO,
      hintText: AppString.kmPANA_LA_TO,
      controller: dataState.kmPANA_LA_TOController,
    );
  }

  Widget _dailyProgressController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.dailyProgress,
      hintText: AppString.dailyProgress,
      controller: dataState.dailyProgressController,
    );
  }

  Widget _methodOfTrenchingController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.methodOfTrenching,
      hintText: AppString.methodOfTrenching,
      controller: dataState.methodOfTrenchingController,
    );
  }

  Widget _beddingAcceptedController({required TrenchingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.beddingAccepted,
      hintText: AppString.beddingAccepted,
      controller: dataState.beddingAcceptedController,
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
    return LocalImgWidget(
      file: dataState.photo,
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return  ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<TrenchingBloc>(context).add(SelectCameraCaptureEvent());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<TrenchingBloc>(context).add(SelectGalleryCaptureEvent());
            },
          );
        });
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
