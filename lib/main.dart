import 'package:flutter/material.dart';
import 'package:tahricha_app/screens/forgot_password_page.dart';
import 'package:tahricha_app/screens/home/Myprofile/Editprofile/changepasswordp.dart';
import 'package:tahricha_app/screens/home/Myprofile/Editprofile/editprofile.dart';
import 'package:tahricha_app/screens/home/categories/categories.dart';
import 'package:tahricha_app/screens/home/Myprofile/myprofile.dart';
import 'package:tahricha_app/screens/home/filter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tahricha_app/screens/home/home.dart';
import 'package:tahricha_app/screens/home/newpost_page.dart';
import 'package:tahricha_app/screens/home/trending%20restaurants/trending.dart';
import 'package:tahricha_app/screens/login_page.dart';
import 'package:tahricha_app/screens/register_page.dart';
import '';
import 'screens/home/Myprofile/Editprofile/editinfop.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LoginPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        "ForgotPassword": (context) => ForgotPasswordPAge(),
        "RegisterPage": (context) => Register_page(),
        "HomePage": (context) => HomePage(),
        "Categories": (context) => CategoriesPage(),
        "Trending": (context) => TrendingPage(),
        "MyProfile": (context) => MyProfilePage(),
        "EditProfile": (context) => EditProfilePage(),
        "EditInfo": (context) => EditInfoPage(),
        "NewPost": (context) => NewPostPage(),
        "Filter": (context) => FilterPage()
      },
    );
  }
}
