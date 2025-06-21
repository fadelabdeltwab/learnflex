import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/sub_model.dart';
import '../widget/app_bar.dart';
import '../widget/search_bar.dart';
import '../widget/sub_component.dart';

class SubjectScreen extends StatefulWidget {
  final String grade;
  final String term;

  const SubjectScreen({super.key, required this.grade, required this.term});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final dio = Dio();
  List<SubjectModel> subjectList = [];
  List<SubjectModel> filteredSubjects = [];

  Map<String, String> subjectImages = {
    "Math": "assets/image/math.png",
    "Science": "assets/image/science.png",
  };

  @override
  void initState() {
    super.initState();
    fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    try {
      final response = await dio.get(
        "http://192.168.1.6:5000/api/?list=subjects&grades=${widget.grade}&term=${widget.term}",
      );

      final data = response.data;

      if (data['subjects'] != null) {
        final subjects = (data['subjects'] as List).map((e) {
          final name = e.toString();
          return SubjectModel(
            id: subjectList.length + 1,
            name: name,
            subjectImage: subjectImages[name] ?? 'assets/image/default.png',
            grade: widget.grade,
            term: widget.term,
          );
        }).toList();

        setState(() {
          subjectList = subjects;
          filteredSubjects = subjects;
        });
      }
    } catch (e) {
      print("Error loading subjects: $e");
    }
  }

  void _filterSubjects(String query) {
    final result = subjectList.where((subject) =>
        subject.name.toLowerCase().contains(query.toLowerCase())).toList();

    setState(() {
      filteredSubjects = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: _filterSubjects),
          Expanded(
            child: filteredSubjects.isEmpty
                ? const Center(child: Text("لا توجد نتائج"))
                : ListView.builder(
              itemCount: filteredSubjects.length,
              itemBuilder: (context, index) {
                return SubjectComponent(
                  subjectModel: filteredSubjects[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
