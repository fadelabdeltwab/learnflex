import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/presentation/widget/lessons_comp.dart';

import '../widget/app_bar.dart';
import '../widget/search_bar.dart';

class LessonsScreen extends StatelessWidget {
  LessonsScreen({super.key});
  final List<LessonModel> lessonsList = [
    LessonModel(id: 1, name: "Lesson 1"),
    LessonModel(id: 2, name: "Lesson 2"),
    LessonModel(id: 3, name: "Lesson 3"),
    LessonModel(id: 4, name: "Lesson 4"),
    LessonModel(id: 5, name: "Lesson 5"),
    LessonModel(id: 6, name: "Lesson 6"),
    LessonModel(id: 7, name: "Lesson 7"),
    LessonModel(id: 8, name: "Lesson 8"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: (value) {}),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: lessonsList.length,
              itemBuilder: (context, index) {
                return LessonsComponent(lessonModel: lessonsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
