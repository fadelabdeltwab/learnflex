// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:learn_fix/constant.dart';
// import 'package:learn_fix/presentation/screens/home.dart';
// import 'package:learn_fix/presentation/screens/quiz_screen.dart';
// import 'package:learn_fix/presentation/screens/live_face_recognition_screen.dart'; // ✅

// import '../../data/models/lesson_model.dart';

// class CustomNavBar extends StatelessWidget {
//   final LessonModel lessonModel;

//   const CustomNavBar({super.key, required this.lessonModel});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(150),
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
//         height: 90,
//         color: kNavigationBarColor,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => HomeScreen()),
//                 );
//               },
//               child: _navItem(
//                 icon: FontAwesomeIcons.houseChimney,
//                 label: "Home",
//                 size: 24,
//                 fontsize: 16,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 if (Navigator.canPop(context)) Navigator.pop(context);
//               },
//               child: _navItem(
//                 icon: FontAwesomeIcons.bookOpenReader,
//                 label: "Lesson",
//                 size: 24,
//                 fontsize: 16,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (_) => QuizScreen(questions: lessonModel.questions),
//                   ),
//                 );
//               },
//               child: _navItem(
//                 icon: FontAwesomeIcons.question,
//                 label: "Quiz",
//                 size: 32,
//                 fontsize: 20,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const LiveFaceRecognitionScreen(),
//                   ),
//                 );
//               },
//               child: _navItem(
//                 icon: Icons.camera_alt,
//                 label: "Attend",
//                 size: 24,
//                 fontsize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _navItem({
//     required IconData icon,
//     required String label,
//     required double size,
//     required double fontsize,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: kNavigationBarIconColor,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: size, color: Colors.white),
//           Text(
//             label,
//             style: TextStyle(color: Colors.white, fontSize: fontsize),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/data/models/lesson_model.dart';
import 'package:learn_fix/presentation/screens/home.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';
import 'package:learn_fix/presentation/screens/live_face_recognition_screen.dart';
import 'package:learn_fix/presentation/screens/quiz_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.lessonModel});
  final LessonModel lessonModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
        height: 90,
        color: kNavigationBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kNavigationBarIconColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Icon(
                        FontAwesomeIcons.houseChimney,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Text('Home', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kNavigationBarIconColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.bookOpenReader,
                      color: Colors.white,
                      size: 24,
                    ),
                    Text('Lesson', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => QuizScreen(questions: lessonModel.questions, lessonModel: lessonModel,),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(19),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kNavigationBarIconColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.question,
                      size: 24,
                      color: Colors.white,
                    ),
                    Text('Quiz', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LiveFaceRecognitionScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kNavigationBarIconColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 24, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        'Attend',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
