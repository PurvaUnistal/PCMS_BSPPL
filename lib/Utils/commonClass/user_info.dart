

import 'package:bsppl/features/Login/domain/model/login_model.dart';

class UserInfo {

  static UserInfo? instance;
  LoginModel? userData;

  static UserInfo? instanceInit(){
    instance ??= UserInfo();
    return instance;
  }

   setUserInfo(LoginModel useData){
     userData ??= LoginModel();
     userData = useData;
  }
}