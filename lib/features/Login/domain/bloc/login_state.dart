import 'package:bsppl/features/Login/domain/model/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginFetchDataState extends LoginInitState {
  final bool isPageLoader;
  final bool isPassword;
  final  LoginModel loginModel;

  LoginFetchDataState({
    required this.isPageLoader,
    required this.isPassword,
    required this.loginModel,
  });
  @override
  List<Object?> get props => [
        isPageLoader,
        isPassword,
    loginModel,
      ];
}
