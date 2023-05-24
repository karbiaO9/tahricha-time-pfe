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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 100),
                      TextInput(
                        hint: 'Name',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextInput(
                        hint: 'SurName',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextInput(
                        hint: 'Location City',
                        inputType: TextInputType.streetAddress,
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      PasswordInput(
                        hint: 'Old password',
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      PasswordInput(
                        hint: 'New password',
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SaveButton(
                        buttonText: 'save',
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
