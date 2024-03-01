import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Bending/domain/bloc/bending_bloc.dart';
import 'package:bsppl/features/Bending/domain/bloc/bending_event.dart';
import 'package:bsppl/features/Bending/domain/bloc/bending_state.dart';
import 'package:bsppl/features/Bending/domain/model/bend_model.dart';
import 'package:bsppl/features/Bending/domain/model/check_model.dart';
import 'package:bsppl/features/Bending/domain/model/holiday_model.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BendingPage extends StatefulWidget {
  const BendingPage({Key? key}) : super(key: key);

  @override
  State<BendingPage> createState() => _BendingPageState();
}

class _BendingPageState extends State<BendingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BendingBloc>(context).add(BendPageLoadEvent(context: context));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<BendingBloc, BendState>(
          builder: (context, state) {
            if(state is BendFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },
        )
    );
  }
  Widget _itemBuilder({required BendFetchDataState dataState}){
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
            _chainageController(dataState: dataState),
            _verticalSpace(),
            _pipeNoController(dataState: dataState),
            _verticalSpace(),
            _bendNoController(dataState: dataState),
            _verticalSpace(),
            _bendDropDown(dataState: dataState),
            _verticalSpace(),
            _bendDegreeController(dataState: dataState),
            _verticalSpace(),
            _minuteController(dataState: dataState),
            _verticalSpace(),
            _bendSecondController(dataState: dataState),
            _verticalSpace(),
            _tpNoController(dataState: dataState),
            _verticalSpace(),
            _visualDropDown(dataState: dataState),
            _verticalSpace(),
            _guagingDropDown(dataState: dataState),
            _verticalSpace(),
            _disbondingDropDown(dataState: dataState),
            _verticalSpace(),
            _holidayDropDown(dataState: dataState),
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

  Widget _dateController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      hintText: AppString.date,
      label: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<BendingBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }

 

  Widget _weatherDropDown({required BendFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<BendingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _chainageController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      label: AppString.chainage,
      hintText: AppString.chainage,
      controller: dataState.chainageController,
    );
  }

  Widget _pipeNoController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      label: AppString.pipeNo,
      hintText: AppString.pipeNo,
      controller: dataState.pipeNumberController,
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){},
      ),
    );
  }

  Widget _bendNoController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      label: AppString.bendNo,
      hintText: AppString.bendNo,
      controller: dataState.bendNumberController,
    );
  }

  Widget _bendDegreeController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      label: AppString.bendDegree,
      hintText: AppString.bendDegree,
      controller: dataState.bendDegreeController,
    );
  }

  Widget _minuteController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      label: AppString.minute,
      hintText: AppString.minute,
      controller: dataState.minuteController,
    );
  }

  Widget _bendSecondController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      hintText:  AppString.bendSecond,
      label:  AppString.bendSecond,
      controller: dataState.bendSecondController,
    );
  }
  Widget _tpNoController({required BendFetchDataState dataState}) {
    return TextFieldWidget(
     keyboardType: TextInputType.number,
      hintText: AppString.tpNo,
      label: AppString.tpNo,
      controller: dataState.tpNoController,
    );
  }

  Widget _bendDropDown({required BendFetchDataState dataState}) {
    return DropdownWidget<BendModel>(
      hint: AppString.typeOfBend,
      dropdownValue: dataState.bendValue?.name != null ? dataState.bendValue : null,
      onChanged: (value) {
        BlocProvider.of<BendingBloc>(context).add(
            SelectBendEvent(bendValue: value));
      },
      items:dataState.bendList,
    );
  }

  Widget _visualDropDown({required BendFetchDataState dataState}) {
    return DropdownWidget<CheckModel>(
      hint: AppString.visual,
      dropdownValue: dataState.visualValue?.name != null ? dataState.visualValue : null,
      onChanged: (value) {
        BlocProvider.of<BendingBloc>(context).add(
            SelectVisualEvent(visualValue: value));
      },
      items:dataState.visualList,
    );
  }

  Widget _guagingDropDown({required BendFetchDataState dataState}) {
    return DropdownWidget<CheckModel>(
      hint: AppString.guaging,
      dropdownValue: dataState.guagingValue?.name != null ? dataState.guagingValue : null,
      onChanged: (value) {
        BlocProvider.of<BendingBloc>(context).add(
            SelectGuagingEvent(guagingValue: value));
      },
      items:dataState.guagingList,
    );
  }

  Widget _disbondingDropDown({required BendFetchDataState dataState}) {
    return DropdownWidget<CheckModel>(
      hint: AppString.disbonding,
      dropdownValue: dataState.disbondingValue?.name != null ? dataState.disbondingValue : null,
      onChanged: (value) {
        BlocProvider.of<BendingBloc>(context).add(
            SelectDisbondingEvent(disbondingValue: value));
      },
      items:dataState.disbondingList,
    );
  }

  Widget _holidayDropDown({required BendFetchDataState dataState}) {
    return DropdownWidget<HolidayModel>(
      hint: AppString.holiday,
      dropdownValue: dataState.holidayValue?.name != null ? dataState.holidayValue : null,
      onChanged: (value) {
        BlocProvider.of<BendingBloc>(context).add(
            SelectHolidayEvent(holidayValue: value));
      },
      items:dataState.holidayList,
    );
  }
  

  Widget _activityRemark({required BendFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarkController,
    );
  }

  Widget _button() {
    return  ButtonWidget(text: "Submit",
        onPressed: () {
          //    BlocProvider.of<AddBendingBloc>(context).add(AddBendingSubmitDataEvent(context: context));
        }
    );
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

}

