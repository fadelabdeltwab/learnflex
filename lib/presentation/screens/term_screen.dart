import 'package:flutter/material.dart';
import 'package:learn_fix/presentation/widget/term_component.dart';

import '../../data/models/term_model.dart';
import '../widget/app_bar.dart';
import '../widget/search_bar.dart';

class TermScreen extends StatelessWidget {
  TermScreen({super.key});
  List<TermModel> termList = [
    TermModel(
      id: 1,
      termName: 'First Term'
    ),
    TermModel(id: 2, termName: "Second Term",),
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
              itemCount: termList.length,
              itemBuilder: (context, index) {
                return TermComponent(  termModel: termList[index],);
              },
            ),
          ),
        ],
      ),
    );
  }
}
