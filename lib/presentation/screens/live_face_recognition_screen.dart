import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LiveFaceRecognitionScreen extends StatefulWidget {
  const LiveFaceRecognitionScreen({super.key});

  @override
  State<LiveFaceRecognitionScreen> createState() =>
      _LiveFaceRecognitionScreenState();
}

class _LiveFaceRecognitionScreenState
    extends State<LiveFaceRecognitionScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  String recognitionResult = '';
  Timer? _timer;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      initCamera();
    }
  }

  Future<void> initCamera() async {
    try {
      _cameras = await availableCameras();
      final frontCamera = _cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      );

      _cameraController =
          CameraController(frontCamera, ResolutionPreset.medium);

      await _cameraController.initialize();
      if (!mounted) return;

      setState(() {
        _isCameraInitialized = true;
      });

      _startStreaming();
    } catch (e) {
      print("Camera initialization failed: $e");
    }
  }

  void _startStreaming() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) async {
      try {
        final image = await _cameraController.takePicture();
        final bytes = await image.readAsBytes();

        final request = http.MultipartRequest(
          'POST',
          Uri.parse('http://127.0.0.1:8000/recognize/'),
        );
        request.files.add(http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: 'frame.jpg',
        ));

        final response = await request.send();
        final body = await response.stream.bytesToString();

        setState(() {
          recognitionResult = body;
        });
      } catch (e) {
        print("Error sending frame: $e");
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    if (!kIsWeb && _isCameraInitialized) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text("Face Recognition")),
        body: const Center(
          child: Text("Camera not supported on web"),
        ),
      );
    }

    if (!_isCameraInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text("Face Recognition")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Face Recognition")),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _cameraController.value.aspectRatio,
            child: CameraPreview(_cameraController),
          ),
          const SizedBox(height: 20),
          Text(
            "Result: $recognitionResult",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
