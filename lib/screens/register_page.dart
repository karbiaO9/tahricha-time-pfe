import 'package:flutter/material.dart';
import 'package:tahricha_app/register_widgets/widgets.dart';

import '../palatte.dart';

class Register_page extends StatefulWidget {
  const Register_page({Key? key}) : super(key: key);

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String email = "";
  String name = "";
  String password = "";
  String location = "";

  void onChangedEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedName(String value) {
    setState(() {
      name = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void onChangedLocation(String value) {
    setState(() {
      location = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImagea(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: const Icon(
                    Icons.account_circle_outlined,
                    size: 125,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextInput(
                            icon: Icons.account_circle_outlined,
                            hint: 'Name',
                            inputType: TextInputType.name,
                            inputAction: TextInputAction.next,
                            textController: _nameController,
                            onChanged: onChangedName,
                          ),
                          TextInput(
                            icon: Icons.email_outlined,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            textController: _emailController,
                            onChanged: onChangedEmail,
                          ),
                          TextInput(
                              icon: Icons.location_city,
                              hint: 'Location City',
                              inputType: TextInputType.streetAddress,
                              inputAction: TextInputAction.next,
                              textController: _locationController,
                              onChanged: onChangedLocation),
                          PasswordInput(
                            icon: Icons.lock_outline_rounded,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                            textController: _passwordController,
                            onChanged: onChangedPassword,
                          ),
                          PasswordInput(
                            icon: Icons.lock_outline_rounded,
                            hint: 'Confirm Password',
                            inputAction: TextInputAction.done,
                            textController: _confirmPasswordController,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          RegisterButton(
                            buttonText: 'Register',
                            email: email,
                            name: name,
                            password: password,
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                child: const Text(
                                  'Already Have an account?',
                                  style: kBodyText3,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: const Text(
                              'Login',
                              style: kBodyText4,
                            ),
                          )
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
