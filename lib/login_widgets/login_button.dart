import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palatte.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final String email;
  final String password;
  final GlobalKey<FormState> formKey ;


  const LoginButton({
    required this.buttonText,
    required this.email,
    required this.password,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  Future<void> login(BuildContext context)async{
  String error="";
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  Navigator.pushNamed(context, 'HomePage');
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    error='No user found for that email.';
  } else if (e.code == 'wrong-password') {
    error='Wrong password provided for that user.';
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
} catch (e) {
  print(e);
}
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
          onPressed: () async{
            if(formKey.currentState!.validate()){
            await login(context);
            }
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
