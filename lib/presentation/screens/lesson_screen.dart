import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_fix/presentation/screens/white_board_screen.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../constant.dart';
import '../../data/models/lesson_model.dart';
import '../widget/app_bar.dart';
import '../widget/custom_nav_bar.dart';

class LessonScreen extends StatelessWidget {
  final LessonModel lessonModel;

  const LessonScreen({super.key, required this.lessonModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // صورة الدرس
            if (lessonModel.image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'http://localhost:5000${lessonModel.image}',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 20),

            // عنوان الدرس
            Text(
              lessonModel.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // وصف الدرس
            Directionality(
              textDirection: TextDirection.rtl,
              child: Html(
                data: lessonModel.description,
                style: {
                  "p": Style(
                    fontSize: FontSize.large,
                    textAlign: TextAlign.right,
                  ),
                },
              ),
            ),

            const SizedBox(height: 24),

            // الموديل الثلاثي الأبعاد
            if (lessonModel.model.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "الموديل الثلاثي الأبعاد",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: ModelViewer(
                        src: 'http://localhost:5000${lessonModel.model}',

                        alt: "نموذج ثلاثي الأبعاد",
                        ar: true,
                        autoRotate: true,
                        cameraControls: true,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),

      bottomNavigationBar: CustomNavBar(lessonModel: lessonModel ,),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WhiteBoardScreen()),
          );
        },
        backgroundColor: kNavigationBarColor,
        child: Icon(Icons.draw, color: kNavigationBarIconColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
