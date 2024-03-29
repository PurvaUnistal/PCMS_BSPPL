import 'package:bsppl/Utils/common_widget/styles_widget.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String? star;
  final String title;
  const RowWidget({super.key, this.star, required this.title});

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(star ?? "", style: Styles.stars,),
          Text(title,style: Styles.title,)
        ],
      );
  }
}
