import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';

class CustomFinalScoreBox extends StatelessWidget {
  const CustomFinalScoreBox({super.key, required this.textAnimation, required this.score, required this.totalQuestions});
  final int result = 100;
    final int score, totalQuestions;

  final Animation<double> textAnimation;

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      top: 120,
      left: screenWidth > 1280
              ? screenWidth * 0.435
              : screenWidth > 900
              ? MediaQuery.of(context).size.width * 0.42
              : screenWidth > 600 && screenWidth <= 900
              ? MediaQuery.of(context).size.width * 0.37
              : MediaQuery.of(context).size.width * 0.24,//78
      child: Container(
        height: 175,
        width: 175,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: kFinalScoreBoxShadow1Color,
              spreadRadius: 8,
              blurRadius: 1,
              // offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.28),
              spreadRadius: 18,
              blurRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: FadeTransition(
            opacity: textAnimation,
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Your Score",
                    style: TextStyle(
                      color: kFinalScoreBoxColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${score}/${totalQuestions}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kFinalScoreBoxColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Points ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kFinalScoreBoxColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
