import 'package:flutter/material.dart';
import 'package:learn_fix/constant.dart';

class WhiteBoardScreen extends StatefulWidget {
  @override
  const WhiteBoardScreen({super.key});

  @override
  State<WhiteBoardScreen> createState() => _WhiteBoardScreenState();
}

class _WhiteBoardScreenState extends State<WhiteBoardScreen> {
  List<Offset?> points = [];

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
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'W H I T E B O A R D',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                points.add(details.localPosition);
              });
            },
            onPanEnd: (details) {
              points.add(null);
            },
            child: CustomPaint(
              size: Size.infinite,
              painter: WhiteboardPainter(points),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  points.clear();
                });
              },
              backgroundColor: kNavigationBarColor.withValues(alpha: 0.9),
              child: const Icon(
                Icons.clear_rounded,
                color: kNavigationBarIconColor,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteboardPainter extends CustomPainter {
  final List<Offset?> points;
  WhiteboardPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.black
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
