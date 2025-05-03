import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomStarsIcons extends StatelessWidget {
  const CustomStarsIcons({
    super.key,
    required this.star1Color,
    required this.star2Color,
    required this.star3Color,
  });

  final Animation<Color?> star1Color, star2Color, star3Color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: star1Color,
          builder: (context, child) {
            return Icon(Icons.star_rounded, size: 50, color: star1Color.value);
          },
        ),
        const SizedBox(width: 10),
        AnimatedBuilder(
          animation: star2Color,
          builder: (context, child) {
            return Icon(Icons.star_rounded, size: 70, color: star2Color.value);
          },
        ),
        const SizedBox(width: 8),
        AnimatedBuilder(
          animation: star3Color,
          builder: (context, child) {
            return Icon(Icons.star_rounded, size: 50, color: star3Color.value);
          },
        ),
      ],
    );
  }
}

