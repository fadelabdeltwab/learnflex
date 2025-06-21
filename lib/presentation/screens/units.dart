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
<<<<<<< HEAD
  List<String> filteredUnits = [];

=======
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
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
<<<<<<< HEAD
        "http://192.168.1.6:5000/api/?list=units&grades=${widget.grade}&term=${widget.term}&subject=${widget.subject}",
      );

      final data = List<String>.from(response.data['units'] ?? []);

      setState(() {
        units = data;
        filteredUnits = data;
=======
        "http://localhost:5000/api/?list=units&grades=${widget.grade}&term=${widget.term}&subject=${widget.subject}",
      );

      setState(() {
        units = List<String>.from(response.data['units'] ?? []);
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "حدث خطأ أثناء تحميل الوحدات.";
        isLoading = false;
      });
    }
  }

<<<<<<< HEAD
  void _filterUnits(String query) {
    final result = units.where((unit) =>
        unit.toLowerCase().contains(query.toLowerCase())
    ).toList();

    setState(() {
      filteredUnits = result;
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
=======
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
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
          ),
        ],
      ),
    );
  }
}
