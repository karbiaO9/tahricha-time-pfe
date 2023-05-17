import 'package:flutter/material.dart';
import '../../../../palatte.dart';
import 'package:tahricha_app/home_widgets/Myprofile/EditProfile/widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(249, 50, 9, .2),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Edit Profile',
            textAlign: TextAlign.center,
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 25),
            EditInfo(
              buttonText: 'Edit Information',
            ),
            SizedBox(height: 25),
            ChangePassword(
              buttonText: 'Change Password',
            ),
          ],
        )),
      ),
    );
  }
}
