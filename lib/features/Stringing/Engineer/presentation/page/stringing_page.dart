import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/image_pop_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/bloc/stringing_bloc.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/bloc/stringing_state.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/model/coating_ok_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/bloc/stringing_event.dart';

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
            _alignmentDropdown(dataState: dataState),
            _verticalSpace(),
            _searchPipeController(dataState: dataState),
            _verticalSpace(),
            _pipeNoDropdown(dataState: dataState),
            _verticalSpace(),
            _chainageController(dataState: dataState),
            _verticalSpace(),
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _coatingDown(dataState: dataState),
            _verticalSpace(),
            _pipeDiameterController(dataState: dataState),
            _verticalSpace(),
            _pipeMeterialController(dataState: dataState),
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

  Widget _dateController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: true,
      star: AppString.star,
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
      star: AppString.star,
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
        controller: dataState.reportNumberController,
    );
  }

  Widget _chainageController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
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

  Widget _coatingDown({required StringingFetchDataState dataState}) {
    return DropdownWidget<CoatingOkModel>(
      hint: AppString.coatingType,
      label: AppString.coatingType,
      dropdownValue: dataState.coatingValue?.name != null ? dataState.coatingValue : null,
      onChanged: (value) {
        BlocProvider.of<StringingBloc>(context).add(
            SelectCoatingOkValueEvent(coatingValue: value));
      },
      items:dataState.coatingOkList,
    );
  }


  Widget _pipeDiameterController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.pipeDiameter,
      label: AppString.pipeDiameter,
      controller: dataState.pipeDiameterController,
    );
  }

  Widget _pipeMeterialController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      hintText: AppString.pipeMeterial,
      label: AppString.pipeMeterial,
      controller: dataState.pipeMeterialController,
    );
  }

  Widget _alignmentDropdown({required StringingFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      star: AppString.star,
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      hint: AppString.selectAlignment,
      label: AppString.selectAlignment,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<StringingBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }

  Widget _searchPipeController({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      hintText: AppString.searchPipe,
      label: AppString.searchPipe,
      controller: dataState.pipePageController,
      onChanged: (value) {
        BlocProvider.of<StringingBloc>(context).add(
            SelectPipePagingEvent(context: context));
      },
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){},
      ),
    );
  }

  Widget _pipeNoDropdown({required StringingFetchDataState dataState}) {
    return DropdownWidget<String>(
      star: AppString.star,
      hint: AppString.pipeNo,
      label: AppString.pipeNo,
      dropdownValue: dataState.pipeNumberValue != null ? dataState.pipeNumberValue : null,
      onChanged: (value) {
        BlocProvider.of<StringingBloc>(context).add(
            SelectPipeNoValueEvent( pipeNoValue: value));
      },
      items:dataState.pipeNumberList,
    );
  }

  Widget _activityRemark({required StringingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
       controller: dataState.activityRemarkController,
    );
  }

  Widget _photo({required StringingFetchDataState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height:MediaQuery.of(context).size.width/3,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return  ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<StringingBloc>(context).add(SelectCameraCaptureEvent());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<StringingBloc>(context).add(SelectGalleryCaptureEvent());
              },
            );
          });
        },
        child: DottedBorder(
          color: AppColor.grey,
          strokeWidth: 1,
          child: dataState.photo.path == ""
              ||dataState.photo.path.isEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Icon(Icons.photo_camera_back_outlined),),
              Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: TextWidget(AppString.photo,
                  fontSize: 12,
                  color: AppColor.grey,),
              ),
            ],
          ):Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(
                    dataState.photo,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.width/4.5 ,
                  )
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width/3,
                  height:MediaQuery.of(context).size.width/3,
                  color : Colors.white.withOpacity(0.6),
                  child: Center(child: Icon(Icons.refresh, color: AppColor.appBlueColor,))),

            ],
          ),
        ),
      ),
    );
  }

  Widget _button({required StringingFetchDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
              BlocProvider.of<StringingBloc>(context).add(StringingSubmitEvent(context: context));
        }
    ) : const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}

