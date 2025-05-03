import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
// import 'package:learn_fix/presentation/screens/lesson_screen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 13,
      child: Container(
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
          icon: Icon(Icons.arrow_back, size: 25, color: kMainColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
