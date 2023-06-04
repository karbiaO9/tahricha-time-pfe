import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tahricha_app/register_widgets/widgets.dart';
import 'package:path/path.dart';

import '../palatte.dart';

class Register_page extends StatefulWidget {
  const Register_page({Key? key}) : super(key: key);

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String email = "";
  String name = "";
  String password = "";
  String location = "";
  final _formKey = GlobalKey<FormState>();

  void onChangedEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedName(String value) {
    setState(() {
      name = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void onChangedLocation(String value) {
    setState(() {
      location = value;
    });
  }

  //get image from gallery
  XFile ? img=null;
  File ? f ;
  String fileName="";
  final ImagePicker _picker = ImagePicker();
  Future  getimage() async{
  img = await _picker.pickImage(source: ImageSource.gallery);
  if (img!= null){
    setState(() {
        f = File (img!.path);
  fileName=basename(f!.path);
    });
  }

  }

 String? _checkEmptyField(String value){
    if(value.isEmpty){
      return "Required field";
    }
    return null;

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImagea(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child:  SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                        height: 225, child: Image.asset('assets/images/logo.png')),
                    const SizedBox(
                      height: 15,
                    ),
                    f==null? Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color.fromRGBO(249, 50, 9, .2),
                          border: Border.all(
                            color: const Color.fromRGBO(229, 57, 53, 1),
                            width: 5.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          iconSize: 50,
                          color: Colors.red[600],
                          onPressed: () async{
                            await getimage();
                          },
                        ),
                      ):InkWell(
                        onTap: ()async{
                          await getimage();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Image.file(f!,width: 300,height: 200,fit: BoxFit.cover,)),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextInput(
                                 validator: (v){
                       return _checkEmptyField(v!);
                    },
                                icon: Icons.account_circle_outlined,
                                hint: 'Name',
                                inputType: TextInputType.name,
                                inputAction: TextInputAction.next,
                                textController: _nameController,
                                onChanged: onChangedName,
                              ),
                              TextInput(
                                 validator: (v){
                       return v!.contains('@gmail.com') ? null:'email@gmail.com';
                    },
                                icon: Icons.email_outlined,
                                hint: 'Email',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                textController: _emailController,
                                onChanged: onChangedEmail,
                              ),
                              TextInput(
                                 validator: (v){
                       return _checkEmptyField(v!);
                    },
                                  icon: Icons.location_city,
                                  hint: 'Location City',
                                  inputType: TextInputType.streetAddress,
                                  inputAction: TextInputAction.next,
                                  textController: _locationController,
                                  onChanged: onChangedLocation),
                              PasswordInput(
                                 validator: (v){
                       return _checkEmptyField(v!);
                    },
                                icon: Icons.lock_outline_rounded,
                                hint: 'Password',
                                inputAction: TextInputAction.done,
                                textController: _passwordController,
                                onChanged: onChangedPassword,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 50),
                              RegisterButton(
                                formKey: _formKey,
                                f: f,
                                img: fileName,
                                buttonText: 'Register',
                                email: email,
                                name: name,
                                location: location,
                                password: password,
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 10),
                                   Container(
                                    child: const Text(
                                      'Already Have an account?',
                                      style: kBodyText3,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: const Text(
                                  'Login',
                                  style: kBodyText4,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
