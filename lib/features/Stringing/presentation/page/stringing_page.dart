import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_bloc.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_state.dart';
import 'package:bsppl/features/Stringing/presentation/widget/check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_event.dart';

class StringingPage extends StatefulWidget {
  const StringingPage({Key? key}) : super(key: key);

  @override
  State<StringingPage> createState() => _StringingPageState();
}

class _StringingPageState extends State<StringingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<StringingBloc>(context).add(StringingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<StringingBloc, StringingState>(
          builder: (context, state) {
            if(state is StringingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },
        )
    );
  }

  Widget _itemBuilder({required StringingFetchDataState dataState}){
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
            _chainageController(dataState: dataState),
            _verticalSpace(),
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _coatingCheckBox(dataState: dataState),
            _verticalSpace(),
            _activityRemark(dataState: dataState),
            _verticalSpace(),
            _pipeNoController(dataState: dataState),
            _verticalSpace(),
            _verticalSpace(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _dateController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
       controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<StringingBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
        controller: dataState.reportNumberController,
    );
  }

  Widget _chainageController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainage,
      hintText: AppString.chainage,
      controller: dataState.chainageController,
    );
  }


  Widget _weatherDropDown({required StringingFetchDataState dataState}) {
    return DropdownWidget(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<StringingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _coatingCheckBox({required StringingFetchDataState dataState}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 6,child: Text(AppString.coatingOk,)),
        Flexible(
          flex: 6,
          child: Row(
            children: [
              CheckBoxWidget(
                label: AppString.yes,
                selectedValue: dataState.isYesValue,
                onChanged: (value){
                  BlocProvider.of<StringingBloc>(context).add(
                      SelectCoatingOkValueEvent(checkYes: true,checkNo: false));
                },
              ),
              CheckBoxWidget(
                label: AppString.no,
                selectedValue: dataState.isNoValue,
                onChanged: (value){
                  BlocProvider.of<StringingBloc>(context).add(
                      SelectCoatingOkValueEvent(checkYes: false,checkNo: true));
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _activityRemark({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
       controller: dataState.activityRemarkController,
    );
  }

  Widget _pipeNoController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.pipeNo,
      label: AppString.pipeNo,
      controller: dataState.pipeNumberController,
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){},
      ),
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

