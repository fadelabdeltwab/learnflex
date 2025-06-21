import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/lesson_model.dart';
import '../widget/app_bar.dart';
import '../widget/lessons_comp.dart';
<<<<<<< HEAD
import '../widget/search_bar.dart';
=======
import '../widget/search_bar.dart'; // تأكد إنه نفس اسم الملف
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c

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
<<<<<<< HEAD
  List<LessonModel> filteredLessons = [];

=======
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
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
<<<<<<< HEAD
        'http://192.168.1.6:5000/api/',
=======
        'http://localhost:5000/api/',
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
        queryParameters: {
          'grades': widget.grade,
          'term': widget.term,
          'subject': widget.subject,
          'unit': widget.unit,
        },
      );

      final data = response.data;

      final List<dynamic> lessonList = data['lessons'] ?? [];

<<<<<<< HEAD
      final lessonModels = lessonList.map((e) => LessonModel.fromJson(e)).toList();

      setState(() {
        lessons = lessonModels;
        filteredLessons = lessonModels;
=======
      setState(() {
        lessons = lessonList.map((e) => LessonModel.fromJson(e)).toList();
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'فشل في تحميل البيانات';
        isLoading = false;
      });
    }
  }

<<<<<<< HEAD
  void _filterLessons(String query) {
    final result = lessons.where((lesson) =>
        lesson.title.toLowerCase().contains(query.toLowerCase())
    ).toList();

    setState(() {
      filteredLessons = result;
    });
  }

=======
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
<<<<<<< HEAD
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
=======
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
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
              },
            ),
          ),
        ],
      ),
    );
  }
}
