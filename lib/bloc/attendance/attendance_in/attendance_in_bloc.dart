// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:attendance_mobile_app/data/data_resource/Attendance/attendance_datasource.dart';
import 'package:attendance_mobile_app/data/data_resource/Auth/auth_datasource.dart';

import '../../../data/models/request/attendance_in_model.dart';
import '../../../data/models/response/attendance_in_response_model.dart';

part 'attendance_in_event.dart';
part 'attendance_in_state.dart';

class AttendanceInBloc extends Bloc<AttendanceInEvent, AttendanceInState> {
  AttendanceDataSource attendanceDataSource;
  AttendanceInBloc(
    this.attendanceDataSource,
  ) : super(AttendanceInInitial()) {
    on<DoAttendanceIn>((event, emit) async {
      try {
        emit(AtttendanceInLoading());
        final result =
            await attendanceDataSource.attendanceIn(event.attendanceInModel);
        emit(AttendanceInLoaded(attendanceInResponseModel: result));
      } catch (e) {
        emit(AttendanceInError(messageError: e.toString()));
      }
    });
  }
}
