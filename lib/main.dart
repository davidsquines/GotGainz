import 'package:fitness_app/pages/onboarding-builder.dart'; //TODO: Remove this after switching back to RootPage
import 'package:fitness_app/pages/root-page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';


void main() => runApp(FitnessApp());

Function duringSplash = () {
  return 1;
};

Map<int, Widget> op = {1: SplashScreen()};

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplash(
        imagePath: 'assets/gifs/splashScreen.gif',
        home: SplashScreen(),
        customFunction: duringSplash,
        duration: 2300,
        type: AnimatedSplashType.BackgroundProcess,
        outputAndHome: op,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Onboarding(), //TODO: Change this back to RootPage after testing!!
      ),
    );
  }
}
