import 'package:flutter/material.dart';
import 'package:pixelpulse/main_page.dart';
import 'package:pixelpulse/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(171, 252, 88, 255), // Top color
              Color.fromARGB(255, 35, 19, 255), // Bottom color
            ],
          ),
        ),
        //Body
        //Wrap: SafeArea Widget - For the text inside the phone
        child: SafeArea(
          //Center - For contents center
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //App Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email or Username',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
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
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0),

                  //Check for terms and conditions
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text('I read and agree to ',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w300,
                                color: Colors.white)),
                        Text('Terms and Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  //Pink Login button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(200, 40),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 255, 16, 219),
                      elevation: 5, // Add a shadow
                    ),
                  ),
                  SizedBox(height: 20),

                  //----or----
                  Text(
                      '----------------------------- OR -----------------------------',
                      style: TextStyle(color: Colors.white)),

                  //Icons in Socmed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset('assets/facebookicon.png',
                            width: 30, height: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset('assets/googleicon.png',
                            width: 30, height: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset('assets/instagramicon.png',
                            width: 30, height: 30),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  //Bottom sheet button
                  TextButton(
                    onPressed: () {
                      bottomSheetSignIn1(context);
                    },
                    child: Text('Don\'t have an account?'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
