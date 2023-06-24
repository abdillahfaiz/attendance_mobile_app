import 'package:attendance_mobile_app/presentation/pages/dashboard_page_screen.dart';
import 'package:attendance_mobile_app/presentation/pages/login_page.dart';
import 'package:attendance_mobile_app/presentation/pages/present_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Apps',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Montserrat'),
      initialRoute: '/',
      routes: {
        // '/': (context) => const LoginPage(),
        '/dashboard-page': (context) => const DashboardScreenPage(),
        '/kehadiran-page':(context) => const PresentPage()
      },
      home: const LoginPage(),
    );
  }
}
