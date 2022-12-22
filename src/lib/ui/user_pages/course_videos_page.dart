import 'package:flutter/material.dart';
import 'package:src/ui/user_pages/detail_video_page.dart';
import 'package:src/ui/widgets/video_tile_card.dart';

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
      return ListView(
        padding: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: defaultMargin),
        children: [
          VideoTileCard(),
          VideoTileCard(),
          VideoTileCard(),
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      body: content(),
    );
  }
}
