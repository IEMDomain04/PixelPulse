import 'package:flutter/material.dart';

//Ito yung after sign in na page kumbaga pinaka main page.
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[200]!, Colors.purple[700]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/pixelpulseicon.png',
                width: 100.0,
                height: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to PixelPulse',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'Easy. Create. Design. Share. Collab.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Add login functionality here
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
