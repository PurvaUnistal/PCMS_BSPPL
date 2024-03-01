import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:flutter/material.dart';

class SnackBarSuccessWidget {

  final BuildContext context;
  SnackBarSuccessWidget(this.context);

  show({required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: TextWidget(
      message, fontSize: AppFont.font_14,
      color: AppColor.white,), backgroundColor: AppColor.appBlueColor,));
  }
}