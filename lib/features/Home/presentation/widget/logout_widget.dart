import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/styles_widget.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/features/Login/presentation/login_view.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/5,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
      child: Column(
        children: [
          Text(AppString.logout+"?",style: Styles.alert,),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),

          Text(AppString.logoutMessage,style: Styles.texts,),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: ButtonWidget(text: AppString.logout,
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginView()),
                              (route) => false
                      );
                      await PreferenceUtil.clearAll();
                    }
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Flexible(
                flex: 3,
                child: ButtonWidget(
                    text: AppString.cancel,

                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}
