// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:attendance_mobile_app/bloc/auth/login/login_bloc.dart';
import 'package:bloc/bloc.dart';

import 'package:attendance_mobile_app/data/data_resource/Auth/auth_datasource.dart';

import '../../../data/models/response/user_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthDataSource authDataSource;
  ProfileBloc(
    this.authDataSource,
  ) : super(ProfileInitial()) {
    on<GetProfileDataEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        final result = await authDataSource.getUserProfile();
        emit(ProfileLoaded(profileResponseModel: result));
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });
  }
}
