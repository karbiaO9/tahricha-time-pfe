import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tahricha_app/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


import '../palatte.dart';

class RegisterButton extends StatelessWidget {
  final String buttonText;
  final String email;
  final String password;
  final String name;
  final String location;
  final String img;
  final File ? f;
  final GlobalKey<FormState> formKey;


  const RegisterButton({
    required this.formKey,
    required this.f,
    required this.img,
    required this.buttonText,
    required this.email,
    required this.password,
    required this.name,
    required this.location,
    Key? key,
  }) : super(key: key);

  Future<void> registerUsingEmailPassword({
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
       final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('photos/${img+DateTime.now().toString()}');
    await ref.putFile(f!);
    String url = await ref.getDownloadURL();

      final localUser = LocalUser(
        likes: [],
        pdp: url,
        dislikes: [],
        id: docUser.id,
        email: email,
        name: name,
        location: location,
        userId: user!.uid,
      );
      final json = localUser.toJson();

      await docUser.set(json);

      Navigator.of(context).pushNamed('RegisterPage');
    } on FirebaseAuthException catch (e) {
      String error="";
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
      }
        Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
    }
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
            if( formKey.currentState!.validate()&&f!=null){
            registerUsingEmailPassword(
                email: email,
                name: name,
                location: location,
                password: password,
                context: context);
          }},
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
