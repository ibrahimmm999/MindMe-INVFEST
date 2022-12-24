import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/models/video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/user_model.dart';
import '../../shared/theme.dart';

class DetailVideoPage extends StatefulWidget {
  final VideoModel video;
  const DetailVideoPage({Key? key, required this.video}) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late YoutubePlayerController ytController;
  TextEditingController linkController = TextEditingController();
  TextEditingController seekController = TextEditingController();

  @override
  void initState() {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.video.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  bool isBookmarked = false;

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
          'Video',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Wrap(
            children: [
              YoutubePlayer(
                controller: ytController,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.video.title,
                        style: secondaryColorText.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      ),
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          List<VideoModel> userBookmark =
                              state.user.bookmark_video;
                          isBookmarked = userBookmark.contains(widget.video);
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(right: 30, top: 10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: isBookmarked
                                          ? AssetImage("assets/love_icon.png")
                                          : AssetImage("assets/unlove.png"),
                                      fit: BoxFit.cover)),
                            ),
                            onTap: () {
                              if (isBookmarked) {
                                userBookmark.remove(widget.video);
                              } else {
                                userBookmark.add(widget.video);
                              }
                              setState(() {
                                isBookmarked = !isBookmarked;
                              });
                              context.read<AuthCubit>().updateUser(
                                    UserModel(
                                      id: state.user.id,
                                      email: state.user.email,
                                      name: state.user.name,
                                      username: state.user.username,
                                      bookmark_article:
                                          state.user.bookmark_article,
                                      bookmark_video: state.user.bookmark_video,
                                      alamat: state.user.alamat,
                                      isPremium: state.user.isPremium,
                                      openTime: state.user.openTime,
                                      photoUrl: state.user.photoUrl,
                                      resume: state.user.resume,
                                      role: state.user.role,
                                    ),
                                  );
                            },
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.only(right: 30, top: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: isBookmarked
                                        ? AssetImage("assets/love_icon.png")
                                        : AssetImage("assets/unlove.png"),
                                    fit: BoxFit.cover)),
                          );
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "by ${widget.video.uploader}",
                  style: greyText.copyWith(fontSize: 14),
                ),
              ],
            ),
          )
          // Container(
          //   margin: EdgeInsets.only(left: 25),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Title:',
          //         style: blackTextStyle.copyWith(
          //             fontSize: 18, fontWeight: semiBold),
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Text(ytController.metadata.title,
          //           style: darkGreyTextStyle.copyWith(fontSize: 14)),
          //       SizedBox(
          //         height: 18,
          //       ),
          //       Text(
          //         'Channel:',
          //         style: blackTextStyle.copyWith(
          //             fontSize: 18, fontWeight: semiBold),
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Text(
          //         ytController.metadata.author,
          //         style: darkGreyTextStyle,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
