import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
                  Image.asset(
                    'assets/pixelpulseicon.png',
                    width: 200, // Set the width as needed
                    height: 180, // Set the height as needed
                  ),

                  //App Title
                  //SizedBox for padding
                  Text(
                    'Welcome to PixelPulse',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  Text(
                    'Easy. Create. Design. Share. Collab.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                  SizedBox(height: 30),

                  // Add your other widgets here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
