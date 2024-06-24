import 'package:flutter/material.dart';
import 'package:pixelpulse/Pages/login_page.dart';
// Import your main screen file

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to wait for a few seconds before navigating
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 5)), // Wait for 5 seconds
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting, show a loading indicator or your app's logo
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(), // Or your app's logo
            ),
          );
        } else {
          // After waiting, navigate to the main screen
          return LoginPage(); // Replace MainScreen() with your main screen widget
        }
      },
    );
  }
}
