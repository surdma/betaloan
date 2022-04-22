import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'onboard.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  User? _user;
  bool isLoading = true;

  @override
  void initState() {
    initializeUSer();
    super.initState();
  }

  initializeUSer() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    _user = _firebaseAuth.currentUser;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _user == null
              ? const SplashScreen()
              : const DashBoard(),
    );
  }
}
