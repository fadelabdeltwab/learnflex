import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/grade_model.dart';

import '../widget/app_bar.dart';
import '../widget/grade.dart';
import '../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<GradeModel> gradeList = [
    GradeModel(id: 1, name: "Grade 1"),
    GradeModel(id: 2, name: "Grade 2"),
    GradeModel(id: 3, name: "Grade 3"),
    GradeModel(id: 4, name: "Grade 4"),
    GradeModel(id: 5, name: "Grade 5"),
    GradeModel(id: 6, name: "Grade 6"),
    GradeModel(id: 7, name: "Grade 7"),
    GradeModel(id: 8, name: "Grade 8"),
    GradeModel(id: 9, name: "Grade 9"),
    GradeModel(id: 10, name: "Grade 10"),
    GradeModel(id: 11, name: "Grade 11"),
    GradeModel(id: 12, name: "Grade 12"),
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
              itemCount: gradeList.length,
              itemBuilder: (context, index) {
                return Grade(gradeModel: gradeList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
