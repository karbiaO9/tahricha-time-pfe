import 'package:flutter/material.dart';
import 'package:tahricha_app/palatte.dart';

import '../login_widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                    height: 225, child: Image.asset('assets/images/logo.png')),
                SizedBox(
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
                          ),
                          PasswordInput(
                            icon: Icons.lock_outline_rounded,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('ForgotPassword');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: kBodyText4,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 50),
                          LoginButton(
                            buttonText: 'Login',
                          ),
                          SizedBox(height: 50),
                          NewButton(
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
