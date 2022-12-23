import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/bookmark_page.dart';
import 'package:src/ui/user_pages/chat_page.dart';
import 'package:src/ui/user_pages/home_page.dart';
import 'package:src/ui/user_pages/profile_page.dart';
import 'package:src/ui/user_pages/social_page.dart';

import '../../cubit/post_stream_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget socialButton() {
      return FloatingActionButton(
        onPressed: () {
          if (currentIndex == 4) {
          } else {
            setState(() {
              currentIndex = 4;
            });
          }
        },
        backgroundColor: tosca,
        child: currentIndex == 4
            ? Image.asset(
                'assets/add_post.png',
                width: 25,
              )
            : Image.asset(
                'assets/social.png',
                width: 50,
              ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: white,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex <= 3 ? currentIndex : 0,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/home.png',
                    color: currentIndex == 0 ? primaryColor : disableColor,
                    width: 21,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/chat.png',
                    color: currentIndex == 1 ? primaryColor : disableColor,
                    width: 20,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/bookmark.png',
                    color: currentIndex == 2 ? primaryColor : disableColor,
                    width: 12,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/profile.png',
                    color: currentIndex == 3 ? primaryColor : disableColor,
                    width: 18,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return BookmarkPage();
        case 3:
          return ProfilePage();
        case 4:
          return SocialPage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: white2,
      floatingActionButton: socialButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
