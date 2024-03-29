import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/image_pop_widget.dart';
import 'package:bsppl/Utils/common_widget/local_img.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/PipeCoating/Engineer/domain/bloc/pipe_coating_bloc.dart';
import 'package:bsppl/features/PipeCoating/Engineer/domain/bloc/pipe_coating_event.dart';
import 'package:bsppl/features/PipeCoating/Engineer/domain/bloc/pipe_coating_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/align_sheet_model.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PipeCoatingPage extends StatefulWidget {
  const PipeCoatingPage({Key? key}) : super(key: key);

  @override
  State<PipeCoatingPage> createState() => _PipeCoatingPageState();
}

class _PipeCoatingPageState extends State<PipeCoatingPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<PipeCoatingBloc>(context).add(PipeCoatingPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocBuilder<PipeCoatingBloc, PipeCoatingState>(
          builder: (context, state) {
            if(state is PipeCoatingFetchDataState) {
              return _itemBuilder(dataState: state);
            } else{
              return const Center(child: CenterLoaderWidget(),);
            }
          },)
    );
  }

  Widget _itemBuilder({required PipeCoatingFetchDataState dataState}){
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
            _searchPipeController(dataState: dataState),
            _verticalSpace(),
            _pipeNoDropdown(dataState: dataState),
            _verticalSpace(),
            _kmDELA_FROMController(dataState: dataState),
            _verticalSpace(),
            _kmPANA_LA_TOController(dataState: dataState),
            _verticalSpace(),
            _dailyProgressController(dataState: dataState),
            _verticalSpace(),
            _relativeHumidityController(dataState: dataState),
            _verticalSpace(),
            _airTemperatureController(dataState: dataState),
            _verticalSpace(),
            _dewPointProgessController(dataState: dataState),
            _verticalSpace(),
            _pipeTemperatureController(dataState: dataState),
            _verticalSpace(),
            _manufactureController(dataState: dataState),
            _verticalSpace(),
            _materialType1Controller(dataState: dataState),
            _verticalSpace(),
            _materialType2Controller(dataState: dataState),
            _verticalSpace(),
            _materialBatchController(dataState: dataState),
            _verticalSpace(),
            _defectLocationController(dataState: dataState),
            _verticalSpace(),
            _repairAreaController(dataState: dataState),
            _verticalSpace(),
            _surfaceRemovalController(dataState: dataState),
            _verticalSpace(),
            _visualInspController(dataState: dataState),
            _verticalSpace(),
            _preHeatController(dataState: dataState),
            _verticalSpace(),
            _dftCheckController(dataState: dataState),
            _verticalSpace(),
            _holidayTestController(dataState: dataState),
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

  Widget _dateController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      enabled: true,
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      onTap: () {
        BlocProvider.of<PipeCoatingBloc>(context).add(SelectDateEvent(context: context));
      },
    );
  }

  Widget _reportNumberController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      controller: dataState.reportNumberController,
    );
  }

  Widget _searchPipeController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      keyboardType: TextInputType.number,
      hintText: AppString.searchPipe,
      label: AppString.searchPipe,
      controller: dataState.pipePageController,
      onChanged: (value) {
        BlocProvider.of<PipeCoatingBloc>(context).add(
            SelectPipePagingEvent(context: context));
      },
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){},
      ),
    );
  }

  Widget _pipeNoDropdown({required PipeCoatingFetchDataState dataState}) {
    return DropdownWidget<String>(
      star: AppString.star,
      hint: AppString.pipeNo,
      label: AppString.pipeNo,
      dropdownValue: dataState.pipeNumberValue != null ? dataState.pipeNumberValue : null,
      onChanged: (value) {
        BlocProvider.of<PipeCoatingBloc>(context).add(
            SelectPipeNoValueEvent( pipeNoValue: value));
      },
      items:dataState.pipeNumberList,
    );
  }

  Widget _kmDELA_FROMController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.kmDELA_FROM,
      hintText: AppString.kmDELA_FROM,
      controller: dataState.kmFromController,
    );
  }

  Widget _kmPANA_LA_TOController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.kmPANA_LA_TO,
      hintText: AppString.kmPANA_LA_TO,
      controller: dataState.kmToController,
    );
  }

  Widget _dailyProgressController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.dailyProgress,
      hintText: AppString.dailyProgress,
      controller: dataState.dailyProgressController,
    );
  }

  Widget _relativeHumidityController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.relativeHumidity,
      hintText: AppString.relativeHumidity,
      controller: dataState.relativeHumidityController,
    );
  }

  Widget _airTemperatureController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.airTemperature,
      hintText: AppString.airTemperature,
      controller: dataState.airTemperatureController,
    );
  }

  Widget _dewPointProgessController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.dewPointProgess,
      hintText: AppString.dewPointProgess,
      controller: dataState.dewPointProgessController,
    );
  }


  Widget _pipeTemperatureController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.pipeTemperature,
      hintText: AppString.pipeTemperature,
      controller: dataState.pipeTemperatureController,
    );
  }

  Widget _manufactureController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.manufacture,
      hintText: AppString.manufacture,
      controller: dataState.manufactureController,
    );
  }

  Widget _materialType1Controller({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.materialType1,
      hintText: AppString.materialType1,
      controller: dataState.materialType1Controller,
    );
  }
  Widget _materialType2Controller({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.materialType2,
      hintText: AppString.materialType2,
      controller: dataState.materialType2Controller,
    );
  }

  Widget _materialBatchController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.materialBatch,
      hintText: AppString.materialBatch,
      controller: dataState.materialBatchController,
    );
  }
  Widget _defectLocationController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.defectLocation,
      hintText: AppString.defectLocation,
      controller: dataState.defectLocationController,
    );
  }
  Widget _repairAreaController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.repairArea,
      hintText: AppString.repairArea,
      controller: dataState.repairAreaController,
    );
  }
  Widget _surfaceRemovalController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.surfaceRemoval,
      hintText: AppString.surfaceRemoval,
      controller: dataState.surfaceRemovalController,
    );
  }
  Widget _visualInspController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.visualInsp,
      hintText: AppString.visualInsp,
      controller: dataState.visualInspController,
    );
  }
  Widget _preHeatController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.preHeat,
      hintText: AppString.preHeat,
      controller: dataState.preHeatController,
    );
  }
  Widget _dftCheckController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.dftCheck,
      hintText: AppString.dftCheck,
      controller: dataState.dftCheckController,
    );
  }
  Widget _holidayTestController({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.holiday,
      hintText: AppString.holiday,
      controller: dataState.holidayTestController,
    );
  }


  Widget _activityRemark({required PipeCoatingFetchDataState dataState}) {
    return TextFieldWidget(
      maxLine: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      controller: dataState.activityRemarksController,
    );
  }

  Widget _photo({required PipeCoatingFetchDataState dataState}) {
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
              BlocProvider.of<PipeCoatingBloc>(context).add(SelectCameraCaptureEvent());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<PipeCoatingBloc>(context).add(SelectGalleryCaptureEvent());
            },
          );
        });
      },
    );
  }

  Widget _button({required PipeCoatingFetchDataState dataState}) {
    return dataState.isLoader == false ? ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<PipeCoatingBloc>(context).add(PipeCoatingSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
