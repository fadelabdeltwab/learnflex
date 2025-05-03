import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/presentation/screens/white_board_screen.dart';
import 'package:learn_fix/presentation/widget/custom_nav_bar.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'L E S S O N',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WhiteBoardScreen()),
          );
        },
        backgroundColor: kNavigationBarColor,
        child: Icon(Icons.draw, color: kNavigationBarIconColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
