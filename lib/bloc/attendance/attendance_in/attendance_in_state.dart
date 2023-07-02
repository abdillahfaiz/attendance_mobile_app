// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_in_bloc.dart';

abstract class AttendanceInState {}

class AttendanceInInitial extends AttendanceInState {}

class AtttendanceInLoading extends AttendanceInState{}

class AttendanceInLoaded extends AttendanceInState {
  AttendanceInResponseModel attendanceInResponseModel;
  AttendanceInLoaded({
    required this.attendanceInResponseModel,
  });
}

class AttendanceInError extends AttendanceInState{
  String messageError;
  AttendanceInError({
    required this.messageError,
  });
}
