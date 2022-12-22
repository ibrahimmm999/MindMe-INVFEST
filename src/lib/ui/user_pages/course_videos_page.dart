import 'package:flutter/material.dart';
import 'package:src/ui/user_pages/detail_video_page.dart';

import '../../shared/theme.dart';

class CourseVideosPage extends StatelessWidget {
  const CourseVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: secondaryColor,
          iconSize: 16,
        ),
        title: Text(
          'Course Videos',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      Widget contentTile() {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 24),
          padding: EdgeInsets.only(top: 4, left: 4, right: 4),
          decoration: BoxDecoration(color: white),
          height: 269,
          width: 315,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 173,
                    width: 325,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/example/article1_example.png"),
                            fit: BoxFit.cover)),
                  ),
                  Center(
                      child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailVideoPage()));
                        },
                        icon: Icon(
                          Icons.play_circle,
                          size: 50,
                        )),
                  ))
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kesehatan Mental : Gejala, Faktor dan Penanganan",
                            overflow: TextOverflow.clip,
                            style: primaryColorText.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "19 september 2022",
                            style: secondaryColorText.copyWith(fontSize: 8),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Yuni Rahmawati",
                            style: greyText.copyWith(fontSize: 8),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30, top: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/love_icon.png"),
                            fit: BoxFit.cover)),
                  )
                ],
              )
            ],
          ),
        );
      }

      return Expanded(
          child: Container(
        color: white2,
        child: ListView(
          children: [contentTile(), contentTile(), contentTile()],
        ),
      ));
    }

    return Scaffold(
      appBar: header(),
      body: Column(
        children: [content()],
      ),
    );
  }
}
