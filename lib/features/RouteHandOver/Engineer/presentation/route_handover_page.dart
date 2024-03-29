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
import 'package:bsppl/features/RouteHandOver/Engineer/domain/bloc/route_hand_over_bloc.dart';
import 'package:bsppl/features/RouteHandOver/Engineer/domain/bloc/route_hand_over_event.dart';
import 'package:bsppl/features/RouteHandOver/Engineer/domain/bloc/route_hand_over_state.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/model/weather_model.dart';
import 'package:dotted_border/dotted_border.dart';
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
            _sectionLengthController(dataState: dataState),
            _verticalSpace(),
            _terrainDropDown(dataState: dataState),
            _verticalSpace(),
            _skippingController(dataState: dataState),
            _verticalSpace(),
            _hindranceController(dataState: dataState),
            _verticalSpace(),
            _panchnamaController(dataState: dataState),
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

  Widget _dateController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.date,
      enabled: true,
      suffixIcon:IconButton(
        icon:  Icon(
          Icons.calendar_today,
          color: AppColor.appBlueColor,
        ),
        onPressed: (){
          BlocProvider.of<RouteHandOverBloc>(context).add(
              SelectDateEvent(context: context,));
        },
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
      star: AppString.star,
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      keyboardType: TextInputType.number,
      controller: dataState.reportNumberController,
    );
  }

  Widget _weatherDropDown({required RouteHandOverFetchDataState dataState}) {
    return DropdownWidget<WeatherModel>(
      star: AppString.star,
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
      star: AppString.star,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      keyboardType: TextInputType.number,
     controller: dataState.chainageFromController,
      onChanged: (val){
        BlocProvider.of<RouteHandOverBloc>(context).add(SelectSectionLengthEvent());
      },
    );
  }

  Widget _chainageToController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      label: AppString.chainageTo,
      hintText: AppString.chainageTo,
      keyboardType: TextInputType.number,
      controller: dataState.chainageToController,
      onChanged: (val){
        BlocProvider.of<RouteHandOverBloc>(context).add(SelectSectionLengthEvent());
      },
    );
  }

  Widget _sectionLengthController({required RouteHandOverFetchDataState dataState}) {
    return TextFieldWidget(
      star: AppString.star,
      enabled: false,
      label: AppString.sectionLength,
      hintText: AppString.sectionLength,
      keyboardType: TextInputType.number,
      controller: dataState.sectionLengthController,
    );
  }

  Widget _terrainDropDown({required RouteHandOverFetchDataState dataState}) {
    return DropdownWidget<TerrainModel>(
      label: AppString.terrain,
      hint: AppString.terrain,
      dropdownValue: dataState.terrainValue?.name != null ? dataState.terrainValue : null,
      onChanged: (value) {
        BlocProvider.of<RouteHandOverBloc>(context).add(
            SelectTerrainEvent(terrainValue: value));
      },
      items:dataState.terrainList,
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
      maxLine: 3,
      controller: dataState.remarkController,
    );
  }

  Widget _photo({required RouteHandOverFetchDataState dataState}) {
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
                BlocProvider.of<RouteHandOverBloc>(context).add(SelectCameraCaptureEvent());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RouteHandOverBloc>(context).add(SelectGalleryCaptureEvent());
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



  Widget _button({required RouteHandOverFetchDataState dataState}) {
    return dataState.isLoader == false  ?ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<RouteHandOverBloc>(context).add(RouteHandOverSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }


  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

}

