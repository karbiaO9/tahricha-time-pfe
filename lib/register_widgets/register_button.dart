import 'package:flutter/material.dart';

import '../palatte.dart';

class RegisterButton extends StatelessWidget {
  final String buttonText;
  final String email;
  final String password;
  final String name;
  const RegisterButton({
    required this.buttonText,
    required this.email,
    required this.password,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(35)),
      child: TextButton(
          onPressed: () {
            print(email);
            print(name);
            print(password);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              buttonText,
              style: kBodyText1,
            ),
          )),
    );
  }
}
