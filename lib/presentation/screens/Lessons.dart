import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/lesson_model.dart';
import '../widget/app_bar.dart';
import '../widget/lessons_comp.dart';
import '../widget/search_bar.dart'; // تأكد إنه نفس اسم الملف

class LessonsScreen extends StatefulWidget {
  final String grade;
  final String term;
  final String subject;
  final String unit;

  const LessonsScreen({
    super.key,
    required this.grade,
    required this.term,
    required this.subject,
    required this.unit,
  });

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  List<LessonModel> lessons = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    try {
      final response = await Dio().get(
        'http://localhost:5000/api/',
        queryParameters: {
          'grades': widget.grade,
          'term': widget.term,
          'subject': widget.subject,
          'unit': widget.unit,
        },
      );

      final data = response.data;

      final List<dynamic> lessonList = data['lessons'] ?? [];

      setState(() {
        lessons = lessonList.map((e) => LessonModel.fromJson(e)).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'فشل في تحميل البيانات';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: (value) {}),
          Expanded(
            child:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : error.isNotEmpty
                ? Center(child: Text(error))
                : lessons.isEmpty
                ? const Center(child: Text('لا توجد دروس لعرضها'))
                : ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return LessonsComponent(lessonModel: lessons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
