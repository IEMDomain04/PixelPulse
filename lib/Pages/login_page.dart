import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pixelpulse/Pages/main_page.dart';
import 'package:pixelpulse/Pages/sign_up.dart';
import 'package:pixelpulse/signup.dart';

// LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Terms and Condition Checking.
  bool isChecked = false;

  // Username Controller.
  final _usernameController = TextEditingController();

  // Password Controller.
  final _passwordController = TextEditingController();

  // Email validation regex pattern
  bool isValidEmail(String email) {
    String pattern = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // Password validation (example: at least 6 characters, includes a number and a letter)
  bool isValidPassword(String password) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  // For Firebase Authentication
  Future<void> signIn() async {
    final String email = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to the MainPage if Authenticated.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
      // User Validation for the successful entry.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in Successful!')),
      );
    } catch (e) {
      //User Validations.
      if (email.isEmpty && password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter email address and Password')),
        );
        return;
      }

      //Empty User Email.
      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter your email address')),
        );
        return;
      }

      //Empty User Password.
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter your password')),
        );
        return;
      }

      //Wrong email format.
      if (!isValidEmail(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid email address')),
        );
        return;
      }

      //Incorrect Password.
      if (!isValidPassword(password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect Password')),
        );
        return;
      }

      //All Wrong, cant sign in.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in')),
      );
    }
  }

  // Dispose for Data Organization.
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose(); // Corrected dispose method
  }

  // FrontEnd Code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Color.
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // App Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'assets/pixelpulseicon.png',
                      width: 150, // Set the width as needed
                      height: 180, // Set the height as needed
                    ),
                  ),

                  // App Title
                  SizedBox(height: 0),
                  Text(
                    'PixelPulse',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Email or Username TxtField
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
                          controller: _usernameController,
                          textInputAction: TextInputAction.go,
                          cursorColor: Colors.white,
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

                  // Password TxtField
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
                          controller: _passwordController,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.go,
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

                  // Check for terms and conditions
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
                        Text(
                          'I read and agree to ',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Pink Login button
                  ElevatedButton(
                    onPressed: () async {
                      if (isChecked) {
                        await signIn();
                      } else {
                        // Show a message to accept terms and conditions
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please accept the terms and conditions'),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(200, 40),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 255, 16, 219),
                      elevation: 5, // Add a shadow
                    ),
                  ),
                  SizedBox(height: 20),

                  // ----or----
                  Text(
                    '----------------------------- OR -----------------------------',
                    style: TextStyle(color: Colors.white),
                  ),

                  // Icons in Socmed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Facebook Sign in.
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: GestureDetector(
                          onTap: () {
                            FBSignIn(context);
                          },
                          child: Image.asset(
                            'assets/facebookicon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),

                      // Google Sign in.
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: GestureDetector(
                          onTap: () {
                            GoogleSignIn(context);
                          },
                          child: Image.asset(
                            'assets/googleicon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),

                      // IG Sign in.
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: GestureDetector(
                          onTap: () {
                            IGSignIn(context);
                          },
                          child: Image.asset(
                            'assets/instagramicon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Bottom sheet button
                  TextButton(
                    onPressed: () {
                      SignInProcess(context);
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
