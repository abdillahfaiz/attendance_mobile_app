import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'attendance_in_event.dart';
part 'attendance_in_state.dart';

class AttendanceInBloc extends Bloc<AttendanceInEvent, AttendanceInState> {
  AttendanceInBloc() : super(AttendanceInInitial()) {
    on<AttendanceInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
