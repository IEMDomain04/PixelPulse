// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background
      backgroundColor: Colors.blueAccent,
      //Body
      //Wrap: SafeArea Widget - For the text inside the phone
      body: SafeArea(
        //Center - For contents center
        child: Center(
          child: Column(
            children: [
              //App Logo
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  'assets/pixelpulseicon.png',
                  width: 150, // Set the width as needed
                  height: 180, // Set the height as needed
                ),
              ),
              //App Title
              //SizedBox for padding
              SizedBox(height: 0),
              Text(
                'PixelPulse',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
              SizedBox(height: 30),

              //Email or Username TxtField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 72, 18, 255),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 3.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email or Username',
                        hintStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Password TxtField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 72, 18, 255),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 3.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Check for terms and conditions
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I read and agree to ',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                  Text('Terms and Conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white)),
                ],
              )

              //Pink Login button

              //----or----

              //Icons ng Socmed
            ],
          ),
        ),
      ),
    );
  }
}
