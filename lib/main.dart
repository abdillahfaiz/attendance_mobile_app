import 'package:attendance_mobile_app/bloc/attendance/attendance_in/attendance_in_bloc.dart';
import 'package:attendance_mobile_app/bloc/auth/login/login_bloc.dart';
import 'package:attendance_mobile_app/data/data_resource/Attendance/attendance_datasource.dart';
import 'package:attendance_mobile_app/data/data_resource/Auth/auth_datasource.dart';
import 'package:attendance_mobile_app/presentation/pages/dashboard_page_screen.dart';
import 'package:attendance_mobile_app/presentation/pages/login_page.dart';
import 'package:attendance_mobile_app/presentation/pages/present_page.dart';
import 'package:attendance_mobile_app/presentation/testing/login_testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/profile/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => LoginBloc(AuthDataSource())),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => AttendanceInBloc(AttendanceDataSource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance Apps',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Montserrat'),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/dashboard-page': (context) => const DashboardScreenPage(),
          '/kehadiran-page': (context) => const PresentPage()
        },
      ),
    );
  }
}
