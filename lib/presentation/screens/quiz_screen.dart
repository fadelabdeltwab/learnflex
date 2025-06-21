import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/data/models/question_model.dart';
import 'package:learn_fix/presentation/screens/final_result_screen.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';
import 'package:learn_fix/presentation/widget/custom_answers.dart';
import 'package:learn_fix/presentation/widget/custom_next_button.dart';
import 'package:learn_fix/presentation/widget/custom_question_group.dart';

class QuizScreen extends StatefulWidget {
  final List<QuestionModel> questions ;
  const QuizScreen({super.key, required this.questions, required this.lessonModel, this.initialIndex, this.initialSelectedAnswers, this.initialScore});
  final LessonModel lessonModel;
  final int? initialIndex;
  final List<int?>? initialSelectedAnswers;
  final int? initialScore;
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
    if (widget.initialSelectedAnswers != null && widget.initialSelectedAnswers!.length == widget.questions.length) {
      selectedAnswers = List.from(widget.initialSelectedAnswers!);
    } else {
      selectedAnswers = List.filled(widget.questions.length, null);
    }
    if (widget.initialScore != null) {
      score = widget.initialScore!;
    }
    if (widget.initialIndex != null && widget.initialIndex! < widget.questions.length) {
      currentQuestionIndex = widget.initialIndex!;
    }
  }


  void checkAnswer(int index) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = index;
      if (index == widget.questions[currentQuestionIndex].options.indexWhere((opt) => opt.option == widget.questions[currentQuestionIndex].answer)) {
        score++;
      }
    });
  }
  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--; // الرجوع للسؤال اللي قبله
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
        builder: (context) => LessonScreen(lessonModel: widget.lessonModel), // تمرير lessonModel
      ),
    );
  }

  void finishQuiz() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FinalResultScreen(score: score, totalQuestions: widget.questions.length, questions: widget.questions, currentQuestionIndex: currentQuestionIndex, lessonModel: widget.lessonModel, selectedAnswers: selectedAnswers,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= widget.questions.length) {
      currentQuestionIndex = 0;
    }
    final QuestionModel currentQuestion = widget.questions[currentQuestionIndex]; // السؤال الحالي
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomQuestionGroup(questionModel: currentQuestion,questionNum: 'Question ${currentQuestionIndex + 1}/${widget.questions.length}',
                currentQuestionIndex: currentQuestionIndex,
                onBackToLesson: backToLesson,
                onPreviousQuestion: previousQuestion,
              ),
              SizedBox(height: 80),
              CustomAnswers(
                options: currentQuestion.options,
                correctAnswer: currentQuestion.answer,
                selectedAnswerIndex: selectedAnswers[currentQuestionIndex],
                onTap: (index) => checkAnswer(index),
              ),
              CustomNextButton(currentQuestionIndex: currentQuestionIndex,
                totalQuestions: widget.questions.length,
                onNext: nextQuestion,
                onFinish: finishQuiz,),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
