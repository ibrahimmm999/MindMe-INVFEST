import 'package:flutter/material.dart';
import 'package:src/models/video_model.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/detail_video_page.dart';
import 'package:intl/intl.dart';

import '../../services/time_converter.dart';

class VideoTileCard extends StatelessWidget {
  const VideoTileCard({required this.video, super.key});

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    Widget customShadow() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 173,
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 8),
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(defaultRadius)),
      //height: 240,
      width: 315,
      child: Column(
        children: [
          // BACKGROUND IMAGE
          Stack(
            children: [
              Container(
                height: 173,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(video.thumbnail),
                        fit: BoxFit.cover)),
              ),
              customShadow(),
              Center(
                  child: Container(
                margin: EdgeInsets.only(top: 60),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailVideoPage(
                            video: video,
                          ),
                        ),
                      );
                    },
                    // PLAY BUTTON
                    icon: Icon(
                      Icons.play_circle,
                      size: 50,
                      color: white,
                    )),
              ))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          // JUDUL, DATE, AUTHOR
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        overflow: TextOverflow.clip,
                        style: primaryColorText.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        ConvertTime().convertToAgo(video.date),
                        style: secondaryColorText.copyWith(fontSize: 8),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        video.uploader,
                        style: greyText.copyWith(fontSize: 8),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
