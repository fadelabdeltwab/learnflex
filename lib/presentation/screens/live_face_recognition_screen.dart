import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class LiveFaceRecognitionScreen extends StatefulWidget {
  const LiveFaceRecognitionScreen({super.key});

  @override
  State<LiveFaceRecognitionScreen> createState() =>
      _LiveFaceRecognitionScreenState();
}

class _LiveFaceRecognitionScreenState extends State<LiveFaceRecognitionScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  Timer? _timer;
  String recognizedName = "";
  List<Map<String, String>> attendanceRecords = [];
  Set<String> recordedKeys = {}; // لمنع التكرار في نفس اليوم

  String get currentDate {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

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
      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
      );
      await _cameraController.initialize();
      if (!mounted) return;
      setState(() => _isCameraInitialized = true);
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
          Uri.parse(
            'http://192.168.1.6:8000/recognize/',
          ), // غيّر IP حسب السيرفر بتاعك
        );
        request.files.add(
          http.MultipartFile.fromBytes('file', bytes, filename: 'frame.jpg'),
        );

        final response = await request.send();
        final body = await response.stream.bytesToString();
        final decoded = json.decode(body);

        if (decoded is Map && decoded.containsKey("name")) {
          String name = decoded["name"].toString().trim().toUpperCase();

          name = name.replaceAll(RegExp(r'\s*\(.*\)$'), '');

          final now = DateTime.now();
          final formattedTime =
              "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

          setState(() {
            recognizedName = name;
          });

          final key = "$name|$currentDate";

          if (name != 'UNKNOWN' && !recordedKeys.contains(key)) {
            recordedKeys.add(key);
            attendanceRecords.add({
              "name": name,
              "date": currentDate,
              "time": formattedTime,
            });
            print("🟢 Added: $key");
          } else {
            print("⛔ Already recorded today: $key");
          }
        }
      } catch (e) {
        print("Error sending frame: $e");
      }
    });
  }

  Future<void> exportToExcel() async {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permission denied to write file")),
      );
      return;
    }

    var excel = Excel.createExcel();
    Sheet sheet = excel['Attendance'];
    sheet.appendRow(['Name', 'Date', 'Time']);

    final Set<String> exportedKeys = {};

    for (var record in attendanceRecords) {
      final key = "${record['name']?.trim().toUpperCase()}_${record['date']}";
      if (!exportedKeys.contains(key)) {
        exportedKeys.add(key);
        sheet.appendRow([
          record['name'] ?? '',
          record['date'] ?? '',
          record['time'] ?? '',
        ]);
      }
    }

    try {
      final directory = Directory('/storage/emulated/0/Download');
      String filePath = '${directory.path}/attendance_log.xlsx';
      final bytes = excel.encode();
      if (bytes == null) throw Exception("Failed to encode Excel file");

      File file =
          File(filePath)
            ..createSync(recursive: true)
            ..writeAsBytesSync(bytes);

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('📁 File saved to: $filePath')));
      }

      await OpenFile.open(filePath);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("❌ Failed to save file: $e")));
      }
    }
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
        body: const Center(child: Text("Camera not supported on web")),
      );
    }

    if (!_isCameraInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text("Face Recognition")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Recognition"),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: exportToExcel,
            tooltip: "Export Attendance",
          ),
        ],
      ),
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          if (recognizedName.isNotEmpty)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    recognizedName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
