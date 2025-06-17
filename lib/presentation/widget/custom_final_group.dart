import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';
import 'package:learn_fix/presentation/widget/custom_back_button.dart';
import 'package:learn_fix/presentation/widget/custom_final_score_box.dart';

class CustomFinalGroup extends StatelessWidget {
  const CustomFinalGroup({super.key, required this.textAnimation});
  final Animation<double> textAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kMainColor, // Background color
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 112.0),
            child: Text(
              'Q U I Z',
              style: TextStyle(
                // color: Colors.white,
                color: kNavigationBarColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Back Button
        CustomBackButton(),

        // Final Result Box
        CustomFinalScoreBox(textAnimation: textAnimation),
      ],
    );
  }
}
