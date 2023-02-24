import 'dart:async';
import 'package:bmi_calculator_app/views/screens/answer.dart';
import 'package:bmi_calculator_app/views/screens/gender.dart';
import 'package:bmi_calculator_app/views/screens/height.dart';
import 'package:bmi_calculator_app/views/screens/weight.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'gender': (context) => const Gender(),
        'height': (context) => const HeightPage(),
        'weight': (context) => const Weight(),
        'answer': (context) => const Answer(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2));

    animation = Tween<double>(begin: -470,end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animationController.forward();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'gender'),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animationController,
              builder: (context,widget) {
                return Transform.translate(
                  offset: Offset(0,animation.value),
                  child: Image.asset(
                    'assets/images/splash.jpg',
                    height: 200,
                    width: 200,
                  ),
                );
              }
            ),
            const SizedBox(height: 25),
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
