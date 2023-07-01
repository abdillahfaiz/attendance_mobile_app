part of 'attendance_in_bloc.dart';

@immutable
abstract class AttendanceInState {}

class AttendanceInInitial extends AttendanceInState {}

class AtttendanceInLoading extends AttendanceInState{}

class AttendanceInLoaded extends AttendanceInState{}
