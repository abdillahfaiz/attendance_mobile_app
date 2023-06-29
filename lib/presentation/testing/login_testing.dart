import 'package:attendance_mobile_app/bloc/auth/login/login_bloc.dart';
import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/request/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTesting extends StatefulWidget {
  const LoginTesting({super.key});

  @override
  State<LoginTesting> createState() => _LoginTestingState();
}

class _LoginTestingState extends State<LoginTesting> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void isLogin() async {
    final isTokenExist = await AuthLocalStorage().isTokenExist();
    if (isTokenExist) {
      Navigator.pushReplacementNamed(context, '/dashboard-page');
    }
  }

  @override
  void initState() {
    super.initState();

    isLogin();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Email'),
                controller: emailController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Password'),
                controller: passController,
              ),
              BlocConsumer<LoginBloc, LoginState>(builder: ((context, state) {
                if (state is LoginLoading) {
                  return const CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    final requestLogin = LoginModel(
                        email: emailController.text,
                        password: passController.text);
                    context
                        .read<LoginBloc>()
                        .add(DoLoginEvent(loginModel: requestLogin));
                  },
                  child: const Text('Login'),
                );
              }), listener: ((context, state) {
                if (state is LoginLoaded) {
                  emailController.clear();
                  passController.clear();
                  // showTopSnackBar(
                  //   context as OverlayState,
                  //   CustomSnackBar.success(
                  //     message:
                  //         "Good job, your release is successful. Have a nice day",
                  //   ),

                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Succes Login with token ${state.loginResponseModel.accesToken.toString()}',
                          style:  TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  );
                  Navigator.pushReplacementNamed(context, '/dashboard-page');
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
