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
import 'package:bsppl/features/Stringing/Engineer/presentation/widget/check_box_widget.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/model/joint_type_model.dart';
import 'package:bsppl/features/Welding/Engineer/domain/bloc/welding_bloc.dart';
import 'package:bsppl/features/Welding/Engineer/domain/bloc/welding_event.dart';
import 'package:bsppl/features/Welding/Engineer/domain/bloc/welding_state.dart';
import 'package:bsppl/features/Welding/Engineer/domain/model/welder_model.dart';
import 'package:bsppl/features/Welding/Engineer/domain/model/wps_model.dart';
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
                _filler4Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler4Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler5Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler5Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler6Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler6Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler7Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler7Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _filler8Welders1Controller(dataState: dataState),
                _verticalSpace(),
                _filler8Welders2Controller(dataState: dataState),
                _verticalSpace(),
                _cappingWelder1Controller(dataState: dataState),
                _verticalSpace(),
                _cappingWelder2Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE6010Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeBatch806012Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeBatchB22B221868Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeBatchE6010Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeBatchE8010Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE9045Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaE8010Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDiaB22B221868Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeDia806012Controller(dataState: dataState),
                _verticalSpace(),
                _electrodeBatchE9045p2Controller(dataState: dataState),
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
                _photo(dataState: dataState),
                _verticalSpace(),
                _activityRemark(dataState: dataState),
                _verticalSpace(),
                _verticalSpace(),
                _button(dataState: dataState),
              ],
            )
        )
    );
  }

  Widget _dateController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
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
      star: AppString.star,
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
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
    );
  }

  Widget _leftPipeController({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
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
      star: AppString.star,
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
      star: AppString.star,
      label: AppString.selectJointType,
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
      star: AppString.star,
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
      label: AppString.selectWPS,
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
      label: AppString.rootWelders1,
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
      label: AppString.rootWelders2,
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
        label: AppString.hotWelders1,
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
        label: AppString.hotWelders2,
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
        label: AppString.filler1Welders1,
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
        label: AppString.filler1Welders2,
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
        label: AppString.filler2Welders1,
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
        label: AppString.filler2Welders2,
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
        label: AppString.filler3Welders1,
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
        label: AppString.filler3Welders2,
        hint: AppString.filler3Welders2,
        dropdownValue: dataState.filler3Welders2Value?.welderName != null ? dataState.filler3Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller3Welder2Event(filler3Welder2Value: value));
        },
        items:dataState.filler3Welders2List
    );
  }
  Widget _filler4Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler4Welders1,
        hint: AppString.filler4Welders1,
        dropdownValue: dataState.filler4Welders1Value?.welderName != null ? dataState.filler4Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller4Welder1Event(filler4Welder1Value: value));
        },
        items:dataState.filler4Welders1List
    );
  }

  Widget _filler4Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        hint: AppString.filler4Welders2,
        label: AppString.filler4Welders2,
        dropdownValue: dataState.filler4Welders2Value?.welderName != null ? dataState.filler4Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller4Welder2Event(filler4Welder2Value: value));
        },
        items:dataState.filler4Welders2List
    );
  }
  Widget _filler5Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler5Welders1,
        hint: AppString.filler5Welders1,
        dropdownValue: dataState.filler5Welders1Value?.welderName != null ? dataState.filler5Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller5Welder1Event(filler5Welder1Value: value));
        },
        items:dataState.filler5Welders1List
    );
  }

  Widget _filler5Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler5Welders2,
        hint: AppString.filler5Welders2,
        dropdownValue: dataState.filler5Welders2Value?.welderName != null ? dataState.filler5Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller5Welder2Event(filler5Welder2Value: value));
        },
        items:dataState.filler5Welders2List
    );
  }
  Widget _filler6Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler6Welders1,
        hint: AppString.filler6Welders1,
        dropdownValue: dataState.filler6Welders1Value?.welderName != null ? dataState.filler6Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller6Welder1Event(filler6Welder1Value: value));
        },
        items:dataState.filler6Welders1List
    );
  }

  Widget _filler6Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler6Welders2,
        hint: AppString.filler6Welders2,
        dropdownValue: dataState.filler6Welders2Value?.welderName != null ? dataState.filler6Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller6Welder2Event(filler6Welder2Value: value));
        },
        items:dataState.filler6Welders2List
    );
  }
  Widget _filler7Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler7Welders1,
        hint: AppString.filler7Welders1,
        dropdownValue: dataState.filler7Welders1Value?.welderName != null ? dataState.filler7Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller7Welder1Event(filler7Welder1Value: value));
        },
        items:dataState.filler7Welders1List
    );
  }

  Widget _filler7Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler7Welders2,
        hint: AppString.filler7Welders2,
        dropdownValue: dataState.filler7Welders2Value?.welderName != null ? dataState.filler7Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller7Welder2Event(filler7Welder2Value: value));
        },
        items:dataState.filler7Welders2List
    );
  }
  Widget _filler8Welders1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler8Welders1,
        hint: AppString.filler8Welders1,
        dropdownValue: dataState.filler8Welders1Value?.welderName != null ? dataState.filler8Welders1Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller8Welder1Event(filler8Welder1Value: value));
        },
        items:dataState.filler8Welders1List
    );
  }

  Widget _filler8Welders2Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.filler8Welders2,
        hint: AppString.filler8Welders2,
        dropdownValue: dataState.filler8Welders2Value?.welderName != null ? dataState.filler8Welders2Value : null,
        onChanged: (value) {
          BlocProvider.of<WeldingBloc>(context).add(
              SelectFiller8Welder2Event(filler8Welder2Value: value));
        },
        items:dataState.filler8Welders2List
    );
  }


  Widget _cappingWelder1Controller({required WeldingFetchDataState dataState}) {
    return  DropdownWidget<WelderModel>(
        label: AppString.cappingWelder1,
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
        label: AppString.cappingWelder2,
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

  Widget _electrodeBatch806012Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeBatch806012,
      hintText: AppString.electrodeBatch806012,
      controller: dataState.electrodeBatch806012Controller,
    );
  }

  Widget _electrodeBatchB22B221868Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeBatchB22B221868,
      hintText: AppString.electrodeBatchB22B221868,
      controller: dataState.electrodeBatchB22B221868Controller,
    );
  }

  Widget _electrodeBatchE6010Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeBatchE6010,
      hintText: AppString.electrodeBatchE6010,
      controller: dataState.electrodeBatchE6010Controller,
    );
  }

  Widget _electrodeBatchE8010Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeBatchE8010,
      hintText: AppString.electrodeBatchE8010,
      controller: dataState.electrodeBatchE8010Controller,
    );
  }

  Widget _electrodeDiaE9045Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDiaE9045,
      hintText: AppString.electrodeDiaE9045,
      controller: dataState.electrodeDiaE9045Controller,
    );
  }

  Widget _electrodeDiaE8010Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.electrodeDiaE8010,
      hintText: AppString.electrodeDiaE8010,
      controller: dataState.electrodeDiaE8010Controller,
    );
  }

  Widget _electrodeDiaB22B221868Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDiaB22B221868,
      hintText: AppString.electrodeDiaB22B221868,
      controller: dataState.electrodeDiaB22B221868Controller,
    );
  }

  Widget _electrodeDia806012Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeDia806012,
      hintText: AppString.electrodeDia806012,
      controller: dataState.electrodeDia806012Controller,
    );
  }

  Widget _electrodeBatchE9045p2Controller({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.electrodeBatchE9045p2,
      hintText: AppString.electrodeBatchE9045p2,
      controller: dataState.electrodeBatchE9045p2Controller,
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
  Widget _photo({required WeldingFetchDataState dataState}) {
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
                  BlocProvider.of<WeldingBloc>(context).add(SelectCameraCaptureEvent());
                },
                onTapGallery: () async {
                  Navigator.of(context).pop();
                  BlocProvider.of<WeldingBloc>(context).add(SelectGalleryCaptureEvent());
                },
              );
            });
      },
    );
  }

  Widget _activityRemark({required WeldingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
       controller: dataState.activityRemarkController,
    );
  }


  Widget _button({required WeldingFetchDataState dataState}) {
     return dataState.isLoader == false ? ButtonWidget(
        text: AppString.submit,
        onPressed: () {
             BlocProvider.of<WeldingBloc>(context).add(WeldingSubmitEvent(context: context));
        }
      ): const DottedLoaderWidget();
  }

  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
