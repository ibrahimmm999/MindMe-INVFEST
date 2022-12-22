import 'package:flutter/material.dart';
import 'package:src/ui/widgets/custom_button.dart';
import 'package:src/ui/widgets/video_tile_card.dart';

import '../../shared/theme.dart';

class BookmarkVideoPage extends StatelessWidget {
  const BookmarkVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget emptyBookmark() {
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
              "Get your favorite videos",
              style: greyText,
            ),
            const SizedBox(
              height: 20,
            ),
            seeVideosButton()
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: ListView(
          padding: EdgeInsets.only(
              right: defaultMargin, left: defaultMargin, top: defaultMargin),
          children: [
            VideoTileCard(),
            VideoTileCard(),
            VideoTileCard(),
          ],
        ),
      );
    }

    return content();
  }
}
