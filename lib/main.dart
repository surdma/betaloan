import 'dart:io';

import 'package:beta_loan/views/auths.dart';
import 'package:beta_loan/views/dashboard.dart';
import 'package:beta_loan/views/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

_flutterFire() async {
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    return await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: '...',
      appId: '...',
      messagingSenderId: '...',
      projectId: '...',
    ));
  } else {
    return await Firebase.initializeApp();
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _flutterFire();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF7DD9E5),
    ),
  );
  runApp(const MainWindow());
}

class MainWindow extends StatelessWidget {
  const MainWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xffD3F8FB)),
      home: DashBoard(),
    );
  }
}
