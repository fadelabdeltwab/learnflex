import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/question_model.dart';
import 'package:learn_fix/presentation/widget/custom_back_button.dart';
import 'package:learn_fix/presentation/widget/custom_question_box.dart';

class CustomQuestionGroup extends StatelessWidget {
  const CustomQuestionGroup({super.key, required this.questionModel, required this.questionNum, this.onBackToLesson, required this.currentQuestionIndex, this.onPreviousQuestion});
  final QuestionModel questionModel;
  final String questionNum;
  final VoidCallback? onBackToLesson; // دالة للرجوع لدرس
  final int currentQuestionIndex;
  final VoidCallback? onPreviousQuestion; // دالة للرجوع للسؤال اللي قبله
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kMainColor, // Background color
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Q U I Z',
                style: TextStyle(
                  // color: Colors.white,
                  color: kNavigationBarColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Back Button
        CustomBackButton(currentQuestionIndex: currentQuestionIndex,
          onBackToLesson: onBackToLesson,onPreviousQuestion: onPreviousQuestion,),

        // Question Box
        CustomQuestionBox(questionModel: questionModel, questionNum: questionNum,),
      ],
    );
  }
}
