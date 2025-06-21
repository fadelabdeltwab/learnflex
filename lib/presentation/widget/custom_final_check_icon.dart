import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_fix/constant.dart';

class CustomFinalCheckIcon extends StatelessWidget {
  const CustomFinalCheckIcon({
    super.key,
    required this.circle1Animation,
    required this.circle2Animation,
    required this.checkAnimation,
  });

  final Animation<double> circle1Animation, circle2Animation, checkAnimation;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ScaleTransition(
          scale: circle1Animation,
          child: Center(
            child: Container(
              width: 150,
              height: 148,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kFinalCheckIconColor,
                boxShadow: [
                  BoxShadow(
                    color: kFinalScoreBoxColor.withValues(alpha: 0.2),
                    spreadRadius: 6,
                    blurRadius: 10,
                    offset: Offset(0, 8),
                  ),
                ],
                border: Border.all(color: Color(0xffffffff), width: 1),
              ),
            ),
          ),
        ),

        Positioned(
          top: 23,
          left:
              screenWidth > 1280
                  ? screenWidth * 0.458
                  : screenWidth > 900
                  ? MediaQuery.of(context).size.width * 0.45
                  : screenWidth > 600 && screenWidth <= 900
                  ? MediaQuery.of(context).size.width * 0.418
                  : MediaQuery.of(context).size.width * 0.32, //122
          child: ScaleTransition(
            scale: circle2Animation,
            child: Center(
              child: Container(
                width: 99,
                height: 102,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kFinalCheckIconColor,
                  boxShadow: [
                    BoxShadow(
                      color: kFinalScoreBoxColor.withValues(alpha: 0.2),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: Color(0xffffffff), width: 1),
                ),
                child: ScaleTransition(
                  scale: checkAnimation,
                  child: Icon(
                    FontAwesomeIcons.check,
                    size: 50,
                    weight: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
