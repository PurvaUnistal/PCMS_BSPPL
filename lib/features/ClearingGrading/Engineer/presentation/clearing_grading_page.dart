import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/image_pop_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/AllCommonModel/terrain_model.dart';
import 'package:bsppl/features/ClearingGrading/Engineer/domain/bloc/clearing_grading_bloc.dart';
import 'package:bsppl/features/ClearingGrading/Engineer/domain/bloc/clearing_grading_event.dart';
import 'package:bsppl/features/ClearingGrading/Engineer/domain/bloc/clearing_grading_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearingGradingPage extends StatefulWidget {
  const ClearingGradingPage({Key? key}) : super(key: key);

  @override
  State<ClearingGradingPage> createState() => _ClearingGradingPageState();
}

class _ClearingGradingPageState extends State<ClearingGradingPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ClearingGradingBloc>(context).add(ClearingGradingPageLoadEvent(context: context));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<ClearingGradingBloc, ClearingGradingState>(
          builder: (context, state) {
            if(state is ClearingGradingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },
        )
    );
  }
  Widget _itemBuilder({required ClearingGradingFetchDataState dataState}){
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
            _weatherDropDown(dataState: dataState),
            _verticalSpace(),
            _chainageFromController(dataState: dataState),
            _verticalSpace(),
            _chainageToController(dataState: dataState),
            _verticalSpace(),
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _ipNoFromController(dataState: dataState),
            _verticalSpace(),
            _ipNoToController(dataState: dataState),
            _verticalSpace(),
            _tpNoFromSController(dataState: dataState),
            _verticalSpace(),
            _tpNoToController(dataState: dataState),
            _verticalSpace(),
            _terrainDropDown(dataState: dataState),
            _verticalSpace(),
            _structureNameController(dataState: dataState),
            _verticalSpace(),
            _chainageController(dataState: dataState),
            _verticalSpace(),
            _boundaryLocationController(dataState: dataState),
            _verticalSpace(),
            _distanceController(dataState: dataState),
            _verticalSpace(),
            _groundTypeController(dataState: dataState),
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

  Widget _dateController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
      onTap: () {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _reportNumberController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }

  Widget _alignmentDropdown({required ClearingGradingFetchDataState dataState}) {
    return DropdownWidget<AlignSheetModel>(
      star: AppString.star,
      label: AppString.selectAlignment,
      hint: AppString.selectAlignment,
      dropdownValue:  dataState.alignSheetValue!.alignmentId != null ? dataState.alignSheetValue : null,
      items: dataState.alignSheetList,
      onChanged: (value) {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectAlignmentEvent(alignSheetValue: value)
        );
      },
    );
  }

  Widget _weatherDropDown({required ClearingGradingFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      hint: AppString.selectWeather,
      label: AppString.selectWeather,
      dropdownValue: dataState.weatherValue?.name != null ? dataState.weatherValue : null,
      onChanged: (value) {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectWeatherEvent(weatherValue: value));
      },
      items:dataState.weatherList,
    );
  }

  Widget _chainageFromController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      controller: dataState.chainageToController,
    );
  }

  Widget _sectionLengthController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      enabled: false,
      keyboardType: TextInputType.number,
      controller: dataState.sectionLengthController,
    );
  }

  Widget _ipNoFromController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.ipNoFrom,
      hintText: AppString.ipNoFrom,
      controller: dataState.ipNoFromController,
    );
  }

  Widget _ipNoToController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label:  AppString.ipNoTo,
      hintText:  AppString.ipNoTo,
      controller: dataState.ipNoToController,
    );
  }
  Widget _tpNoFromSController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.tpNoFrom,
      hintText: AppString.tpNoFrom,
      controller: dataState.tpNoFromController,
    );
  }

  Widget _tpNoToController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.tpNoTo,
      hintText: AppString.tpNoTo,
      controller: dataState.tpNoToController,
    );
  }

  Widget _terrainDropDown({required ClearingGradingFetchDataState dataState}) {
    return DropdownWidget<TerrainModel>(
      label: AppString.terrain,
      hint: AppString.terrain,
      dropdownValue: dataState.terrainValue?.name != null ? dataState.terrainValue : null,
      onChanged: (value) {
        BlocProvider.of<ClearingGradingBloc>(context).add(
            SelectTerrainEvent(terrainValue: value));
      },
      items:dataState.terrainList,
    );
  }

  Widget _structureNameController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 2,
      label: AppString.structureName,
      hintText: AppString.structureName,
      controller: dataState.structureNameController,
    );
  }

  Widget _chainageController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainage,
      hintText: AppString.chainage,
      controller: dataState.chainageController,
    );
  }

  Widget _boundaryLocationController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.boundaryLocation,
      hintText: AppString.boundaryLocation,
      controller: dataState.locationBoundaryController,
    );
  }

  Widget _distanceController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.distance,
      hintText: AppString.distance,
      controller: dataState.distanceController,
    );
  }

  Widget _groundTypeController({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      enabled: false,
      keyboardType: TextInputType.text,
      label: AppString.groundType,
      hintText: AppString.groundType,
      controller: dataState.typeGrpController,
    );
  }

  Widget _photo({required ClearingGradingFetchDataState dataState}) {
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
                BlocProvider.of<ClearingGradingBloc>(context).add(SelectCameraCaptureEvent());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<ClearingGradingBloc>(context).add(SelectGalleryCaptureEvent());
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

  Widget _activityRemark({required ClearingGradingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarkController,
    );
  }

  Widget _button({required ClearingGradingFetchDataState dataState}) {
    return dataState.isLoader == false ? ButtonWidget(
        text: AppString.submit,
        onPressed: () {
              BlocProvider.of<ClearingGradingBloc>(context).add(ClearingGradingSubmitEvent(context: context));
        }
    ) : const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

}

