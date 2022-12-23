import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared/theme.dart';

class DetailVideoPage extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String uploader;
  DetailVideoPage(
      {Key? key,
      required this.videoUrl,
      required this.title,
      required this.uploader})
      : super(key: key);

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
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

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
                Text(
                  widget.title,
                  style: secondaryColorText.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "by ${widget.uploader}",
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
