import 'package:flutter/material.dart';

import '../../data/models/units_model.dart';
import '../widget/app_bar.dart';
import '../widget/search_bar.dart';
import '../widget/units_component.dart';

class UnitsScreen extends StatelessWidget {
  UnitsScreen({super.key});
  final List<UnitsModel> unitsList = [
    UnitsModel(id: 1, name: "Unit 1"),
    UnitsModel(id: 2, name: "Unit 2"),
    UnitsModel(id: 3, name: "Unit 3"),
    UnitsModel(id: 4, name: "Unit 4"),
    UnitsModel(id: 5, name: "Unit 5"),
    UnitsModel(id: 6, name: "Unit 6"),
    UnitsModel(id: 7, name: "Unit 7"),
    UnitsModel(id: 8, name: "Unit 8"),
    UnitsModel(id: 9, name: "Unit 9"),
    UnitsModel(id: 10, name: "Unit 10"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBarComponent(onChanged: (value) {}),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: unitsList.length,
              itemBuilder: (context, index) {
                return UnitsComponent(unitsModel: unitsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
