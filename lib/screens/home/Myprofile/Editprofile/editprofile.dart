import 'package:flutter/material.dart';
import 'package:tahricha_app/home_widgets/Myprofile/EditProfile/save_button.dart';
import 'package:tahricha_app/screens/home/home.dart';
import '../../../../home_widgets/Newpost/text_Input.dart';
import '../../../../models/user.dart';
import '../../../../palatte.dart';


class EditProfilePage extends StatefulWidget {
  LocalUser user;
   EditProfilePage({Key? key,required this.user}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
 final TextEditingController _name=TextEditingController();
  final TextEditingController _location=TextEditingController();
   final TextEditingController _opassword=TextEditingController();
  final TextEditingController _npassword=TextEditingController();
@override
  void initState() {
    _name.text=widget.user.name;
    _location.text=widget.user.location;
    _npassword.text="";
    _opassword.text="";
    super.initState();
  }
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 100),
                        TextInput(
                          textController:_name,
                          hint: 'Name',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next, icon: Icons.account_circle_rounded, onChanged: (string ) {
                                                      HomePage.currentUser.name=string;
            
                          },
                          
                        ),
                     
                       const SizedBox(
                          height: 15,
                        ),
                        TextInput(
                          textController: _location,
                          onChanged: (string){
                            HomePage.currentUser.location=string;
                          },
                          icon: Icons.location_pin,
                          hint: 'Location City',
                          inputType: TextInputType.streetAddress,
                          inputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                          TextInput(
                          textController: _opassword,
                          onChanged: (string){
                           
                          },
                          icon: Icons.lock,
                          hint: 'Current password',
                          inputType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                       
                          TextInput(
                          textController: _npassword,
                          onChanged: (string){
                           
                          },
                          icon: Icons.lock,
                          hint: 'New password',
                          inputType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.next,
                        ),
                   const SizedBox(
                          height: 15,
                        ),
                       SaveButton(buttonText: 'save',currentPassword:_opassword.text,newPassword:_npassword.text)
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
