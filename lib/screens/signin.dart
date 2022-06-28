import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/forget_password.dart';
import 'package:chat_app/screens/get_started.dart';
import 'package:chat_app/screens/mainscreen.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "SigIn_screen";
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/signup1.svg",
                  color: kLightColor,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55, bottom: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          color: kTextDarkColor,
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          onPressed: () {
                            Navigator.pushNamed(context, GetStarted.id);
                          },
                          icon: const Icon(Icons.keyboard_backspace),
                        ),
                      ),
                    ),
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: kTextDarkColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    ctnFace(),
                    ctnGG(),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 35),
                      child: Text(
                        'OR LOG IN WITH EMAIL',
                        style: TextStyle(color: kDarkColor, fontSize: 14),
                      ),
                    ),
                    textField()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding ctnGG() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {
          print('ok');
        },
        child: SvgPicture.asset("assets/images/gg.svg"),
      ),
    );
  }

  Padding ctnFace() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: InkWell(
        onTap: () {
          print('ok');
        },
        child: SvgPicture.asset("assets/images/fb.svg"),
      ),
    );
  }

  Column textField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: kTextLightColor)),
              hintText: 'Email address',
              hintStyle: const TextStyle(color: kDarkColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              fillColor: kTextLightColor,
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: kTextLightColor)),
              hintStyle: const TextStyle(color: kDarkColor),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              fillColor: kTextLightColor,
              filled: true,
            ),
          ),
        ),
        LogInButton(),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom:50 ),
          child: forgotPw(),
        ),
        const textSignUp()
      ],
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 374,
      child: Expanded(
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34)),
          onPressed: () {
            Navigator.pushNamed(context, MainScreen.id);
          },
          child: const Text(
            'LOG IN',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          color: kColor,
        ),
      ),
    );
  }
}
class forgotPw extends StatelessWidget {
  const forgotPw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(
        text: TextSpan(
            text: 'Forgot Password?',
            style: const TextStyle(color: kTextDarkColor, fontSize: 14),
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushNamed(context, ForgotPassword.id);
            }));
  }
}


class textSignUp extends StatelessWidget {
  const textSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
          text: 'Don\'t have account?',
          style: const TextStyle(color: kDarkColor, fontSize: 14  ),
          children: [
            TextSpan(text: ' Sign up',
                style: const TextStyle(color: kColor, fontSize: 14),
                recognizer: TapGestureRecognizer() ..onTap = () {
                  Navigator.pushNamed(context, SignUp.id);
                }
            )
          ]
      ),
    );
  }
}

