import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/models/video_model.dart';
import 'package:src/ui/user_pages/course_videos_page.dart';
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CourseVideosPage()));
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

    Widget content(List<VideoModel> videos) {
      return Expanded(
        child: ListView(
            padding: EdgeInsets.only(
                right: defaultMargin, left: defaultMargin, top: defaultMargin),
            children:
                videos.map((video) => VideoTileCard(video: video)).toList()),
      );
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return state.user.bookmark_video.isEmpty
              ? emptyBookmark()
              : content(state.user.bookmark_video);
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
