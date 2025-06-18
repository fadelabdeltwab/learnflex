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
        "http://localhost:5000/api/?list=subjects&grades=${widget.grade}&term=${widget.term}",
      );

      final data = response.data;

      if (data['subjects'] != null) {
        setState(() {
          subjectList = (data['subjects'] as List).map((e) {
            final name = e.toString();
            return SubjectModel(
              id: subjectList.length + 1,
              name: name,
              subjectImage: subjectImages[name] ?? 'assets/image/default.png',
              grade: widget.grade,
              term: widget.term,
            );
          }).toList();
        });
      }
    } catch (e) {
      print("Error loading subjects: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(
            onChanged: (value) {},
          ),
          Expanded(
            child: subjectList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: subjectList.length,
              itemBuilder: (context, index) {
                return SubjectComponent(
                  subjectModel: subjectList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
