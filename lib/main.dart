import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tahricha_app/screens/forgot_password_page.dart';
import 'package:tahricha_app/screens/home/Myprofile/Editprofile/editprofile.dart';
import 'package:tahricha_app/screens/home/Myprofile/myprofile.dart';
import 'package:tahricha_app/screens/home/filter.dart';
import 'package:tahricha_app/screens/home/home.dart';
import 'package:tahricha_app/screens/home/newpost_page.dart';
import 'package:tahricha_app/screens/home/saved.dart';
import 'package:tahricha_app/screens/login_page.dart';
import 'package:tahricha_app/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
          bool loggedIn=false;

  @override
  Widget build(BuildContext context) {

    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    setState(() {
         loggedIn = user!=null;
    });
  });
    return MaterialApp(
      title: 'Flutter LoginPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:loggedIn ?const HomePage() : const LoginPage(),
      routes: {
        "ForgotPassword": (context) => const ForgotPasswordPAge(),
        "RegisterPage": (context) => const Register_page(),
        "HomePage": (context) => const HomePage(),
        "SavedPage": (context) => const SavedPage(),
                "LogIn": (context) => const LoginPage(),

        "MyProfile": (context) =>  MyProfilePage(),
      //  "EditProfile": (context) => const EditProfilePage(),
        "NewPost": (context) => const NewPostPage(),
        "Filter": (context) => const FilterPage(),
      },
    );
  }
}
