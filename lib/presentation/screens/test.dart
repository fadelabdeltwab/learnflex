import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("3D Model Viewer")),
        body: Center(
          child: ModelViewer(
            src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
            alt: "A 3D model of the Astronaut",
            autoRotate: true,
            cameraControls: true,
            ar: true,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
