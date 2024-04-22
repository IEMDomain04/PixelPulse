import 'package:flutter/material.dart';

class Day1Page extends StatelessWidget {
  const Day1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Icon(
          Icons.account_circle,
          size: 100.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
