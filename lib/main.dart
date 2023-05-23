import 'package:flutter/material.dart';
import 'package:tahricha_app/screens/forgot_password_page.dart';
import 'package:tahricha_app/screens/home/Myprofile/Editprofile/changepasswordp.dart';
import 'package:tahricha_app/screens/home/Myprofile/Editprofile/editprofile.dart';
import 'package:tahricha_app/screens/home/Myprofile/myprofile.dart';
import 'package:tahricha_app/screens/home/filter.dart';
import 'package:tahricha_app/screens/home/home.dart';
import 'package:tahricha_app/screens/home/newpost_page.dart';
import 'package:tahricha_app/screens/home/saved.dart';
import 'package:tahricha_app/screens/login_page.dart';
import 'package:tahricha_app/screens/register_page.dart';
import 'screens/home/Myprofile/Editprofile/editinfop.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LoginPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
      routes: {
        "ForgotPassword": (context) => const ForgotPasswordPAge(),
        "RegisterPage": (context) => const Register_page(),
        "HomePage": (context) => const HomePage(),
        "SavedPage": (context) => const SavedPage(),
        "MyProfile": (context) => const MyProfilePage(),
        "EditProfile": (context) => const EditProfilePage(),
        "EditInfo": (context) => const EditInfoPage(),
        "NewPost": (context) => const NewPostPage(),
        "Filter": (context) => const FilterPage(),
        "ChangePassword": (context) => const ChangePassowrdPage()
      },
    );
  }
}
