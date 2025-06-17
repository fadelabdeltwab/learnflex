import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/presentation/screens/home.dart';
import 'package:learn_fix/presentation/screens/quiz_screen.dart';
import 'package:learn_fix/presentation/screens/live_face_recognition_screen.dart'; // ✅

import '../../data/models/lesson_model.dart';

class CustomNavBar extends StatelessWidget {
  final LessonModel? lessonModel;

  const CustomNavBar({super.key, this.lessonModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
        height: 90,
        color: kNavigationBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: _navItem(
                  icon: FontAwesomeIcons.houseChimney, label: "Home"),
            ),
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
              child: _navItem(
                  icon: FontAwesomeIcons.bookOpenReader, label: "Lesson"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen()),
                );
              },
              child: _navItem(icon: FontAwesomeIcons.question, label: "Quiz"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LiveFaceRecognitionScreen()),
                );
              },
              child: _navItem(icon: Icons.camera_alt, label: "Attend"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({required IconData icon, required String label}) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kNavigationBarIconColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.white),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
