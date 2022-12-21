import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:src/ui/widgets/custom_button.dart';

import '../../shared/theme.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

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

    Widget emptyBookmark() {
      Widget moreArticlesButton() {
        return CustomButton(
            radiusButton: defaultRadius,
            buttonColor: primaryColor,
            buttonText: "More Articles",
            widthButton: 150,
            onPressed: () {},
            heightButton: 44);
      }

      Widget seeVideosButton() {
        return CustomButton(
            radiusButton: defaultRadius,
            buttonColor: red,
            buttonText: "See Videos",
            widthButton: 120,
            onPressed: () {},
            heightButton: 44);
      }

      return Expanded(
          child: Container(
        color: white2,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/no_bookmark_icon.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Opss no bookmark yet?",
              style: secondaryColorText.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Get your favorite articles and videos",
              style: greyText,
            ),
            SizedBox(
              height: 20,
            ),
            moreArticlesButton(),
            SizedBox(
              height: 20,
            ),
            seeVideosButton()
          ],
        ),
      ));
    }

    return Column(
      children: [
        header(),
        emptyBookmark(),
      ],
    );
  }
}
