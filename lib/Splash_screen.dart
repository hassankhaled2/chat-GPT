import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled23/ChatBot/chat_screen.dart';
import 'package:untitled23/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('images/Hassan.json'), nextScreen: LogIn(),
      backgroundColor: Color(0xff1A1B2D),
      splashIconSize: 120,
    );
  }
}
