import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/routes/routes_name.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/bloc/yard_receiving_bloc.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/bloc/yard_receiving_event.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/bloc/yard_receiving_state.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/model/yard_name_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YardReceivingPage extends StatefulWidget {
  const YardReceivingPage({Key? key}) : super(key: key);

  @override
  State<YardReceivingPage> createState() => _YardReceivingPageState();
}

class _YardReceivingPageState extends State<YardReceivingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<YardReceivingBloc>(context).add(YardReceivingPageLoadEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.white,
      body: BlocBuilder<YardReceivingBloc, YardReceivingState>(
        builder: (context, state) {
          if(state is YardReceivingFetchDataState) {
            return _itemBuilder(dataState: state);
          } else{
            return const Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required YardReceivingFetchDataState dataState}) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child : Column(
              children: [
                _verticalSpace(),
                _dateController(dataState: dataState),
                _verticalSpace(),
                _pipeBarCodeController(dataState: dataState),
                _verticalSpace(),
                _nrcdController(dataState: dataState),
                _verticalSpace(),
                _jointTypeDropDown(dataState: dataState),
                _verticalSpace(),
                _avizController(dataState: dataState),
                _verticalSpace(),
                _verticalSpace(),
                _verticalSpace(),
                _verticalSpace(),
                _button(),
              ],
            )
        )
    );
  }

  Widget _dateController({required YardReceivingFetchDataState dataState}) {
    return TextFieldWidget(
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<YardReceivingBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _pipeBarCodeController({required YardReceivingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.pipeNo,
      hintText: AppString.pipeNo,
      controller: dataState.pipeBarCodeController,
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){
          Navigator.pushReplacementNamed(
              context, RoutesName.qrCodeScanner);
       },
      ),
    );
  }




  Widget _nrcdController({required YardReceivingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.enterNrcd,
      label: AppString.enterNrcd,
      controller: dataState.nrcdController,
    );
  }

  Widget _jointTypeDropDown({required YardReceivingFetchDataState dataState}) {
    return DropdownWidget<YardNameModel>(
      hint: AppString.selectYardName,
      label: AppString.selectYardName,
      dropdownValue: dataState.yardNameValue?.yardName != null ? dataState.yardNameValue : null,
      onChanged: (value) {
        BlocProvider.of<YardReceivingBloc>(context).add(
            SelectYardNameEvent(yardNameValue: value));
      },
      items:dataState.yardNameList,
    );
  }

  Widget _avizController({required YardReceivingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.enterAviz,
      hintText: AppString.enterAviz,
      keyboardType: TextInputType.text,
      controller: dataState.avizController,
    );
  }

  Widget _button() {
    //  return dataState.isLoader == false ?
    return ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          //   BlocProvider.of<AddYardReceivingBloc>(context).add(AddYardReceivingSubmitDataEvent(context: context));
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
