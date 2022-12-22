import 'package:flutter/material.dart';
import 'package:src/ui/user_pages/bookmark_article_page.dart';
import 'package:src/ui/user_pages/bookmark_video_page.dart';
import 'package:src/ui/widgets/custom_button.dart';

import '../../shared/theme.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  int bookmarkIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: whiteText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget switchContent() {
      return Container(
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  bookmarkIndex = 0;
                });
              },
              child: Container(
                color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      'Articles',
                      style:
                          bookmarkIndex == 0 ? primaryColorText : disableText,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: bookmarkIndex == 0
                            ? primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bookmarkIndex = 1;
                });
              },
              child: Container(
                color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      'Videos',
                      style:
                          bookmarkIndex == 1 ? primaryColorText : disableText,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: bookmarkIndex == 1
                            ? primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content(int index) {
      switch (index) {
        case 0:
          return BookmarkArticlePage();
          break;
        case 1:
          return BookmarkVideoPage();
          break;
        default:
          return BookmarkArticlePage();
      }
    }

    return Scaffold(
      backgroundColor: white2,
      body: Column(
        children: [
          header(),
          switchContent(),
          content(bookmarkIndex),
        ],
      ),
    );
  }
}
