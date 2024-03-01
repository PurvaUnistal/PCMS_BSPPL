import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2.4,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          TextWidget(AppString.logout+"?",
            fontWeight: FontWeight.w600,
            fontSize: AppFont.font_22,),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),

          TextWidget(AppString.logoutMessage,
            textAlign: TextAlign.center,
            color: AppColor.black,
            fontSize: AppFont.font_14,),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          ButtonWidget(text: AppString.logout,
              onPressed: () async {
               /* Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreenPage()),
                        (route) => false
                );
                SharedPreferencesUtils.clearAll();*/
              }
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          ButtonWidget(
              text: AppString.cancel,

              onPressed: () {
                Navigator.of(context).pop();
              }
          ),
        ],
      ),
    );
  }
}
