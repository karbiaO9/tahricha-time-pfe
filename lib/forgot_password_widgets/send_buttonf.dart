import 'package:flutter/material.dart';

import '../palatte.dart';

class Sendbutton extends StatelessWidget {
  const Sendbutton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.5),
          border: Border.all(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TextButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: kBodyText,
            )),
      ),
    );
  }
}
