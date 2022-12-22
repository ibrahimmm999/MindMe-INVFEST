import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/detail_video_page.dart';

class VideoTileCard extends StatelessWidget {
  const VideoTileCard({super.key});

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
      padding: EdgeInsets.only(top: 4, left: 4, right: 4),
      decoration: BoxDecoration(color: white),
      height: 269,
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
                        image:
                            AssetImage("assets/example/article1_example.png"),
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
                          builder: (context) => DetailVideoPage(),
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
                        "Kesehatan Mental : Gejala, Faktor dan Penanganan",
                        overflow: TextOverflow.clip,
                        style: primaryColorText.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "19 september 2022",
                        style: secondaryColorText.copyWith(fontSize: 8),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Yuni Rahmawati",
                        style: greyText.copyWith(fontSize: 8),
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
          )
        ],
      ),
    );
  }
}
