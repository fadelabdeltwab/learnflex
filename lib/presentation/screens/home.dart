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
<<<<<<< HEAD
  List<GradeModel> filteredGrades = [];
=======
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c

  final dio = Dio();
  bool isLoading = true;
  String? errorMessage;
<<<<<<< HEAD

=======
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  @override
  void initState() {
    super.initState();
    fetchGrades();
<<<<<<< HEAD
=======
    isLoading = false;
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  }

  Future<void> fetchGrades() async {
    try {
<<<<<<< HEAD
      final response =
      await dio.get("http://192.168.1.6:5000/api/?list=grades");
      final data = response.data;
      if (data['grades'] != null) {
        final grades = (data['grades'] as List)
            .map((e) => GradeModel(id: 0, name: e.toString()))
            .toList();
        setState(() {
          gradeList = grades;
          filteredGrades = grades; // في الأول نعرض الكل
          isLoading = false;
=======
      final response = await dio.get("http://localhost:5000/api/?list=grades");
      final data = response.data;
      if (data['grades'] != null) {
        setState(() {
          gradeList =
              (data['grades'] as List)
                  .map((e) => GradeModel(id: 0, name: e.toString()))
                  .toList();
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
        });
      }
    } catch (e) {
      print("Failed to load grades: $e");
<<<<<<< HEAD
      setState(() {
        errorMessage = "حدث خطأ أثناء تحميل الصفوف";
        isLoading = false;
      });
    }
  }

  void _filterGrades(String query) {
    final result = gradeList
        .where((grade) => grade.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredGrades = result;
    });
  }

=======
    }
  }

>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  void navigateToTerms(String grade) {
    Navigator.pushNamed(
      context,
      '/terms/$grade',
<<<<<<< HEAD
    );
=======
    ); // أو استخدم MaterialPageRoute حسب مشروعك
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
<<<<<<< HEAD
          SearchBarComponent(onChanged: _filterGrades),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : errorMessage != null
                ? Center(child: Text(errorMessage!))
                : filteredGrades.isEmpty
                ? const Center(child: Text("لا توجد نتائج مطابقة"))
                : ListView.builder(
              itemCount: filteredGrades.length,
              itemBuilder: (context, index) {
                return Grade(gradeModel: filteredGrades[index]);
              },
            ),
=======
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
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
          ),
        ],
      ),
    );
  }
}
