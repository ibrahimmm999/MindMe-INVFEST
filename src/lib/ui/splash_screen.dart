import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/video_cubit.dart';
import 'package:src/shared/theme.dart';

import '../cubit/article_cubit.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/consultant_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      User? currentUser = FirebaseAuth.instance.currentUser;
      context.read<ConsultanCubit>().fetchConsultants();
      context.read<ArticleCubit>().fetchArticles();
      context.read<VideoCubit>().fetchVideos();
      if (currentUser == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(currentUser.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
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
