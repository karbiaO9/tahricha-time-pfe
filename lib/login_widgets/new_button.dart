import 'package:flutter/material.dart';
import 'package:tahricha_app/screens/register_page.dart';

import '../palatte.dart';

class NewButton extends StatelessWidget {
  const NewButton({
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
          border: Border.all(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('RegisterPage');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              buttonText,
              style: kBodyText2,
            ),
          )),
    );
  }
}
