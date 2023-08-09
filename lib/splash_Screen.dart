import 'package:astana_token_tracker/user_side.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'admin_side.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/astana_logo.png',height: 400.0,width: 400,), // Replace with your splash image path
        nextScreen: QueueUserScreen(),
        // QueueManagementApp(), // Replace with the main screen you want to navigate to
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white, // Set your preferred background color
        duration: 3000, // Set the duration of the splash animation

      ),
    );
  }
}

