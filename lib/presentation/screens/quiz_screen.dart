import 'package:flutter/material.dart';
import 'package:learn_fix/presentation/widget/custom_answers.dart';
import 'package:learn_fix/presentation/widget/custom_next_button.dart';
import 'package:learn_fix/presentation/widget/custom_question_group.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // int selectedAnswerIndex = -1; // Track selected answer
  // int correctAnswerIndex = 0; // The index of the correct answer

  // List<String> answers = ["come", "come", "come", "come"]; // Dummy answers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomQuestionGroup(),
              SizedBox(height: 65),
              // Answer Options
              CustomAnswers(),
              // Next Button
              CustomNextButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
