// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/question_model.dart';

class CustomQuestionBox extends StatelessWidget {
  const CustomQuestionBox({super.key, required this.questionModel, required this.questionNum});
  final QuestionModel questionModel;
  final String questionNum;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: 115,
      left:
          screenWidth > 900
              ? screenWidth * 0.09
              : screenWidth > 600 && screenWidth <= 900
              ? screenWidth * 0.14
              : screenWidth * 0.14, //25,
      child: Container(
        height: 146,
        width:
            screenWidth > 900
                ? screenWidth * 0.8
                : screenWidth > 600 && screenWidth <= 900
                ? screenWidth * 0.7
                : screenWidth * 0.65, //280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kNavigationBarColor,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  questionNum,
                  style: TextStyle(
                    color: kQuestionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                questionModel.question,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
