import 'package:flutter/material.dart';
import 'package:src/models/article_model.dart';
import 'package:src/ui/user_pages/detail_article_page.dart';
import 'package:src/ui/widgets/article_tile_card.dart';

import '../../shared/theme.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

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
          'Articles',
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
        children: [],
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: white2,
      body: content(),
    );
  }
}
