import 'dart:async';

import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo.png"), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
