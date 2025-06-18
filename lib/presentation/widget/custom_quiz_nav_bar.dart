// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/data/models/question_model.dart';
import 'package:learn_fix/presentation/screens/home.dart';
import 'package:learn_fix/presentation/screens/live_face_recognition_screen.dart';
import 'package:learn_fix/presentation/screens/quiz_screen.dart';

class CustomQuizNavBar extends StatelessWidget {
  const CustomQuizNavBar({super.key, required this.lessonModel, required this.questions});
  final LessonModel lessonModel;
  final List<QuestionModel> questions; // لتمرير الأسئلة لل

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kNavigationBarIconColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      FontAwesomeIcons.houseChimney,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text('Home', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        questions: questions,
                        lessonModel: lessonModel,
                        initialIndex: 0, // البدء من الأول
                        initialSelectedAnswers: List.filled(questions.length, null), // إجابات جديدة
                        initialScore: 0, // نتيجة جديدة
                      ),
                    ),
                  );
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kNavigationBarIconColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Icon(
                      FontAwesomeIcons.arrowRotateLeft,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Retake Again',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              return Navigator.pop(context);
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kNavigationBarIconColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Icon(
                      FontAwesomeIcons.bookOpenReader,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text('Lesson', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LiveFaceRecognitionScreen(),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kNavigationBarIconColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Icon(
                      Icons.camera_alt,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text('Attend', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
