import 'package:flutter/material.dart';

import '../../data/models/lesson_model.dart';
import '../screens/lesson_screen.dart';

class LessonsComponent extends StatelessWidget {
  final LessonModel lessonModel;

  const LessonsComponent({super.key, required this.lessonModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LessonScreen(lessonModel: lessonModel),
            ),
          );
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23)),
            gradient: LinearGradient(
              colors: [Color(0xFF4648b5), Color(0xFF4748b5)],
            ),
          ),
          child: Center(
            child: Text(
              lessonModel.title, // عرض اسم الدرس فقط
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
