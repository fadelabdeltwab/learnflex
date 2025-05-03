import 'package:flutter/material.dart';

import '../../data/models/sub_model.dart';
import '../widget/app_bar.dart';
import '../widget/search_bar.dart';
import '../widget/sub_component.dart';

class SubjectScreen extends StatelessWidget {
  SubjectScreen({super.key});
  List<SubModel> subjectList = [
    SubModel(
      id: 1,
      name: "Mathematics",
      subjectImage: "assets/image/math.png",
    ),
    SubModel(id: 2, name: "Science", subjectImage: "assets/image/science.png"),
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
              itemCount: subjectList.length,
              itemBuilder: (context, index) {
                return SubjectComponent(subjectModel: subjectList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
