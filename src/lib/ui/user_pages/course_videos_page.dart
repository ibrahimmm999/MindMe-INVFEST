import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/models/video_model.dart';
import 'package:src/ui/user_pages/detail_video_page.dart';
import 'package:src/ui/widgets/video_tile_card.dart';

import '../../cubit/video_cubit.dart';
import '../../services/video_service.dart';
import '../../shared/theme.dart';

class CourseVideosPage extends StatefulWidget {
  const CourseVideosPage({super.key});

  @override
  State<CourseVideosPage> createState() => _CourseVideosPageState();
}

class _CourseVideosPageState extends State<CourseVideosPage> {
  @override
  void initState() {
    context.read<VideoCubit>().fetchVideos();
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
          'Course Videos',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget videoList(List<VideoModel> videos) {
      return ListView(
          padding: EdgeInsets.only(
            top: 24,
            left: defaultMargin,
            right: defaultMargin,
          ),
          children: videos.map(
            (e) {
              return VideoTileCard(
                video: e,
              );
            },
          ).toList());
    }

    return BlocConsumer<VideoCubit, VideoState>(
      listener: (context, state) {
        if (state is VideoFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: red,
          ));
        }
      },
      builder: (context, state) {
        if (state is VideoSuccess) {
          return Scaffold(
            appBar: header(),
            body: videoList(state.videos),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
