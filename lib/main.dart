import 'package:flutter/material.dart';
import 'package:learn_fix/presentation/screens/splash.dart';
import 'package:learn_fix/presentation/screens/test.dart';

void main() {
  runApp(const LearnFlex());
}

class LearnFlex extends StatelessWidget {
  const LearnFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
