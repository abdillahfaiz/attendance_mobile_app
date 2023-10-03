import 'package:attendance_mobile_app/data/models/response/auth/profile_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileState.initial());

  Future<void> getProfile () async {
    
  }
}
