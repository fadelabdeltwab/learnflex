import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_fix/presentation/screens/splash.dart';
import 'package:learn_fix/presentation/screens/test.dart';

void main() {
<<<<<<< HEAD
  runApp(const LearnFlex());
}


=======
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const LearnFlex(),
    ),
  );
  // runApp(LearnFlex());
}

>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
class LearnFlex extends StatelessWidget {
  const LearnFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
