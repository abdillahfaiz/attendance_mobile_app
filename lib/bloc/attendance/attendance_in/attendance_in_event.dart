// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_in_bloc.dart';

abstract class AttendanceInEvent {}

class DoAttendanceIn extends AttendanceInEvent {
  AttendanceInModel attendanceInModel;
  DoAttendanceIn({
    required this.attendanceInModel,
  });
}
