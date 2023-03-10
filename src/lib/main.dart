import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/change_image_cubit.dart';
import 'package:src/cubit/consultant_cubit.dart';
import 'package:src/cubit/get_chatId_cubit.dart';
import 'package:src/cubit/post_cubit.dart';
import 'package:src/cubit/post_stream_cubit.dart';

import 'package:src/ui/sign_in_page.dart';
import 'package:src/ui/splash_screen.dart';
import 'package:src/ui/user_pages/edit_profile_page.dart';
import 'package:src/ui/user_pages/main_page.dart';
import 'package:src/ui/user_pages/sign_up_page.dart';

import 'cubit/article_cubit.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/journey_cubit.dart';
import 'cubit/video_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ArticleCubit()),
        BlocProvider(create: (context) => JourneyCubit()),
        BlocProvider(create: (context) => PostCubit()),
        BlocProvider(create: (context) => VideoCubit()),
        BlocProvider(create: (context) => PostStreamCubit()),
        BlocProvider(create: (context) => ConsultanCubit()),
        BlocProvider(create: (context) => GetChatIdCubit()),
        BlocProvider(create: (context) => ChangeImageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/main': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
        },
      ),
    );
  }
}
