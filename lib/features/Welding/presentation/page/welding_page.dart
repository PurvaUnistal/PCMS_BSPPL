import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_search_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:bsppl/features/Stringing/presentation/widget/check_box_widget.dart';
import 'package:bsppl/features/Trenching/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Welding/domain/bloc/welding_bloc.dart';
import 'package:bsppl/features/Welding/domain/bloc/welding_event.dart';
import 'package:bsppl/features/Welding/domain/bloc/welding_state.dart';
import 'package:bsppl/features/Welding/domain/model/welder_model.dart';
import 'package:bsppl/features/Welding/domain/model/wps_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeldingPage extends StatefulWidget {
  const WeldingPage({Key? key}) : super(key: key);

  @override
  State<WeldingPage> createState() => _WeldingPageState();
}

class _WeldingPageState extends State<WeldingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<WeldingBloc>(context).add(WeldingPageLoadEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.white,
      body: BlocBuilder<WeldingBloc, WeldingState>(
        builder: (context, state) {
          if(state is WeldingFetchDataState) {
            return _itemBuilder(dataState: state);
          } else{
            return const Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required WeldingFetchDataState dataState}) {
    return Container(
        margin: const EdgeInsets.all(10.0),
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
                _chainageFromController(dataState: dataState),
                _verticalSpace(),
                _chainageToController(dataState: dataState),
                _verticalSpace(),
                _leftPipeController(dataState: dataState),
                _verticalSpace(),
                _rightPipeController(dataState: dataState),
                _verticalSpace(),
                _kmController(dataState: dataState),
                _verticalSpace(),
                _jointTypeDropDown(dataState: dataState),
                _verticalSpace(),
                _jointNoController(dataState: dataState),
                _verticalSpace(),
                _suffixController(dataState: dataState),
                _verticalSpace(),
                _wpsDropdown(dataState: dataState),
                _verticalSpace(),
                _rootWelders1Dropdown(dataState: dataState),
                _verticalSpace(),
                _rootWelders2Dropdown(dataState: dataState),
                _verticalSpace(),
                _hotWelders1Controller(dataState: dataState),
                _verticalSpace(),
                _hotWelders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler1Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler1Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler2Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler2Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler3Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler3Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _verticalSpace(),
                _cappingWelder1Controller(dataState: dataState),
                _verticalSpace(),
                _cappingWelder2Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE6010Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE6010BatchController(dataState: dataState),
                _verticalSpace(),
                _electrodeEiaE8010p1Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeEiaE8010p1BatchController(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE9045p2Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE9045p2BatchController(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE81t8gController(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE81t8gBatchController(dataState: dataState),
                _verticalSpace(),
                _pipeDiameterController(dataState: dataState),
                _verticalSpace(),
                _pipeThickController(dataState: dataState),
                _verticalSpace(),
                _processController(dataState: dataState),
                _verticalSpace(),
                _materialController(dataState: dataState),
                _verticalSpace(),
                _fitUpWeldVisualCheckBox(dataState: dataState),
                _verticalSpace(),
                _activityRemark(dataState: dataState),
                _verticalSpace(),
                _verticalSpace(),
                _button(),
              ],
            )
        )
    );
  }

  Widget _dateController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }
  Widget _alignmentDropdown({required WeldingFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      hint: AppString.selectAlignment,
      label: AppString.selectAlignment,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }

  Widget _weatherDropDown({required WeldingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _chainageFromController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
    );
  }

  Widget _leftPipeController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.leftPipeNumber,
      hintText: AppString.leftPipeNumber,
      controller: dataState.leftPipeNumberController,
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor),
        onPressed: (){},
      ),
    );
  }

  Widget _rightPipeController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.rightPipeNumber,
      label: AppString.rightPipeNumber,
      keyboardType: TextInputType.text,
      controller: dataState.rightPipeNumberController,
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor),
        onPressed: (){},
      ),
    );
  }

  Widget _kmController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.km,
      hintText: AppString.km,
      keyboardType: TextInputType.number,
      controller: dataState.kmController,
    );
  }

  Widget _jointTypeDropDown({required WeldingFetchDataState dataState}) {
    return DropdownWidget<JointTypeModel>(
      hint: AppString.selectJointType,
      dropdownValue: dataState.jointTypeValue?.name != null ? dataState.jointTypeValue : null,
      onChanged: (value) {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectJointTypeEvent(jointTypeValue: value));
      },
      items:dataState.jointTypeList,
    );
  }

  Widget _jointNoController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.jointNo,
      hintText: AppString.jointNo,
      keyboardType: TextInputType.number,
      controller: dataState.jointNoController,
    );
  }

  Widget _suffixController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.suffix,
      hintText: AppString.suffix,
      keyboardType: TextInputType.number,
      controller: dataState.suffixController,
    );
  }

  Widget _wpsDropdown({required WeldingFetchDataState dataState}) {
    return DropdownWidget<WpsModel>(
      hint: AppString.selectWPS,
      dropdownValue: dataState.wpsValue?.wpsName != null ? dataState.wpsValue : null,
      onChanged: (value) {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectWpsEvent(wpsValue: value));
      },
      items:dataState.wpsList,
    );
  }

  Widget _rootWelders1Dropdown({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
      hint: AppString.rootWelders1,
      dropdownValue: dataState.rootWelders1Value?.welderName != null ? dataState.rootWelders1Value : null,
      onChanged: (value) {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectRootWelder1Event(rootWelder1Value: value));
      },
      items:dataState.rootWelders1List,
    );
  }

  Widget _rootWelders2Dropdown({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
      hint: AppString.rootWelders2,
      dropdownValue: dataState.rootWelders2Value?.welderName != null ? dataState.rootWelders2Value : null,
      onChanged: (value) {
        BlocProvider.of<WeldingBloc>(context).add(
            SelectRootWelder2Event(rootWelder2Value: value));
      },
      items:dataState.rootWelders2List,
    );
  }

  Widget _hotWelders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.hotWelders1,
        dropdownValue: dataState.hotWelders1Value?.welderName != null ? dataState.hotWelders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectHotWelder1Event(hotWelder1Value: value));
        },
        items:dataState.hotWelders1List
    );
  }

  Widget _hotWelders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.hotWelders2,
        dropdownValue: dataState.hotWelders2Value?.welderName != null ? dataState.hotWelders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectHotWelder2Event(hotWelder2Value: value));
        },
        items:dataState.hotWelders2List
    );
  }

  Widget _filler1Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler1Welders1,
        dropdownValue: dataState.filler1Welders1Value?.welderName != null ? dataState.filler1Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller1Welder1Event(filler1Welder1Value: value));
        },
        items:dataState.filler1Welders1List
    );
  }

  Widget _filler1Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler1Welders2,
        dropdownValue: dataState.filler1Welders2alue?.welderName != null ? dataState.filler1Welders2alue : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller1Welder2Event(filler1Welder2Value: value));
        },
        items:dataState.filler1Welders2List
    );
  }

  Widget _filler2Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler2Welders1,
        dropdownValue: dataState.filler2Welders1Value?.welderName != null ? dataState.filler2Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller2Welder1Event(filler2Welder1Value: value));
        },
        items:dataState.filler2Welders1List
    );
  }

  Widget _filler2Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler2Welders2,
        dropdownValue: dataState.filler2Welders2Value?.welderName != null ? dataState.filler2Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller2Welder2Event(filler2Welder2Value: value));
        },
        items:dataState.filler2Welders2List
    );
  }

  Widget _filler3Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler3Welders1,
        dropdownValue: dataState.filler3Welders1Value?.welderName != null ? dataState.filler3Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller3Welder1Event(filler3Welder1Value: value));
        },
        items:dataState.filler3Welders1List
    );
  }

  Widget _filler3Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler3Welders2,
        dropdownValue: dataState.filler3Welders2Value?.welderName != null ? dataState.filler3Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller3Welder2Event(filler3Welder2Value: value));
        },
        items:dataState.filler3Welders2List
    );
  }


  Widget _cappingWelder1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.cappingWelder1,
        dropdownValue: dataState.cappingWelder1Value?.welderName != null ? dataState.cappingWelder1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectCapping1Welder1Event(capping1Welder1Value: value));
        },
        items:dataState.cappingWelder1List
    );
  }

  Widget _cappingWelder2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.cappingWelder2,
        dropdownValue: dataState.cappingWelder2Value?.welderName != null ? dataState.cappingWelder2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectCapping2Welder2Event(capping2Welder2Value: value));
        },
        items:dataState.cappingWelder2List
    );
  }


  Widget _electrodeDiaE6010Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeDiaE6010,
      hintText: AppString.electrodeDiaE6010,
      controller: dataState.electrodeDiaE6010Controller,
    );
  }

  Widget _electrodeDiaE6010BatchController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDiaE6010Batch,
      hintText: AppString.electrodeDiaE6010Batch,
      controller: dataState.electrodeDiaE6010BatchController,
    );
  }

  Widget _electrodeEiaE8010p1Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeDiaE8010p1,
      hintText: AppString.electrodeDiaE8010p1,
      controller: dataState.electrodeDiaE8010p1Controller,
    );
  }

  Widget _electrodeEiaE8010p1BatchController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDiaE8010p1Batch,
      hintText: AppString.electrodeDiaE8010p1Batch,
      controller: dataState.electrodeDiaE8010p1BatchController,
    );
  }

  Widget _electrodeDiaE9045p2Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeDiaE9045p2,
      hintText: AppString.electrodeDiaE9045p2,
      controller: dataState.electrodeDiaE9045p2Controller,
    );
  }

  Widget _electrodeDiaE9045p2BatchController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDiaE9045p2Batch,
      hintText: AppString.electrodeDiaE9045p2Batch,
      controller: dataState.electrodeDiaE9045p2BatchController,
    );
  }

  Widget _electrodeDiaE81t8gController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeDiaE81t8g,
      hintText: AppString.electrodeDiaE81t8g,
      controller: dataState.electrodeDiaE81t8gController,
    );
  }

  Widget _electrodeDiaE81t8gBatchController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDiaE81t8gBatch,
      hintText: AppString.electrodeDiaE81t8gBatch,
      controller: dataState.electrodeDiaE81t8gBatchController,
    );
  }

  Widget _pipeDiameterController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.pipeDiameter,
      hintText: AppString.pipeDiameter,
      controller: dataState.pipeDiameterController,
    );
  }

  Widget _pipeThickController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
     hintText: AppString.pipeThick,
     label: AppString.pipeThick,
      controller: dataState.pipeThickController,
    );
  }

  Widget _processController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      hintText: AppString.process,
      label: AppString.process,
      controller: dataState.processController,
    );
  }

  Widget _materialController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.material,
      hintText: AppString.material,
      controller: dataState.materialController,
    );
  }

  Widget _fitUpWeldVisualCheckBox({required WeldingFetchDataState dataState}){
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: CheckBoxWidget(
            label: AppString.fitup,
            selectedValue: dataState.isFitUpValue,
            onChanged: (value){
              BlocProvider.of<WeldingBloc>(context).add(SelectFitUpEvent(fitUpValue: value));
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: CheckBoxWidget(
            label: AppString.weldVisual,
            selectedValue:  dataState.isWeldVisualValue,
            onChanged: (value){
              BlocProvider.of<WeldingBloc>(context).add(SelectWeldVisualEvent(weldVisualValue: value));
            },
          ),
        ),
      ],
    );
  }


  Widget _activityRemark({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      // controller: dataState.activityRemarkController,
    );
  }


  Widget _button() {
    //  return dataState.isLoader == false ?
    return ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          //   BlocProvider.of<AddWeldingBloc>(context).add(AddWeldingSubmitDataEvent(context: context));
        }
    );
    //  ): const DottedLoaderWidget();
  }

  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
