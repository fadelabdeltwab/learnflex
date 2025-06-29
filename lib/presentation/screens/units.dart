import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/app_bar.dart';
import '../widget/search_bar.dart';
import '../widget/units_component.dart';

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
  List<String> filteredUnits = [];
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
        "http://192.168.1.6:5000/api/?list=units&grades=${widget.grade}&term=${widget.term}&subject=${widget.subject}",
      );

      final data = List<String>.from(response.data['units'] ?? []);

      setState(() {
        units = data;
        filteredUnits = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "حدث خطأ أثناء تحميل الوحدات.";
        isLoading = false;
      });
    }
  }

  void _filterUnits(String query) {
    final result = units
        .where((unit) => unit.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredUnits = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: _filterUnits),
          const SizedBox(height: 16),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : errorMessage != null
                ? Center(child: Text(errorMessage!))
                : filteredUnits.isEmpty
                ? const Center(child: Text("لا توجد وحدات مطابقة"))
                : ListView.builder(
              itemCount: filteredUnits.length,
              itemBuilder: (context, index) {
                final unit = filteredUnits[index];
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
