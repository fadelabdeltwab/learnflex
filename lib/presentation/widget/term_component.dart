import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/term_model.dart';
import 'package:learn_fix/presentation/screens/subject.dart';

// import '../screens/units.dart';

class TermComponent extends StatelessWidget {
  const TermComponent({super.key, required this.termModel});
  final TermModel termModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubjectScreen()),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 23),
                  Text(
                    termModel.termName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 19),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
