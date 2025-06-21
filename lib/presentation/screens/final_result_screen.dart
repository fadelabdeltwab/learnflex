import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/data/models/question_model.dart';
import 'package:learn_fix/presentation/widget/custom_final_check_icon.dart';
import 'package:learn_fix/presentation/widget/custom_final_group.dart';
import 'package:learn_fix/presentation/widget/custom_quiz_nav_bar.dart';
import 'package:learn_fix/presentation/widget/custom_stars_icons.dart';

class FinalResultScreen extends StatefulWidget {
  const FinalResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.lessonModel,
    required this.questions,
    required this.currentQuestionIndex,
    required this.selectedAnswers,
  });

  final int score, totalQuestions;
  final LessonModel lessonModel;
  final List<QuestionModel> questions;
  final int currentQuestionIndex;
  final List<int?> selectedAnswers;

  @override
  State<FinalResultScreen> createState() => _FinalResultScreenState();
}

class _FinalResultScreenState extends State<FinalResultScreen>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _niceWorkController;
  late AnimationController _circleController;
  late AnimationController _starsController;

  late Animation<double> _textAnimation;
  late Animation<double> _niceWorkAnimation;
  late Animation<double> _circle1Animation, _circle2Animation, _checkAnimation;
  late Animation<Color?> _star1Color, _star2Color, _star3Color;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    _niceWorkController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _niceWorkAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _niceWorkController, curve: Curves.easeInOut),
    );

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _circle1Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );
    _circle2Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
      ),
    );
    _checkAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _starsController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _star1Color = ColorTween(
      begin: kNavigationBarIconColor,
      end: Colors.amber,
    ).animate(
      CurvedAnimation(
        parent: _starsController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    _star2Color = ColorTween(
      begin: kNavigationBarIconColor,
      end: Colors.amber,
    ).animate(
      CurvedAnimation(
        parent: _starsController,
        curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
      ),
    );
    _star3Color = ColorTween(
      begin: kNavigationBarIconColor,
      end: Colors.amber,
    ).animate(
      CurvedAnimation(
        parent: _starsController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    Future.delayed(const Duration(milliseconds: 400), () {
      _textController.forward();
    }).then((_) {
      return Future.delayed(const Duration(milliseconds: 700), () {
        _niceWorkController.forward();
      });
    }).then((_) {
      return Future.delayed(const Duration(milliseconds: 900), () {
        _circleController.forward();
      });
    }).then((_) {
      _starsController.forward();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _niceWorkController.dispose();
    _circleController.dispose();
    _starsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFinalGroup(
                textAnimation: _textAnimation,
                currentQuestionIndex: widget.currentQuestionIndex,
                score: widget.score,
                totalQuestions: widget.totalQuestions,
                questions: widget.questions,
                lessonModel: widget.lessonModel,
                selectedAnswers: widget.selectedAnswers,
              ),
              SizedBox(
                height: screenWidth > 900
                    ? MediaQuery.of(context).size.height * 0.14
                    : screenWidth > 600
                    ? MediaQuery.of(context).size.height * 0.15
                    : MediaQuery.of(context).size.height * 0.14,
              ),
              FadeTransition(
                opacity: _niceWorkAnimation,
                child: Center(
                  child: Text(
                    'Nice Work',
                    style: TextStyle(
                      color: kFinalScoreBoxColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth > 900
                    ? MediaQuery.of(context).size.height * 0.012
                    : screenWidth > 600
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.01,
              ),
              CustomFinalCheckIcon(
                circle1Animation: _circle1Animation,
                circle2Animation: _circle2Animation,
                checkAnimation: _checkAnimation,
              ),
              SizedBox(
                height: screenWidth > 900
                    ? MediaQuery.of(context).size.height * 0.03
                    : screenWidth > 600
                    ? MediaQuery.of(context).size.height * 0.13
                    : MediaQuery.of(context).size.height * 0.02,
              ),
              CustomStarsIcons(
                star1Color: _star1Color,
                star2Color: _star2Color,
                star3Color: _star3Color,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomQuizNavBar(
        lessonModel: widget.lessonModel,
        questions: widget.questions,
      ),
    );
  }
}
