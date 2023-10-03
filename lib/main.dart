import 'package:attendance_mobile_app/bloc/auth/login/login_bloc.dart';
import 'package:attendance_mobile_app/data/data_resource/Auth/auth_datasource.dart';
import 'package:attendance_mobile_app/presentation/pages/att_permission_page.dart';
import 'package:attendance_mobile_app/presentation/pages/dashboard_page_screen.dart';
import 'package:attendance_mobile_app/presentation/pages/in_attendance.dart';
import 'package:attendance_mobile_app/presentation/pages/login_page.dart';
import 'package:attendance_mobile_app/presentation/pages/out_attendance.dart';
import 'package:attendance_mobile_app/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/profile/profile_bloc.dart';

void main() {
  runApp(const MyApp());
  //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: Color(0xffFF7171), // navigation bar color
  //   statusBarColor: Color(0xffFF7171), // status bar color
  // ));
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
          '/kehadiran-page': (context) => const AttendanceInPage(),
          '/absen-pulang-page': (context) => const AttendanceOutPage(),
          '/izin-page': (context) => const AttendancePermissionPage(),
          '/profile-page': (context) => const ProfilePage()
        },
      ),
    );
  }
}
