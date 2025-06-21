// import 'package:flutter/material.dart';
// import 'package:learn_fix/constant.dart';
// import 'package:learn_fix/data/models/question_model.dart';

// class CustomAnswers extends StatefulWidget {
//   const CustomAnswers({super.key, required this.options, required this.correctAnswer, this.selectedAnswerIndex, required this.onTap});
//   final List<OptionModel> options;
//   final String correctAnswer;
//   final int? selectedAnswerIndex; 
//   final Function(int) onTap; // فانكشن التحقق

//   @override
//   State<CustomAnswers> createState() => _CustomAnswersState();
// }

// class _CustomAnswersState extends State<CustomAnswers> {
//   int selectedAnswerIndex = -1; // Track selected answer
//   int correctAnswerIndex = 0; // The index of the correct answer

//   @override
//   Widget build(BuildContext context) {
//     List<OptionModel> answers = widget.options;
//     final correctAnswerIndex = answers.indexWhere((opt) => opt.option == widget.correctAnswer); // حساب فهرس الإجابة الصحيحة

//     return Expanded(
//       child: ListView.builder(
//         itemCount: answers.length,
//         itemBuilder: (context, index) {
//           bool isSelected = selectedAnswerIndex == index;
//           bool isCorrect = index == correctAnswerIndex;
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedAnswerIndex = index;
//               });
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color:
//                     isSelected
//                         ? (isCorrect ? Colors.green[100] : Colors.red[100])
//                         : Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                   color:
//                       isSelected
//                           ? (isCorrect ? Colors.green : Colors.red)
//                           : kSecondaryColor,
//                   width: isSelected ? 2.5 : 2,
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     answers[index].option,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color:
//                           isSelected
//                               ? (isCorrect ? Colors.grey : Colors.black)
//                               : Colors.black,
//                     ),
//                   ),
//                   // if (isSelected)
//                   Icon(
//                     isSelected
//                         ? (isCorrect ? Icons.check_circle : Icons.cancel)
//                         : Icons.circle_outlined,
//                     color:
//                         isSelected
//                             ? (isCorrect ? Colors.green : Colors.red)
//                             : Colors.grey.withValues(alpha: 0.3),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/question_model.dart';

class CustomAnswers extends StatefulWidget {
  final List<OptionModel> options;
  final String correctAnswer;
  final int? selectedAnswerIndex; // تمرير الإجابة المختارة من QuizScreen
  final Function(int) onTap; // فانكشن التحقق

  const CustomAnswers({
    super.key,
    required this.options,
    required this.correctAnswer,
    this.selectedAnswerIndex,
    required this.onTap,
  });

  @override
  State<CustomAnswers> createState() => _CustomAnswersState();
}

class _CustomAnswersState extends State<CustomAnswers> {
  @override
  Widget build(BuildContext context) {
    final answers = widget.options;
    final correctAnswerIndex = answers.indexWhere((opt) => opt.option == widget.correctAnswer);

    return Expanded(
      child: ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) {
          bool isSelected = widget.selectedAnswerIndex == index; // استخدام الإجابة المختارة من QuizScreen
          bool isCorrect = index == correctAnswerIndex;

          return GestureDetector(
            onTap: () {
              widget.onTap(index); // استدعاء فانكشن التحقق من QuizScreen
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isCorrect ? Colors.green[100] : Colors.red[100])
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isSelected
                      ? (isCorrect ? Colors.green : Colors.red)
                      : kSecondaryColor,
                  width: isSelected ? 2.5 : 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    answers[index].option,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected
                          ? (isCorrect ? Colors.grey : Colors.black)
                          : Colors.black,
                    ),
                  ),
                  Icon(
                    isSelected
                        ? (isCorrect ? Icons.check_circle : Icons.cancel)
                        : Icons.circle_outlined,
                    color: isSelected
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.grey.withValues(alpha: 0.3),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
