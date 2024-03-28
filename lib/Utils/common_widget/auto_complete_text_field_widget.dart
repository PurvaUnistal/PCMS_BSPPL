import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/styles_widget.dart';
import 'package:flutter/material.dart';

class AutoCompleteTextFieldWidget extends StatelessWidget {
   TextEditingController controller;
   List<String> suggestions;
   GlobalKey<AutoCompleteTextFieldState<String>> keys;
   Widget? suffixIcon;
   Widget? prefixIcon;
   String? hintText;
   String? star;
   String? label;
   final int? maxLine;

   AutoCompleteTextFieldWidget({super.key,
     required this.controller,
     required this.suggestions,
     required this.keys,
     this.suffixIcon,
     this.prefixIcon,
    this.star,
    this.label,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleAutoCompleteTextField(
      controller: controller,
      suggestions: suggestions,
      key: keys,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
         prefixIcon: prefixIcon,
         hintText: hintText,
        label: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
             Flexible(flex : 1,child: Text(star??"",  style:Styles.stars)),
               Flexible(flex : 6,child: Text(label  ?? "", style:Styles.labels),
          ),
          ],
        ),
      ),
      hintStyle: Styles.labels,
      fillColor: Colors.white,
      contentPadding:  EdgeInsets.symmetric(horizontal: 5.0, vertical: maxLine != null ? 8 : 0),
      border: border,
      focusedBorder: border,
      disabledBorder: border,
      enabledBorder: border,
    )
    );
  }
   OutlineInputBorder border = OutlineInputBorder(
     borderRadius: BorderRadius.circular(5.0),
     borderSide: BorderSide(color: AppColor.appBlueColor, style: BorderStyle.solid, width: 0.80),
   );
}
