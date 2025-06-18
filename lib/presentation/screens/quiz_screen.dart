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
  final LessonModel lessonModel; // تمرير lessonModel من الصفحة السابقة
final int? initialIndex; // فهرس البداية
  final List<int?>? initialSelectedAnswers; // الإجابات المحفوظة
  final int? initialScore; // النتيجة المحفوظة
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0; // لتتبع فهرس السؤال الحالي في اللستة
  int score = 0;
  // List<int?> selectedAnswers = [];
  late List<int?> selectedAnswers; // استخدام late عشان نحددها في initState

  // @override
  //   void initState() {
  //     super.initState();
  //   selectedAnswers = List.filled(widget.questions.length, null);
  //   if (widget.initialIndex != null && widget.initialIndex! < widget.questions.length) {
  //     currentQuestionIndex = widget.initialIndex!; // البدء من الفهرس المحدد
  //   }
  //   }
  @override
  void initState() {
    super.initState();
    // استخدام الإجابات والنتيجة المحفوظة إذا كانت موجودة
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
    // التأكد من إن الفهرس مش يتجاوز حجم اللستة
    if (currentQuestionIndex >= widget.questions.length) {
      currentQuestionIndex = 0; // يرجع للبداية لو انتهت اللستة
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
                onBackToLesson: backToLesson,// تمرير الدالة
                onPreviousQuestion: previousQuestion, // تمرير الدالة للرجوع
                ),
              SizedBox(height: 80),
              // Answer Options
              // CustomAnswers(options: currentQuestion.options,correctAnswer: currentQuestion.answer,),
              CustomAnswers(
                options: currentQuestion.options,
                correctAnswer: currentQuestion.answer,
                selectedAnswerIndex: selectedAnswers[currentQuestionIndex], // تمرير الإجابة المختارة
                onTap: (index) => checkAnswer(index),
              ),
              // Next Button
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
