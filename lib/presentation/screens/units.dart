import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/app_bar.dart';
import '../widget/search_bar.dart';
import '../widget/units_component.dart'; // نأكد أننا بنستورد UnitsComponent هنا

class UnitsScreen extends StatefulWidget {
  final String grade;
  final String term;
  final String subject;

  const UnitsScreen({
    super.key,
    required this.grade,
    required this.term,
    required this.subject,
  });

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  final dio = Dio();
  List<String> units = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchUnits();
  }

  Future<void> fetchUnits() async {
    try {
      final response = await dio.get(
        "http://localhost:5000/api/?list=units&grades=${widget.grade}&term=${widget.term}&subject=${widget.subject}",
      );

      setState(() {
        units = List<String>.from(response.data['units'] ?? []);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "حدث خطأ أثناء تحميل الوحدات.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: (value) {}),
          const SizedBox(height: 16),
          Expanded(
            child:
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage != null
                    ? Center(child: Text(errorMessage!))
                    : units.isEmpty
                    ? const Center(child: Text("لا توجد وحدات لعرضها"))
                    : ListView.builder(
                      itemCount: units.length,
                      itemBuilder: (context, index) {
                        final unit = units[index];
                        return UnitsComponent(
                          unit: unit,
                          grade: widget.grade,
                          term: widget.term,
                          subject: widget.subject,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
