import 'package:flutter/material.dart';
import 'package:tahricha_app/palatte.dart';

import '../login_widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = "";
  String password = "";

  void onChangedEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                    height: 225, child: Image.asset('assets/images/logo.png')),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextInput(
                            icon: Icons.email_outlined,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            textController: _emailController,
                            onChanged: onChangedEmail,
                          ),
                          PasswordInput(
                            icon: Icons.lock_outline_rounded,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                            textController: _passwordController,
                            onChanged: onChangedPassword,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          LoginButton(
                            buttonText: 'Login',
                            email: email,
                            password: password,
                          ),
                          const SizedBox(height: 50),
                          const NewButton(
                            buttonText: 'Create new account',
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
