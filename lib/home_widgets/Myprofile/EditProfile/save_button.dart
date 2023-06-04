import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tahricha_app/palatte.dart';
import 'package:tahricha_app/screens/home/home.dart';

class SaveButton extends StatelessWidget {
  final String currentPassword;
  final String newPassword;
  const SaveButton({
    Key? key,
    required this.buttonText,
    required this.currentPassword,
    required this.newPassword
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.5),
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          onPressed: () async{
            final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('currentPassword')==currentPassword && newPassword.isNotEmpty){
FirebaseFirestore.instance.collection('users').doc(HomePage.currentUser.id).update({'location': HomePage.currentUser.location,'name':HomePage.currentUser.name}).then((value) =>Navigator.of(context).pushReplacementNamed( "MyProfile"));
              final user = await FirebaseAuth.instance.currentUser!;
              final cred = EmailAuthProvider.credential(
    email: user.email.toString(), password: currentPassword);

user.reauthenticateWithCredential(cred).then((value) {
  user.updatePassword(newPassword).then((_)async {
    print('password updated');
    await prefs.setString('currentPassword', newPassword);
  }).catchError((error) {
    print('password update error');
  });
}).catchError((err) {
 
});
    }else{

 Fluttertoast.showToast(
        msg: 'something get wrong',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
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
