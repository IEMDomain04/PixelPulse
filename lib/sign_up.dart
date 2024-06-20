import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//TASKS!!
// >Fix Textfields for decent user input
// >Fix Next Button when user input decent credentials
// >Fix Add user validation

void SignInProcess(BuildContext context) {
  // Username Controller
  final _usernameController = TextEditingController();

  // Password Controller
  final _passwordController = TextEditingController();

  // Age Controller (added based on the provided code)
  final _ageController = TextEditingController();

  // For Firebase Authentication
  Future<void> createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the main page or show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully')),
      );
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      print('Error creating account: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create account')),
      );
    }
  }

  // Dispose controllers to avoid memory leaks
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
  }

  // Male or Female selection state
  bool maleSelected = false;
  bool femaleSelected = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 35, 19, 255), // Top color
                  Color.fromARGB(255, 27, 15, 193), // Bottom color
                ],
              ),
              // Bottomsheet corner radius
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height * .9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Text('Creating Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 20.0),

                  // Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: LinearProgressIndicator(
                      value: 0.5, // Set the progress value (0.0 - 1.0)
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue, // Set the progress color
                      ),
                    ),
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, bottom: 20.0),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 20),

                  // Username TextField
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Age TextField
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
                          controller: _ageController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Age',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Password TextField
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
                  SizedBox(height: 10),

                  Text('Gender:', style: TextStyle(color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              maleSelected = !maleSelected;
                              femaleSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Text('Male',
                                  style: TextStyle(color: Colors.black)),
                              if (maleSelected)
                                Icon(Icons.check, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            minimumSize: Size(20, 40),
                            backgroundColor: maleSelected
                                ? Color.fromARGB(255, 0, 194, 242)
                                : Colors.white,
                            elevation: 5, // Add a shadow
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              femaleSelected = !femaleSelected;
                              maleSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Text('Female',
                                  style: TextStyle(color: Colors.black)),
                              if (femaleSelected)
                                Icon(Icons.check, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            minimumSize: Size(20, 40),
                            backgroundColor: femaleSelected
                                ? Color.fromARGB(255, 255, 82, 226)
                                : Colors.white,
                            elevation: 5, // Add a shadow
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      await createAccount();
                      Navigator.pop(context);
                    },
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(200, 40),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 255, 16, 219),
                      elevation: 5, // Add a shadow
                    ),
                  ),
                  SizedBox(height: 80.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Already have an account?'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
