import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/data/models/question_model.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';
import 'package:learn_fix/presentation/screens/quiz_screen.dart';
import 'package:learn_fix/presentation/widget/custom_back_button.dart';
import 'package:learn_fix/presentation/widget/custom_final_score_box.dart';

class CustomFinalGroup extends StatelessWidget {
  const CustomFinalGroup({super.key, required this.textAnimation, required this.score, required this.totalQuestions, required this.lessonModel, required this.questions, required this.currentQuestionIndex, required this.selectedAnswers});
  final Animation<double> textAnimation;
  final int score, totalQuestions;
  final LessonModel lessonModel;
  final List<QuestionModel> questions; // لتمرير الأسئلة للرجوع
  final int currentQuestionIndex; // فهرس السؤال الأخير
  final List<int?> selectedAnswers; // الإجابات المحفوظة

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
        CustomBackButton(currentQuestionIndex: currentQuestionIndex, // فهرس الأخير
                onBackToLesson: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonScreen(lessonModel: lessonModel),
                    ),
                  );
                },
                onPreviousQuestion: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        questions: questions,
                        lessonModel: lessonModel,
                        initialIndex: currentQuestionIndex, // تمرير الفهرس الأخير
                        initialSelectedAnswers: selectedAnswers, // تمرير الإجابات
                        initialScore: score, // تمرير النتيجة
                      ),
                    ),
                  );
                },),

        // Final Result Box
        CustomFinalScoreBox(textAnimation: textAnimation, score: score, totalQuestions: totalQuestions,),
      ],
    );
  }
}
