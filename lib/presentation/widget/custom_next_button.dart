import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/presentation/screens/final_result_screen.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kNavigationBarColor,
              blurRadius: 1,
              spreadRadius: 4,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FinalResultScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(16),
            backgroundColor: kNavigationBarIconColor,
          ),
          child: Icon(
            FontAwesomeIcons.arrowRight,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
