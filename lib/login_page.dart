import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //Background
      backgroundColor: Colors.blueAccent,
      //Body
      //Wrap: SafeArea Widget - For the text inside the phone
      body: SafeArea(
        child: Column(
          children: [
            //App Logo

            //App Title
            Text('PixelPulse'),

            //Email or Username TxtField

            //Password TxtField

            //Check for terms and conditions

            //Pink Login button

            //----or----

            //Icons ng Socmed
          ],
        ),
      ),
    );
  }
}
