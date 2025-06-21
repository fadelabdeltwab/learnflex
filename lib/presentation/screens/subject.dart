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
<<<<<<< HEAD
  List<SubjectModel> filteredSubjects = [];
=======
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c

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
<<<<<<< HEAD
        "http://192.168.1.6:5000/api/?list=subjects&grades=${widget.grade}&term=${widget.term}",
=======
        "http://localhost:5000/api/?list=subjects&grades=${widget.grade}&term=${widget.term}",
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
      );

      final data = response.data;

      if (data['subjects'] != null) {
<<<<<<< HEAD
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
=======
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
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
        });
      }
    } catch (e) {
      print("Error loading subjects: $e");
    }
  }

<<<<<<< HEAD
  void _filterSubjects(String query) {
    final result = subjectList.where((subject) =>
        subject.name.toLowerCase().contains(query.toLowerCase())
    ).toList();

    setState(() {
      filteredSubjects = result;
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
          SearchBarComponent(onChanged: _filterSubjects),
          Expanded(
            child: filteredSubjects.isEmpty
                ? const Center(child: Text("لا توجد نتائج"))
                : ListView.builder(
              itemCount: filteredSubjects.length,
              itemBuilder: (context, index) {
                return SubjectComponent(
                  subjectModel: filteredSubjects[index],
=======
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
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
