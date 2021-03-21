import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'loginscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Image(image: AssetImage('assets/pmaslogo.png'),
      height: 400, width: 400,),
      nextScreen: MyLoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
      duration: 3000,
      backgroundColor: Colors.white,
    );
  }
}
