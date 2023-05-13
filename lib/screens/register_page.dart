import 'package:flutter/material.dart';
import 'package:tahricha_app/register_widgets/widgets.dart';

import '../palatte.dart';

class Register_page extends StatelessWidget {
  const Register_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImagea(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 125,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
                SizedBox(
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
                          ),
                          TextInput(
                            icon: Icons.email_outlined,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                          ),
                          TextInput(
                            icon: Icons.location_city,
                            hint: 'Location City',
                            inputType: TextInputType.streetAddress,
                            inputAction: TextInputAction.next,
                          ),
                          PasswordInput(
                            icon: Icons.lock_outline_rounded,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                          ),
                          PasswordInput(
                            icon: Icons.lock_outline_rounded,
                            hint: 'Confirm Password',
                            inputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 50),
                          RegisterButton(
                            buttonText: 'Register',
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                child: Text(
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
                            child: Text(
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
