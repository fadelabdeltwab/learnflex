import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';

class LessonsComponent extends StatelessWidget {
  const LessonsComponent({super.key, required this.lessonModel});
  final LessonModel lessonModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LessonScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
              lessonModel.name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
