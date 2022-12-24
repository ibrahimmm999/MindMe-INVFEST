import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/models/article_model.dart';
import 'package:src/ui/user_pages/articles_page.dart';
import 'package:src/ui/widgets/custom_button.dart';

import '../../shared/theme.dart';
import '../widgets/article_tile_card.dart';

class BookmarkArticlePage extends StatelessWidget {
  const BookmarkArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget emptyBookmark() {
      Widget moreArticlesButton() {
        return CustomButton(
            radiusButton: defaultRadius,
            buttonColor: primaryColor,
            buttonText: "More Articles",
            widthButton: 150,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ArticlesPage()));
            },
            heightButton: 44);
      }

      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/no_bookmark_icon.png"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Opss no bookmark yet?",
              style:
                  secondaryColorText.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Get your favorite articles",
              style: greyText,
            ),
            const SizedBox(
              height: 20,
            ),
            moreArticlesButton(),
          ],
        ),
      );
    }

    Widget content(List<ArticleModel> articles) {
      return Expanded(
        child: ListView(
          padding: EdgeInsets.only(
              right: defaultMargin, left: defaultMargin, top: defaultMargin),
          children: articles
              .map((article) => ArticleTileCard(article: article))
              .toList(),
        ),
      );
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return state.user.bookmark_article.isEmpty
              ? emptyBookmark()
              : content(state.user.bookmark_article);
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: white,
            ),
          );
        }
      },
    );
  }
}
