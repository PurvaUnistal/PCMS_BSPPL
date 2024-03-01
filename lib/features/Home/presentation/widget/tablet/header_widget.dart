import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final FetchHomeDataState dataState;
  const HeaderWidget({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          color: AppColor.white,
          boxShadow: const [
            BoxShadow(
            color: Colors.grey,
              offset: Offset(2, 0),
              blurRadius: 3.0,
          ),]
      ),
      height: MediaQuery.of(context).size.height * 0.13,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextWidget(dataState.title,
                color: AppColor.black, fontSize: AppFont.font_14, fontWeight: FontWeight.w700,),
            ),
            dataState.actionButtonWidget
          ],
        ),
      ),
    );
  }
}
