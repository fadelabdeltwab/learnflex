import 'package:flutter/material.dart';

import '../screens/Lessons.dart';

class UnitsComponent extends StatelessWidget {
  final String unit;
  final String grade;
  final String term;
  final String subject;

  const UnitsComponent({
    super.key,
    required this.unit,
    required this.grade,
    required this.term,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => LessonsScreen(
                    grade: grade,
                    term: term,
                    subject: subject,
                    unit: unit,
                  ),
            ),
          );
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF4648b5),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Center(
            child: Text(
              unit,
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
