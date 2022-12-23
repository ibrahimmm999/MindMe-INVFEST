import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/cubit/post_cubit.dart';
import 'package:src/models/comment_model..dart';
import 'package:src/models/post_model.dart';
import 'package:src/models/user_model.dart';
import 'package:src/services/post_service.dart';
import 'package:src/services/user_service.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/comment_bubbles.dart';

class SocialCommentPage extends StatelessWidget {
  SocialCommentPage({required this.post, super.key});

  final PostModel post;
  final TextEditingController commentController =
      TextEditingController(text: '');

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

    Widget postCard() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              '${post.author} - ${post.date.toString()}',
              style: greyText.copyWith(
                fontWeight: regular,
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
            Container(
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
            Row(
              children: [
                Image.asset(
                  'assets/comment_icon.png',
                  width: 16,
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
          ],
        ),
      );
    }

    Widget comment() {
      return Column(
          children: post.comments
              .map((e) => CommentBubble(
                    sender: e.sender,
                    date: e.date.toString(),
                    text: e.text,
                    isSender:
                        e.senderId == FirebaseAuth.instance.currentUser!.uid,
                  ))
              .toList());
    }

    Widget chatInput() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: white,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    cursorColor: primaryColor,
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Whar do you mind?',
                      hintStyle: greyText,
                      focusColor: primaryColor,
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultRadius)),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return GestureDetector(
                        onTap: () {
                          post.comments.insert(
                            0,
                            CommentModel(
                              id: (post.comments.length + 1).toString(),
                              senderId: state.user.id,
                              sender: state.user.name,
                              text: commentController.text,
                              date: Timestamp.fromDate(
                                DateTime.now(),
                              ),
                            ),
                          );
                          context.read<PostCubit>().addComment(post);
                          commentController.clear();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Image.asset(
                          'assets/send_button.png',
                          width: 45,
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        children: [
          postCard(),
          Container(
            margin: const EdgeInsets.all(16),
            child: comment(),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: Column(
        children: [
          Expanded(
            child: content(),
          ),
          chatInput(),
        ],
      ),
    );
  }
}
