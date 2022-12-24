import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:src/cubit/post_cubit.dart';
import 'package:src/cubit/post_stream_cubit.dart';
import 'package:src/models/comment_model..dart';
import 'package:src/models/post_model.dart';
import 'package:src/services/post_service.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/social_comment_page.dart';

class SocialPage extends StatelessWidget {
  SocialPage({super.key});

  final Stream<QuerySnapshot> postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: white,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              color: primaryColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Social',
              style: secondaryColorText.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget postCard(PostModel post) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${post.author} - ${DateFormat('dd MMMM yyyy').format(post.date.toDate()).toString()}',
              style: greyText.copyWith(
                fontWeight: medium,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              post.content,
              style: secondaryColorText.copyWith(
                fontWeight: light,
                fontSize: 12,
              ),
            ),
            post.imageUrl.isEmpty
                ? SizedBox()
                : Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SocialCommentPage(post: post),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/comment_icon.png',
                    width: 24,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.comments.length.toString(),
                    style: greyText.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget postCardSend(PostModel post) {
      return GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirm', style: redText),
                content: Text(
                  'Are you sure to delete this post?',
                  style: secondaryColorText,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NO',
                      style: secondaryColorText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      PostService().deletePost(post.id);
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'YES',
                      style: secondaryColorText,
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(bottom: 24),
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You - ${DateFormat('dd MMMM yyyy').format(post.date.toDate()).toString()}',
                style: greyText.copyWith(
                  fontWeight: medium,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                post.content,
                style: secondaryColorText.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
              post.imageUrl.isEmpty
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SocialCommentPage(post: post),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/comment_icon.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.comments.length.toString(),
                      style: greyText.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Hold to delete',
                style: disableText.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder(
          stream: postStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox();
            }

            List<PostModel> posts = snapshot.data!.docs.map((e) {
              return PostModel.fromJson(e.id, e.data() as Map<String, dynamic>);
            }).toList();

            posts.sort(
              (b, a) => a.date.compareTo(b.date),
            );
            return ListView(
                padding: EdgeInsets.only(
                  top: 24,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                children: posts.map(
                  (e) {
                    if (e.authorId == FirebaseAuth.instance.currentUser!.uid) {
                      return postCardSend(e);
                    } else {
                      return postCard(e);
                    }
                  },
                ).toList());
          });
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: content(),
    );
  }
}
