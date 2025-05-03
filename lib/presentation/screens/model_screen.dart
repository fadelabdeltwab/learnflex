import 'package:flutter/material.dart';
import 'package:learn_fix/presentation/widget/custom_nav_bar.dart';

class ModelScreen extends StatelessWidget {
  const ModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model', style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
