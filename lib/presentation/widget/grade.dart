import 'package:flutter/material.dart';

import '../../data/models/grade_model.dart';
import '../screens/term_screen.dart';

class Grade extends StatelessWidget {
  const Grade({super.key, required this.gradeModel});
  final GradeModel gradeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TermScreen(grade: gradeModel.name),
          ),
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
              gradeModel.name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
