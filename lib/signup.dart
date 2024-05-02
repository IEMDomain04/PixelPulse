// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void bottomSheetSignIn(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Creating Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: LinearProgressIndicator(
                  value: 0, // Set the progress value (0.0 - 1.0)
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue, // Set the progress color
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0, bottom: 30.0),
                child: Text('Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white)),
              ),
              SizedBox(height: 20),
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
                        hintText: 'Username',
                        hintStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                        hintStyle: TextStyle(fontSize: 12, color: Colors.white),
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
                        // Handle male selection
                      },
                      child: Text('Male'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 0, 194, 242),
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle female selection
                      },
                      child: Text('Female'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 229, 0, 191),
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Add your login logic here
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
}
