import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/image_pop_widget.dart';
import 'package:bsppl/Utils/common_widget/local_img.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/AllCommonModel/check_model.dart';
import 'package:bsppl/features/AllCommonModel/completed_not_model.dart';
import 'package:bsppl/features/AllCommonModel/provide_not_model.dart';
import 'package:bsppl/features/Lower/Engineer/domain/bloc/lower_bloc.dart';
import 'package:bsppl/features/Lower/Engineer/domain/bloc/lower_event.dart';
import 'package:bsppl/features/Lower/Engineer/domain/bloc/lower_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Trenching/Engineer/presentation/widget/RowWidget.dart';
import 'package:bsppl/features/Trenching/Engineer/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LowerPage extends StatefulWidget {
  const LowerPage({Key? key}) : super(key: key);

  @override
  State<LowerPage> createState() => _LowerPageState();
}

class _LowerPageState extends State<LowerPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<LowerBloc>(context).add(LowerPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<LowerBloc, LowerState>(
          builder: (context, state) {
            if(state is LowerFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required LowerFetchDataState dataState}){
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
            _searchPipeController(dataState: dataState),
            _verticalSpace(),
            _pipeNoDropdown(dataState: dataState),
            _verticalSpace(),
            _chainageFromController(dataState: dataState),
            _verticalSpace(),
            _chainageToController(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _pipeDiameterController(dataState: dataState),
            _verticalSpace(),
            _pipeMeterialController(dataState: dataState),
            _verticalSpace(),
            _jointFromCard(dataState: dataState),
            _verticalSpace(),
            _jointToCard(dataState: dataState),
            _verticalSpace(),
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _locationController(dataState: dataState),
            _verticalSpace(),
            _holidayDetailsController(dataState: dataState),
            _verticalSpace(),
            _makeModelController(dataState: dataState),
            _verticalSpace(),
            _calibrationDoneController(dataState: dataState),
            _verticalSpace(),
            _repairDamagesController(dataState: dataState),
            _verticalSpace(),
            _paddingTypeDropDown(dataState: dataState),
            _verticalSpace(),
            _prePaddingTypeDropDown(dataState: dataState),
            _verticalSpace(),
            _deWateringTypeDropDown(dataState: dataState),
            _verticalSpace(),
            _kmDELA_FROMController(dataState: dataState),
            _verticalSpace(),
            _kmPANA_LA_TOController(dataState: dataState),
            _verticalSpace(),
            _dailyProgressController(dataState: dataState),
            _verticalSpace(),
            _sectionNoController(dataState: dataState),
            _verticalSpace(),
            _coatingRepairController(dataState: dataState),
            _verticalSpace(),
            _trenchAcceptanceController(dataState: dataState),
            _verticalSpace(),
            _visualInspController(dataState: dataState),
            _verticalSpace(),
            _photo(dataState: dataState),
            _verticalSpace(),
            _activityRemark(dataState: dataState),
            _verticalSpace(),
            _verticalSpace(),
            _button(dataState: dataState),
          ],
        ),
      ),
    );
  }

  Widget _dateController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<LowerBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }

  Widget _pipeDiameterController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.pipeDiameter,
      label: AppString.pipeDiameter,
      controller: dataState.pipeDiameterController,
    );
  }

  Widget _pipeMeterialController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.pipeMeterial,
      label: AppString.pipeMeterial,
      controller: dataState.pipeMeterialController,
    );
  }

  Widget _searchPipeController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      hintText: AppString.searchPipe,
      label: AppString.searchPipe,
      controller: dataState.pipePageController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectPipePagingEvent(context: context));
      },
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){},
      ),
    );
  }

  Widget _pipeNoDropdown({required LowerFetchDataState dataState}) {
    return DropdownWidget<String>(
      star: AppString.star,
      hint: AppString.pipeNo,
      label: AppString.pipeNo,
      dropdownValue: dataState.pipeNumberValue != null ? dataState.pipeNumberValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectPipeNoValueEvent( pipeNoValue: value));
      },
      items:dataState.pipeNumberList,
    );
  }

  Widget _alignmentDropdown({required LowerFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      hint: AppString.selectAlignment,
      label: AppString.selectAlignment,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }


  Widget _jointFromCard({required LowerFetchDataState dataState}){
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

  Widget _jointToCard({required LowerFetchDataState dataState}){
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

  Widget _kmFromController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.km,
      label: AppString.km,
      controller: dataState.kmFromController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointFromEvent());
      },
    );
  }

  Widget _jointTypeFromDropDown({required LowerFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      label: AppString.selectJointType,
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeFromValue?.name != null ? dataState.jointTypeFromValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointTypeFromEvent(jointTypeFromValue: value));
      },
      items:dataState.jointTypeFromList,
    );
  }

  Widget _jointNoFromController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoFromController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointFromEvent());
      },
    );
  }

  Widget _suffixFromController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixFromController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointFromEvent());
      },
    );
  }

  Widget _kmToController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.km,
      hintText: AppString.km,
      controller: dataState.kmToController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointToEvent());
      },
    );
  }

  Widget _jointTypeToDropDown({required LowerFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      label: AppString.selectJointType,
      dropdownValue: dataState.jointTypeToValue?.name != null ? dataState.jointTypeToValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointTypeToEvent(jointTypeToValue: value));
      },
      items:dataState.jointTypeToList,
    );
  }

  Widget _jointNoToController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      controller: dataState.jointNoToController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointToEvent());
      },

    );
  }

  Widget _suffixToController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.suffix,
      hintText: AppString.suffix,
      controller: dataState.suffixToController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectJointToEvent());
      },
    );
  }

  Widget _chainageFromController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectSectionLengthEvent());
      },
    );

  }

  Widget _chainageToController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectSectionLengthEvent());
      },
    );
  }

  Widget _sectionLengthController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      controller: dataState.sectionLengthController,
    );
  }

  Widget _locationController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.location,
      hintText: AppString.location,
      controller: dataState.locationController,
    );
  }

  Widget _holidayDetailsController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.holiday,
      hintText: AppString.holiday,
      controller: dataState.holidayDetailsController,
    );
  }

  Widget _makeModelController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.makeModel,
      hintText: AppString.makeModel,
      controller: dataState.makeModelController,
    );
  }

  Widget _calibrationDoneController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.calibarationDate,
      hintText: AppString.calibarationDate,
      controller: dataState.calibrationDoneController,
    );
  }

  Widget _repairDamagesController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.repairCoatingDamage,
      hintText: AppString.repairCoatingDamage,
      controller: dataState.repairDamagesController,
    );
  }

  Widget _weatherDropDown({required LowerFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _paddingTypeDropDown({required LowerFetchDataState dataState}) {
    return DropdownWidget<ProvideModel>(
      label: AppString.paddingType,
      hint: AppString.paddingType,
      dropdownValue: dataState.paddingValue?.name != null ? dataState.paddingValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectPaddingValueEvent(paddingValue: value));
      },
      items:dataState.paddingList,
    );
  }

  Widget _prePaddingTypeDropDown({required LowerFetchDataState dataState}) {
    return DropdownWidget<CheckModel>(
      label: AppString.prePaddingType,
      hint: AppString.prePaddingType,
      dropdownValue: dataState.prePaddingValue?.name != null ? dataState.prePaddingValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectPrePaddingValueEvent(prePaddingValue: value));
      },
      items:dataState.prePaddingList,
    );
  }

  Widget _deWateringTypeDropDown({required LowerFetchDataState dataState}) {
    return DropdownWidget<CompletedModel>(
      label: AppString.deWateringType,
      hint: AppString.deWateringType,
      dropdownValue: dataState.deWateringValue?.name != null ? dataState.deWateringValue : null,
      onChanged: (value) {
        BlocProvider.of<LowerBloc>(context).add(
            SelectDeWateringValueEvent(deWateringValue: value));
      },
      items:dataState.deWateringList,
    );
  }
  Widget _sectionNoController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.sectionNo,
      hintText: AppString.sectionNo,
      controller: dataState.sectionNoController,
    );
  }
  Widget _kmDELA_FROMController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.kmDELA_FROM,
      hintText: AppString.kmDELA_FROM,
      controller: dataState.kmFromController,
    );
  }

  Widget _kmPANA_LA_TOController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.kmPANA_LA_TO,
      hintText: AppString.kmPANA_LA_TO,
      controller: dataState.toKmController,
    );
  }

  Widget _dailyProgressController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.dailyProgress,
      hintText: AppString.dailyProgress,
      controller: dataState.dailyProgressController,
    );
  }

  Widget _coatingRepairController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.coatingRepair,
      hintText: AppString.coatingRepair,
      controller: dataState.coatingRepairController,
    );
  }

  Widget _trenchAcceptanceController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.trenchAcceptance,
      hintText: AppString.trenchAcceptance,
      controller: dataState.trenchAcceptanceController,
    );
  }
  Widget _visualInspController({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.visualInsp,
      hintText: AppString.visualInsp,
      controller: dataState.visualInspController,
    );
  }
  Widget _photo({required LowerFetchDataState dataState}) {
    return  LocalImgWidget(
        file: dataState.photo,
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ImagePopWidget(
                  onTapCamera: () async {
                    Navigator.of(context).pop();
                    BlocProvider.of<LowerBloc>(context).add(SelectCameraCaptureEvent());
                  },
                  onTapGallery: () async {
                    Navigator.of(context).pop();
                    BlocProvider.of<LowerBloc>(context).add(SelectGalleryCaptureEvent());
                  },
                );
              });
        },
      );
  }

  Widget _activityRemark({required LowerFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarkController,
    );
  }
  Widget _button({required LowerFetchDataState dataState}) {
    return dataState.isLoader == false ? ButtonWidget(text: AppString.submit,
        onPressed: () {
             BlocProvider.of<LowerBloc>(context).add(LowerSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}

