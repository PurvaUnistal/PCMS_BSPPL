import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:flutter/material.dart';

class ContractorRowPage extends StatefulWidget {
  const ContractorRowPage({Key? key}) : super(key: key);

  @override
  State<ContractorRowPage> createState() => _ContractorRowPageState();
}

class _ContractorRowPageState extends State<ContractorRowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _itemBuilder(),
    );
  }

  Widget _itemBuilder(){
    return Container(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child : Column(
          children: [
            _verticalSpace(),
            _dateController(),
            _verticalSpace(),
            _alignmentDropdown(),
            _verticalSpace(),
            _chainageFromController(),
            _verticalSpace(),
            _chainageToController(),
            _verticalSpace(),
            _weatherDropDown(),
            _verticalSpace(),
            _jointTypeDropDown(),
            _verticalSpace(),
            _jointNumberDropDown(),
            _verticalSpace(),
            _gpsCoordinateNorthController(),
            _verticalSpace(),
            _gpsCoordinateEastController(),
            _verticalSpace(),
            _elevationPipetopController(),
            _verticalSpace(),
            _natureGroundLeveController(),
            _verticalSpace(),
            _coverController(),
            _verticalSpace(),
            _activityRemark(),
            _verticalSpace(),
            _photo(),
            _verticalSpace(),
            _verticalSpace(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _dateController() {
    return TextFieldWidget(
      label: AppString.date,
      hintText: AppString.date,
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
      // controller: dataState.dateController,
      onTap: () {
      },
    );
  }

  Widget _reportNumberController() {
    return TextFieldWidget(
      label: AppString.reportNumber,
      hintText: AppString.reportNumber,
      //  controller: dataState.reportNumberController,
    );
  }


  Widget _alignmentDropdown() {
    return DropdownWidget(
      star: AppString.star,
      label: AppString.selectAlignment,
      hint: AppString.selectAlignment,
      dropdownValue:"",
      onChanged: (value) {
      },
      items:[],
    );
  }

  Widget _weatherDropDown() {
    return DropdownWidget(
      hint: AppString.selectWeather,
      dropdownValue:"",
      onChanged: (value) {
      },
      items:[],
    );
  }

  Widget _jointTypeDropDown() {
    return DropdownWidget(
      hint: AppString.selectJointType,
      dropdownValue:"",
      onChanged: (value) {
      },
      items:[],
    );
  }

  Widget _jointNumberDropDown() {
    return  DropdownWidget(
      hint: AppString.selectJointNumber,
      dropdownValue:"",
      onChanged: (value) {
      },
      items:[],
    );
  }

  Widget _gpsCoordinateNorthController() {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.gpsCoordinateNorth,
      hintText: AppString.gpsCoordinateNorth,
      //   controller: dataState.gpsCoordinateNorthController,
    );
  }

  Widget _gpsCoordinateEastController() {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.gpsCoordinateEast,
      label: AppString.gpsCoordinateEast,
      // controller: dataState.gpsCoordinateEastController,
    );
  }


  Widget _elevationPipetopController() {
    return TextFieldWidget(
      label: AppString.elevationPipeTop,
      hintText: AppString.elevationPipeTop,
      //  controller: dataState.elevationPipetopController,
    );
  }


  Widget _natureGroundLeveController() {
    return TextFieldWidget(
      label: AppString.naturalGroundLeve,
      hintText: AppString.naturalGroundLeve,
      //  controller: dataState.natureGroundLeveController,
    );
  }

  Widget _coverController() {
    return TextFieldWidget(
      label: AppString.cover,
      hintText: AppString.cover,
      // controller: dataState.coverController,
    );
  }

  Widget _chainageFromController() {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      label: AppString.chainageFrom,
      hintText: AppString.chainageFrom,
      // controller: dataState.chainageFromController,
    );
  }

  Widget _chainageToController() {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: AppString.chainageTo,
      label: AppString.chainageTo,
      //    controller: dataState.chainageToController,
    );
  }

  Widget _activityRemark() {
    return TextFieldWidget(
      maxLength: 3,
      label: AppString.activityRemark,
      hintText: AppString.activityRemark,
      // controller: dataState.activityRemarkController,
    );
  }

  Widget _photo() {
    return SizedBox(
        width: MediaQuery.of(context).size.width/3,
        height:MediaQuery.of(context).size.width/3,
        child: InkWell(
            onTap: () {
            },
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Icon(Icons.photo_camera_back_outlined),),
                Padding(
                  padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: TextWidget("Photo",
                    fontSize: AppFont.font_12,
                    color: AppColor.grey,),
                ),
              ],
            ))
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

