import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/presentation/screens/home.dart';
import 'package:learn_fix/presentation/screens/lesson_screen.dart';
import 'package:learn_fix/presentation/screens/quiz_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LessonScreen();
                    },
                  ),
                );
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
                    builder: (context) {
                      return QuizScreen();
                    },
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kNavigationBarIconColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    size: 28,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
