import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/sub_model.dart';

import '../screens/units.dart';

class SubjectComponent extends StatelessWidget {
  const SubjectComponent({super.key, required this.subjectModel});
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => UnitsScreen(
                    grade: subjectModel.grade,
                    term: subjectModel.term,
                    subject: subjectModel.name,
                  ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 195,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.indigo],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: -120,
                child: Container(
                  width: 380,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 23),
                  Text(
                    subjectModel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 19),
                  Image.asset(
                    subjectModel.subjectImage,
                    width: 250,
                    height: 120,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
