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
  final _formKey = GlobalKey<FormState>();

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
                      Form(
                        key:_formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              validator: (v){
                                if(v!.isEmpty||!v.contains('@gmail.com'))
                                  return "email@gmail.com";
                                  return null;
                                
                              },
                              icon: Icons.email_outlined,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              textController: _emailController,
                              onChanged: onChangedEmail,
                            ),
                            PasswordInput(
                               validator: (v){
                                if(v!.isEmpty)
                                  return "password required";
                                  return null;
                                
                              },
                              icon: Icons.lock_outline_rounded,
                              hint: 'Password',
                              inputAction: TextInputAction.done,
                              textController: _passwordController,
                              onChanged: onChangedPassword,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          LoginButton(
                            formKey: _formKey,
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
