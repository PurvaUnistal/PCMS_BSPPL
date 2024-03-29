import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final List<Widget> children;
  const CardWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: AppColor.black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
          child: Column(
              children : children
          ),
        ),
      );
    }
}
