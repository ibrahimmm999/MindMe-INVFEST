import 'package:flutter/material.dart';

import 'package:src/ui/sign_in_page.dart';
import 'package:src/ui/splash_screen.dart';
import 'package:src/ui/user_pages/edit_profile_page.dart';
import 'package:src/ui/user_pages/main_page.dart';
import 'package:src/ui/user_pages/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/sign-up': (context) => SignUpPage(),
        '/sign-in': (context) => SignInPage(),
        '/main': (context) => MainPage(),
        '/edit-profile': (context) => EditProfilePage(),
      },
    );
  }
}
