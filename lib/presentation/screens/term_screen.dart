import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/term_model.dart';
import '../widget/app_bar.dart';
import '../widget/search_bar.dart';
import '../widget/term.dart';

class TermScreen extends StatefulWidget {
  final String grade;

  const TermScreen({super.key, required this.grade});

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  final dio = Dio();
  List<TermModel> termList = [];

  @override
  void initState() {
    super.initState();
    fetchTerms();
  }

  Future<void> fetchTerms() async {
    try {
      final response = await dio.get(
        "http://localhost:5000/api/?list=terms&grades=${widget.grade}",
      );
      final data = response.data;
      if (data['terms'] != null) {
        setState(() {
          termList =
              (data['terms'] as List)
                  .map((e) => TermModel(name: e.toString()))
                  .toList();
        });
      }
    } catch (e) {
      print("Failed to load terms: $e");
    }
  }

  void navigateToSubjects(String term) {
    Navigator.pushNamed(context, '/subjects/${widget.grade}/$term');
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
            child: termList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: termList.length,
              itemBuilder: (context, index) {
                return Term(
                  termModel: termList[index],
                  grade: widget.grade,
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
