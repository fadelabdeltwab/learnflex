import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';

class CustomAnswers extends StatefulWidget {
  const CustomAnswers({super.key});

  @override
  State<CustomAnswers> createState() => _CustomAnswersState();
}

class _CustomAnswersState extends State<CustomAnswers> {

   int selectedAnswerIndex = -1; // Track selected answer
  int correctAnswerIndex = 0; // The index of the correct answer

  List<String> answers = ["come", "come", "come", "come"]; // Dummy answers
  @override
  Widget build(BuildContext context) {
    return  Expanded(
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedAnswerIndex == index;
                    bool isCorrect = index == correctAnswerIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? (isCorrect
                                      ? Colors.green[100]
                                      : Colors.red[100])
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color:
                                isSelected
                                    ? (isCorrect ? Colors.green : Colors.red)
                                    : kSecondaryColor,
                            width: isSelected ? 2.5 : 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              answers[index],
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    isSelected
                                        ? (isCorrect
                                            ? Colors.grey
                                            : Colors.black)
                                        : Colors.black,
                              ),
                            ),
                            // if (isSelected)
                            Icon(
                              isSelected
                                  ? (isCorrect
                                      ? Icons.check_circle
                                      : Icons.cancel)
                                  : Icons.circle_outlined,
                              color:
                                  isSelected
                                      ? (isCorrect ? Colors.green : Colors.red)
                                      : Colors.grey.withValues(alpha: 0.3),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
;
  }
}