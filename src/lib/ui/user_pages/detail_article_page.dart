import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:src/models/article_model.dart';

import '../../cubit/article_cubit.dart';
import '../../shared/theme.dart';

class DetailArticlePage extends StatefulWidget {
  final ArticleModel article;
  const DetailArticlePage({super.key, required this.article});

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  @override
  void initState() {
    context.read<ArticleCubit>().fetchArticles();
    super.initState();
  }

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
      Widget headerArticle() {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.title,
                      overflow: TextOverflow.clip,
                      style: primaryColorText.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      (DateFormat('dd MMMM yyyy')
                              .format(widget.article.date.toDate()))
                          .toString(),
                      style: secondaryColorText.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.article.author,
                      style: greyText.copyWith(fontSize: 12),
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
        );
      }

      Widget articleImage() {
        return Container(
            height: 177,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.article.thumbnail),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(defaultRadius)));
      }

      Widget articleText() {
        return Container(
          margin: EdgeInsets.only(top: 28),
          child: Text(
            (widget.article.content).replaceAll("(*)", "\n"),
            style:
                secondaryColorText.copyWith(color: Colors.black, fontSize: 12),
          ),
        );
      }

      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          margin: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultRadius),
                  topRight: Radius.circular(defaultRadius))),
          child: Column(
            children: [
              headerArticle(),
              const SizedBox(
                height: 12,
              ),
              articleImage(),
              articleText()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: content(),
    );
  }
}
