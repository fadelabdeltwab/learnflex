import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/data/models/question_model.dart';
import 'package:learn_fix/presentation/screens/final_result_screen.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';
import 'package:learn_fix/presentation/widget/custom_answers.dart';
import 'package:learn_fix/presentation/widget/custom_next_button.dart';
import 'package:learn_fix/presentation/widget/custom_question_group.dart';

class QuizScreen extends StatefulWidget {
  final List<QuestionModel> questions;
  final LessonModel lessonModel;
  final int? initialIndex;
  final List<int?>? initialSelectedAnswers;
  final int? initialScore;

  const QuizScreen({
    super.key,
    required this.questions,
    required this.lessonModel,
    this.initialIndex,
    this.initialSelectedAnswers,
    this.initialScore,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  late List<int?> selectedAnswers;

  @override
  void initState() {
    super.initState();

    // تحميل الإجابات أو البدء من جديد
    selectedAnswers = widget.initialSelectedAnswers != null &&
        widget.initialSelectedAnswers!.length == widget.questions.length
        ? List.from(widget.initialSelectedAnswers!)
        : List.filled(widget.questions.length, null);

    score = widget.initialScore ?? 0;

    if (widget.initialIndex != null &&
        widget.initialIndex! < widget.questions.length) {
      currentQuestionIndex = widget.initialIndex!;
    }
  }

  void checkAnswer(int index) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = index;

      // التأكد إذا كانت الإجابة صحيحة
      if (index ==
          widget.questions[currentQuestionIndex].options.indexWhere(
                  (opt) =>
              opt.option ==
                  widget.questions[currentQuestionIndex].answer)) {
        score++;
      }
    });
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  void backToLesson() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LessonScreen(lessonModel: widget.lessonModel),
      ),
    );
  }

  void finishQuiz() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FinalResultScreen(
          score: score,
          totalQuestions: widget.questions.length,
          questions: widget.questions,
          currentQuestionIndex: currentQuestionIndex,
          lessonModel: widget.lessonModel,
          selectedAnswers: selectedAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= widget.questions.length) {
      currentQuestionIndex = 0;
    }

    final currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomQuestionGroup(
                questionModel: currentQuestion,
                questionNum:
                'Question ${currentQuestionIndex + 1}/${widget.questions.length}',
                currentQuestionIndex: currentQuestionIndex,
                onBackToLesson: backToLesson,
                onPreviousQuestion: previousQuestion,
              ),
              const SizedBox(height: 80),
              CustomAnswers(
                options: currentQuestion.options,
                correctAnswer: currentQuestion.answer,
                selectedAnswerIndex: selectedAnswers[currentQuestionIndex],
                onTap: (index) => checkAnswer(index),
              ),
              CustomNextButton(
                currentQuestionIndex: currentQuestionIndex,
                totalQuestions: widget.questions.length,
                onNext: nextQuestion,
                onFinish: finishQuiz,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
