import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/lesson_model.dart';
import '../widget/app_bar.dart';
import '../widget/lessons_comp.dart';
import '../widget/search_bar.dart';

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
  List<LessonModel> filteredLessons = [];

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
        'http://192.168.1.6:5000/api/',
        queryParameters: {
          'grades': widget.grade,
          'term': widget.term,
          'subject': widget.subject,
          'unit': widget.unit,
        },
      );

      final data = response.data;

      final List<dynamic> lessonList = data['lessons'] ?? [];

      final lessonModels = lessonList.map((e) => LessonModel.fromJson(e)).toList();

      setState(() {
        lessons = lessonModels;
        filteredLessons = lessonModels;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'فشل في تحميل البيانات';
        isLoading = false;
      });
    }
  }

  void _filterLessons(String query) {
    final result = lessons.where((lesson) =>
        lesson.title.toLowerCase().contains(query.toLowerCase())
    ).toList();

    setState(() {
      filteredLessons = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: _filterLessons),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : error.isNotEmpty
                ? Center(child: Text(error))
                : filteredLessons.isEmpty
                ? const Center(child: Text('لا توجد نتائج مطابقة'))
                : ListView.builder(
              itemCount: filteredLessons.length,
              itemBuilder: (context, index) {
                return LessonsComponent(lessonModel: filteredLessons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
