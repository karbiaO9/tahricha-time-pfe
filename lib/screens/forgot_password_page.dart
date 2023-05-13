import 'package:flutter/material.dart';
import 'package:tahricha_app/forgot_password_widgets/widgets.dart';

import 'package:tahricha_app/palatte.dart';

class ForgotPasswordPAge extends StatelessWidget {
  const ForgotPasswordPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImageb(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Forgot Password',
                    style: kHeading,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'Enter your email and will send you instructions on how to reset it.',
                    textAlign: TextAlign.center,
                    style: kBodyText5,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextInput(
                          icon: Icons.email_outlined,
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Sendbutton(
                          buttonText: 'Send',
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
        )
      ],
    );
  }
}
