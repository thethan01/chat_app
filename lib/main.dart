import 'package:chat_app/screens/forget_password.dart';
import 'package:chat_app/screens/get_started.dart';
import 'package:chat_app/screens/mainscreen.dart';
import 'package:chat_app/screens/signin.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetStarted(),
      routes: {
        SignIn.id : (context) => const SignIn(),
        SignUp.id: (context) => const SignUp(),
        GetStarted.id : (context) => const GetStarted(),
        ForgotPassword.id : (context) => const ForgotPassword(),
        MainScreen.id : (context) => const MainScreen(),

      },
    );
  }
}

