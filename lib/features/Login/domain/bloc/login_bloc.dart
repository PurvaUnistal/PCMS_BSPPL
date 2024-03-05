import 'dart:developer';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/preference_utils.dart';
import 'package:bsppl/Utils/routes/routes_name.dart';
import 'package:bsppl/Utils/utils.dart';
import 'package:bsppl/features/Login/domain/bloc/login_event.dart';
import 'package:bsppl/features/Login/domain/bloc/login_state.dart';
import 'package:bsppl/features/Login/domain/model/login_model.dart';
import 'package:bsppl/features/Login/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<LoginPageLoadingEvent>(_pageLoad);
    on<LoginSetEmailIdEvent>(_setEmailId);
    on<LoginSetPasswordEvent>(_setPassword);
    on<LoginHideShowPasswordEvent>(_setHideShowPassword);
    on<LoginSubmitDataEvent>(_setSubmitLoginData);
  }

  String emailId = "";
  String password = "";
  String deviceId = "";

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isPassword = false;
  bool get isPassword => _isPassword;

  LoginModel _loginModel = LoginModel();
  LoginModel get loginModel => _loginModel;

  _pageLoad(LoginPageLoadingEvent event, emit) async {
    emailId = "";
    password = "";
    _isPassword = true;
    _isPageLoader = false;
    _eventCompleted(emit);
  }

  _setEmailId(LoginSetEmailIdEvent event, emit) {
    emailId = event.emailId.toString().replaceAll(" ", "");
  }

  _setPassword(LoginSetPasswordEvent event, emit) {
    password = event.password.toString().replaceAll(" ", "");
  }

  _setHideShowPassword(LoginHideShowPasswordEvent event, emit) {
    _isPassword = event.isHideShow;
    _eventCompleted(emit);
  }

  _setSubmitLoginData(LoginSubmitDataEvent event, emit) async {
    var validationCheck = await LoginHelper.textFieldValidation(
        email: emailId, password: password, context: event.context);
    if (validationCheck == true) {
      try {
        _isPageLoader = true;
        _eventCompleted(emit);
        var res = await LoginHelper.loginData(
            emailId: emailId, password: password, context: event.context);
        if (res != null) {
          _isPageLoader = false;
          _eventCompleted(emit);
          if (res.posts?.status.type == "Success") {
            _loginModel = res;
            Utils.successSnackBar(msg:
                "${res.posts!.status.type.toString()}fully Login",
              context:   event.context);
            await PreferenceUtil.setString(key: PreferenceValue.email, value: emailId.toString());
            await PreferenceUtil.setString(key: PreferenceValue.password, value: password.toString());
            await PreferenceUtil.setString(key: PreferenceValue.userId, value: res.posts!.status.value.split(",")[0].toString());
            await PreferenceUtil.setString(key: PreferenceValue.userName, value: res.posts!.status.value.split(",")[1].toString());
            await PreferenceUtil.setString(key: PreferenceValue.grpType, value: res.posts!.status.value.split(",")[2].toString());
            await PreferenceUtil.setString(key: PreferenceValue.sectionId, value: res.posts!.status.value.split(",")[3].toString());
            Navigator.pushReplacementNamed(
                event.context, RoutesName.homePage);
          } else if (res.posts!.status.type == "Failed") {
            return Utils.errorSnackBar(msg: res.posts!.status.value.toString(),context:  event.context);
          }
        } else {
          _isPageLoader = false;
          _eventCompleted(emit);
        }
      } catch (e) {
        _isPageLoader = false;
        _eventCompleted(emit);
        log(e.toString());
      }
    }
    _eventCompleted(emit);
  }

  _eventCompleted(Emitter<LoginState> emit) {
    emit(LoginFetchDataState(
      isPageLoader: isPageLoader,
      isPassword: isPassword,
      loginModel: loginModel,
    ));
  }
}


