// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginLoaded extends LoginState {
  LoginResponseModel loginResponseModel;
  LoginLoaded({
    required this.loginResponseModel,
  });
}

class LoginError extends LoginState {
  String errorMessage;
  LoginError({
    required this.errorMessage,
  });
}
