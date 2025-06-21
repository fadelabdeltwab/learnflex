import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/data/models/grade_model.dart';
import '../widget/app_bar.dart';
import '../widget/grade.dart';
import '../widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GradeModel> gradeList = [];
  List<GradeModel> filteredGrades = [];

  final dio = Dio();
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchGrades();
  }

  Future<void> fetchGrades() async {
    try {
      final response = await dio.get("http://192.168.1.6:5000/api/?list=grades");
      final data = response.data;

      if (data['grades'] != null) {
        final grades = (data['grades'] as List)
            .map((e) => GradeModel(id: 0, name: e.toString()))
            .toList();

        setState(() {
          gradeList = grades;
          filteredGrades = grades; // عرض كل الصفوف مبدئيًا
          isLoading = false;
        });
      }
    } catch (e) {
      print("Failed to load grades: $e");
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

  void navigateToTerms(String grade) {
    Navigator.pushNamed(
      context,
      '/terms/$grade',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
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
          ),
        ],
      ),
    );
  }
}
