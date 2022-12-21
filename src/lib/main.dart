import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/sign_in_page.dart';
import 'package:src/ui/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
