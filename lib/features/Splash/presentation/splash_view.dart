import 'dart:async';

import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/global_constant.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/Utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    toLogin();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  Future<void> toLogin() async {
    await PreferenceUtil().init();
    String email = await PreferenceUtil.getString(key: PreferenceValue.email);
    String password = await PreferenceUtil.getString(key: PreferenceValue.password);
    Timer(const Duration(seconds: 2), () async {
        if (email.isNotEmpty && password.isNotEmpty) {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.homePage,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            RoutesName.loginView,
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.appLogo,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
