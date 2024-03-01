import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_search_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/RouteHandOver/domain/bloc/route_hand_over_bloc.dart';
import 'package:bsppl/features/RouteHandOver/domain/bloc/route_hand_over_event.dart';
import 'package:bsppl/features/RouteHandOver/domain/bloc/route_hand_over_state.dart';
import 'package:bsppl/features/RouteSurvey/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteHandOverPage extends StatefulWidget {
  const RouteHandOverPage({Key? key}) : super(key: key);

  @override
  State<RouteHandOverPage> createState() => _RouteHandOverPageState();
}

class _RouteHandOverPageState extends State<RouteHandOverPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<RouteHandOverBloc>(context).add(RouteHandOverPageLoadEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RouteHandOverBloc, RouteHandOverState>(
        builder: (context, state){
          if(state is RouteHandOverFetchDataState){
            return _itemBuilder(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget(),);
          }
          },
      )
    );
  }

  Widget _itemBuilder({required RouteHandOverFetchDataState dataState}){
    return Container(
      margin: EdgeInsets.all(10),
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
            _chainageFromController(dataState: dataState),
            _verticalSpace(),
            _chainageToController(dataState: dataState),
            _verticalSpace(),
            _terrainController(dataState: dataState),
            _verticalSpace(),
            _skippingController(dataState: dataState),
            _verticalSpace(),
            _hindranceController(dataState: dataState),
            _verticalSpace(),
            _panchnamaController(dataState: dataState),
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

  Widget _dateController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.date,
      enabled: false,
      prefixIcon: Icon(
        Icons.calendar_today,
        color: AppColor.appBlueColor,
      ),
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<RouteHandOverBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      keyboardType: TextInputType.number,
      
     // controller: dataState.reportNumberController,
    );
  }

  Widget _weatherDropDown({required RouteHandOverFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      label: AppString.selectWeather,
      hint: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<RouteHandOverBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _chainageFromController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.km,
      hintText: AppString.km,
      keyboardType: TextInputType.number,
     controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      keyboardType: TextInputType.number,
      controller: dataState.chainageToController,
    );
  }

  Widget _terrainController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.terrain,
      hintText: AppString.terrain,
      controller: dataState.terrainController,
    );
  }

  Widget _skippingController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label:AppString.skipping,
      hintText:AppString.skipping,
      keyboardType: TextInputType.number,
      controller: dataState.skippingController,
    );
  }

  Widget _hindranceController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.hindrance,
      hintText: AppString.hindrance,
      keyboardType: TextInputType.number,
       controller: dataState.hindranceController,
    );
  }

  Widget _panchnamaController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.panchnama,
      hintText: AppString.panchnama,
      keyboardType: TextInputType.number,
       controller: dataState.panchnamaController,
    );
  }

  Widget _activityRemark({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      maxLength: 3,
      controller: dataState.remarkController,
    );
  }




  Widget _button() {
    return ButtonWidget(text: AppString.submit,
        onPressed: () {
       //   BlocProvider.of<AddRouHandoverBloc>(context).add(AddRouHandoverSubmitDataEvent(context: context));
        }
    );
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

}

