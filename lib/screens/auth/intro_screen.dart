import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:scribetribe/screens/auth/login_screen/login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        backgroundColor: const Color(0xff4E0ADD),
        splash: const ImageIcon(
          AssetImage("assets/icons/logo.png"),
          size: 500,
          color: Colors.white,
        ),
        nextScreen: const LoginScreen());
  }
}
