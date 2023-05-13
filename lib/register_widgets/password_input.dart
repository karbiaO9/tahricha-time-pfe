import 'package:flutter/material.dart';

import '../palatte.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
    required this.textController,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputAction inputAction;
  final TextEditingController textController;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: widget.textController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none,
            hintText: widget.hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                widget.icon,
                color: Colors.black,
              ),
            ),
            hintStyle: kBodyText,
          ),
          obscureText: true,
          style: kBodyText,
          textInputAction: widget.inputAction,
        ),
      ),
    );
  }
}
