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
              Color.fromARGB(171, 252, 88, 255), // Bottom color
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.8,
      );
    },
  );
}
