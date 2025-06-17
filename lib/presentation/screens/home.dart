import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/grade_model.dart';

import '../widget/app_bar.dart';
import '../widget/grade.dart';
import '../widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GradeModel> gradeList = [];

  final dio = Dio();
  bool isLoading = true;
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    fetchGrades();
    isLoading = false;
  }

  Future<void> fetchGrades() async {
    try {
      final response = await dio.get("http://localhost:5000/api/?list=grades");
      final data = response.data;
      if (data['grades'] != null) {
        setState(() {
          gradeList =
              (data['grades'] as List)
                  .map((e) => GradeModel(id: 0, name: e.toString()))
                  .toList();
        });
      }
    } catch (e) {
      print("Failed to load grades: $e");
    }
  }

  void navigateToTerms(String grade) {
    Navigator.pushNamed(
      context,
      '/terms/$grade',
    ); // أو استخدم MaterialPageRoute حسب مشروعك
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
                    : errorMessage != null
                    ? Center(child: Text(errorMessage!))
                    : gradeList.isEmpty
                    ? const Center(child: Text("لا توجد صفوف متاحة"))
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: gradeList.length,
                      itemBuilder: (context, index) {
                        return Grade(gradeModel: gradeList[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
