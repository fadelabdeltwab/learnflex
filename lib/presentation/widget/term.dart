import 'package:flutter/material.dart';

import '../../data/models/term_model.dart';
import '../screens/subject.dart';

class Term extends StatelessWidget {
  final TermModel termModel;
  final String grade; // نحتاج نعرف الجريد علشان نبعته لـ SubjectScreen

  const Term({
    super.key,
    required this.termModel,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubjectScreen(
              grade: grade,
              term: termModel.name,
            ),
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
              termModel.name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
