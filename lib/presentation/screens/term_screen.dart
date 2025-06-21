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
  List<TermModel> filteredTermList = [];

  @override
  void initState() {
    super.initState();
    fetchTerms();
  }

  Future<void> fetchTerms() async {
    try {
      final response = await dio.get(
        "http://192.168.1.6:5000/api/?list=terms&grades=${widget.grade}",
      );
      final data = response.data;
      if (data['terms'] != null) {
        final fetchedTerms = (data['terms'] as List)
            .map((e) => TermModel(name: e.toString()))
            .toList();
        setState(() {
          termList = fetchedTerms;
          filteredTermList = fetchedTerms;
        });
      }
    } catch (e) {
      print("Failed to load terms: $e");
    }
  }

  void _filterTerms(String query) {
    final result = termList.where((term) =>
        term.name.toLowerCase().contains(query.toLowerCase())
    ).toList();

    setState(() {
      filteredTermList = result;
    });
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
          SearchBarComponent(onChanged: _filterTerms),
          Expanded(
            child: filteredTermList.isEmpty
                ? const Center(child: Text("لا توجد فصول مطابقة"))
                : ListView.builder(
              itemCount: filteredTermList.length,
              itemBuilder: (context, index) {
                return Term(
                  termModel: filteredTermList[index],
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
