// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:attendance_mobile_app/data/models/response/login_response_model.dart';
import 'package:bloc/bloc.dart';

import 'package:attendance_mobile_app/data/data_resource/Auth/auth_datasource.dart';
import 'package:attendance_mobile_app/data/models/request/login_model.dart';

import '../../../data/local_resource/auth_local_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthDataSource authDataSource;
  LoginBloc(
    this.authDataSource,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDataSource.doLogin(event.loginModel);
        // await AuthLocalStorage().saveToken(result.accesToken);
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        emit(LoginError(errorMessage: '$e'));
      }
    });
  }
}
