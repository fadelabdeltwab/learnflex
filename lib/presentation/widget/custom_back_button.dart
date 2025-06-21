// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:learn_fix/constant.dart';
// // import 'package:learn_fix/presentation/screens/lesson_screen.dart';

// class CustomBackButton extends StatelessWidget {
//   const CustomBackButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 25,
//       left: 13,
//       child: Container(
//         height: 40,
//         decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//         child: IconButton(
//           icon: Icon(Icons.arrow_back, size: 25, color: kMainColor),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';

class CustomBackButton extends StatelessWidget {
  final int currentQuestionIndex;
  final VoidCallback? onBackToLesson; // دالة للرجوع لدرس عند السؤال الأول
  final VoidCallback? onPreviousQuestion; // دالة للرجوع للسؤال اللي قبله
  
  const CustomBackButton({
    super.key,
    required this.currentQuestionIndex,
    this.onBackToLesson, this.onPreviousQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 13,
      child: Container(
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
          icon: Icon(Icons.arrow_back, size: 25, color: kMainColor),
          onPressed: () {
            if (currentQuestionIndex == 0) {
              if (onBackToLesson != null) {
                onBackToLesson!();
              }
            } else if (onPreviousQuestion != null) {
              onPreviousQuestion!(); // الرجوع للسؤال اللي قبله
            }
          },
        ),
      ),
    );
  }
}
