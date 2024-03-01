import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:flutter/material.dart';

class ServiceCenterNetworkWidget extends StatelessWidget {
  const ServiceCenterNetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 3,
        shadowColor: Colors.purple[400],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget("Service Center Network Beetel",
                color: AppColor.black, fontSize: AppFont.font_14,
                fontWeight: FontWeight.w700,),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
            ],
          ),
        ));
  }
}
