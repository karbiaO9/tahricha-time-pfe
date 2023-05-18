import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palatte.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final String email;
  final String password;

  const LoginButton({
    required this.buttonText,
    required this.email,
    required this.password,
    Key? key,
  }) : super(key: key);

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await prefs.setString('userId', user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.5),
          border: Border.all(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          onPressed: () {
            signInUsingEmailPassword(
                email: email, password: password, context: context);
            Navigator.pushNamed(context, 'HomePage');
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
