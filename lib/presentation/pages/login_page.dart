import 'package:attendance_mobile_app/bloc/auth/login/login_bloc.dart';
import 'package:attendance_mobile_app/presentation/config/button_box_decoration.dart';
import 'package:attendance_mobile_app/presentation/config/color_config.dart';
import 'package:attendance_mobile_app/presentation/config/text_style.dart';
import 'package:attendance_mobile_app/presentation/utils/form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local_resource/auth_local_storage.dart';
import '../../data/models/request/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  bool passwordChecked = true;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void isLogin() async {
    final isTokenExist = await AuthLocalStorage().isTokenExist();
    if (isTokenExist) {
      Navigator.pushNamed(context , '/dashboard-page');
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
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Column(
                  children: [
                    Text(
                      'LOGIN',
                      style: mainTitle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    FormCustom(
                        textEditincontroller: emailController,
                        hintText: 'Email Address',
                        formIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false),
                    const SizedBox(
                      height: 17.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 55,
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: mainColor),
                      ),
                      child: TextField(
                        controller: passController,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: mainColor,
                            ),
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passwordChecked = !passwordChecked;
                                  });
                                },
                                child: const Icon(Icons.visibility_off))),
                        obscureText: passwordChecked,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                activeColor: mainColor,
                                value: isChecked,
                                onChanged: (newBool) {
                                  setState(() {
                                    isChecked = newBool;
                                  });
                                }),
                            const Text(
                              'Remember Password',
                              style: regularText,
                            ),
                          ],
                        ),
                        Text(
                          'Forgot your password?',
                          style: regularText.copyWith(color: secondaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const CircularProgressIndicator();
                        }
                        return InkWell(
                          onTap: () {
                            final requestLogin = LoginModel(
                                email: emailController.text,
                                password: passController.text);
                            context
                                .read<LoginBloc>()
                                .add(DoLoginEvent(loginModel: requestLogin));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.20,
                            height: 60,
                            decoration: BoxDecorationCustom()
                                .buttonRed
                                .copyWith(
                                    borderRadius: BorderRadius.circular(60)),
                            child: Center(
                              child: Text('Login',
                                  style: mainTitle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        );
                      },
                       listener: (context, state) {
                        ((context, state) {
                          if (state is LoginLoaded) {
                            emailController.clear();
                            passController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Succes Login with token ${state.loginResponseModel.accesToken.toString()}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            Navigator.pushNamed(
                                context, '/dashboard-page');
                          }
                        });
                      },
                    )
                  ],
                ),
                const Text('Created with ❤️ by Faiz')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
