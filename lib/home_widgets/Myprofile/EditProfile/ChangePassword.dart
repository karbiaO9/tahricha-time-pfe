import 'package:flutter/material.dart';

import 'package:tahricha_app/palatte.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
    required this.buttonText,
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('ChangePassword');
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
