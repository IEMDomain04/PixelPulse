import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void FBSignIn(BuildContext context) {
  // Username Controller
  final _usernameController = TextEditingController();

  // Password Controller
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
  Future<void> createAccount() async {
    final String email = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

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
      //User Validations.
      if (email.isEmpty && password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter Facebook email address, and Password')),
        );
        return;
      }

      //Empty User Email.
      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter Facebook email address')),
        );
        return;
      }

      //Empty User Password.
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter password')),
        );
        return;
      }

      //Wrong email format.
      if (!isValidEmail(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Please enter a valid Facebook email address')),
        );
        return;
      }

      //Incorrect Password.
      if (!isValidPassword(password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password must be 6 Characters or more.')),
        );
        return;
      }
    }
  }

  // Dispose controllers to avoid memory leaks
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

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
                  Color.fromARGB(255, 98, 87, 255), // Top color
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
                  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset(
                      'assets/facebookicon.png',
                      width: 50,
                      height: 50,
                    ),
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text('Sign Up using Facebook',
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
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Facebook Email',
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
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
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
                  SizedBox(height: 20),

                  //NEED SOME FIX THIS SHT
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      await createAccount();
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

void GoogleSignIn(BuildContext context) {
  // Username Controller
  final _usernameController = TextEditingController();

  // Password Controller
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
  Future<void> createAccount() async {
    final String email = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

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
          SnackBar(content: Text('Enter google email address')),
        );
        return;
      }

      //Empty User Password.
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter password')),
        );
        return;
      }

      //Wrong email format.
      if (!isValidEmail(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid google email address')),
        );
        return;
      }

      //Incorrect Password.
      if (!isValidPassword(password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password must be 6 Characters or more.')),
        );
        return;
      }
    }
  }

  // Dispose controllers to avoid memory leaks
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

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
                  Color.fromARGB(255, 5, 152, 0), // Top color
                  Color.fromARGB(255, 6, 45, 171), // Bottom color
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
                  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset(
                      'assets/googleicon.png',
                      width: 50,
                      height: 50,
                    ),
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text('Sign Up using Google',
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
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Google Email',
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
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
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
                  SizedBox(height: 20),

                  //NEED SOME FIX THIS SHT
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      await createAccount();
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

void IGSignIn(BuildContext context) {
  // Username Controller
  final _usernameController = TextEditingController();

  // Password Controller
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
  Future<void> createAccount() async {
    final String email = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

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
          SnackBar(content: Text('Enter instagram email address')),
        );
        return;
      }

      //Empty User Password.
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter password')),
        );
        return;
      }

      //Wrong email format.
      if (!isValidEmail(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Please enter a valid instagram email address')),
        );
        return;
      }

      //Incorrect Password.
      if (!isValidPassword(password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password must be 6 Characters or more.')),
        );
        return;
      }
    }
  }

  // Dispose controllers to avoid memory leaks
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

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
                  Color.fromARGB(255, 180, 159, 0), // Top color
                  Color.fromARGB(255, 183, 76, 0), // Bottom color
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
                  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset(
                      'assets/instagramicon.png',
                      width: 50,
                      height: 50,
                    ),
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text('Sign Up using Instagram',
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
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Instagram Email',
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
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
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
                  SizedBox(height: 20),

                  //NEED SOME FIX THIS SHT
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      await createAccount();
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
