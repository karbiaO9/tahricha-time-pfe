import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tahricha_app/models/user.dart';

import '../palatte.dart';

class RegisterButton extends StatelessWidget {
  final String buttonText;
  final String email;
  final String password;
  final String name;
  final String location;

  const RegisterButton({
    required this.buttonText,
    required this.email,
    required this.password,
    required this.name,
    required this.location,
    Key? key,
  }) : super(key: key);

  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required String location,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;

      final docUser = FirebaseFirestore.instance.collection('users').doc();

      final localUser = LocalUser(
        id: docUser.id,
        email: email,
        name: name,
        location: location,
        userId: user!.uid,
      );
      final json = localUser.toJson();

      await docUser.set(json);

      Navigator.of(context).pushNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
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
          borderRadius: BorderRadius.circular(35)),
      child: TextButton(
          onPressed: () {
            registerUsingEmailPassword(
                email: email,
                name: name,
                location: location,
                password: password,
                context: context);
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
