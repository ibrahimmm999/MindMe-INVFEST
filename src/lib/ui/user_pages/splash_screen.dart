import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo.png"), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
