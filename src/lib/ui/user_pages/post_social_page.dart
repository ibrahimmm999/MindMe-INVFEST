// ignore_for_file: unnecessary_new, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, use_key_in_widget_constructors, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/cubit/change_image_cubit.dart';
import 'package:src/models/journey_model.dart';
import 'package:src/ui/user_pages/detail_journey_page.dart';
import 'package:src/ui/user_pages/journey_page.dart';
import 'package:src/ui/user_pages/social_page.dart';

import '../../models/user_model.dart';
import '../../shared/theme.dart';

class PostSocialPage extends StatefulWidget {
  @override
  State<PostSocialPage> createState() => _PostSocialPageState();
}

class _PostSocialPageState extends State<PostSocialPage> {
  final _formKey = GlobalKey<FormState>();

  var contentController = TextEditingController();
  final CollectionReference _postReference =
      FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    String defaultImageUrl =
        'https://firebasestorage.googleapis.com/v0/b/mindme-5a2a8.appspot.com/o/image_comment%2Farticle1_example.png?alt=media&token=e44aafdb-a067-4c21-9833-e837757b029b';
    PreferredSizeWidget header(UserModel user) {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear_rounded,
            size: 20,
            color: red,
          ),
          color: secondaryColor,
          iconSize: 16,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    DateTime currentTime = DateTime.now();
                    _postReference.add({
                      'content':
                          (contentController.text).replaceAll("\n", "(*)"),
                      'imageUrl':
                          'https://firebasestorage.googleapis.com/v0/b/mindme-5a2a8.appspot.com/o/image_comment%2Farticle1_example.png?alt=media&token=e44aafdb-a067-4c21-9833-e837757b029b',
                      'date': Timestamp.fromDate(currentTime),
                      'authorId': user.id,
                      'author': user.name,
                      'comments': []
                    });

                    //snackbar notification
                    final snackBar =
                        SnackBar(content: Text('Data saved successfully!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SocialPage()),
                        (route) => false);
                  }
                },
                icon: Icon(
                  Icons.send,
                  size: 20,
                  color: primaryColor,
                )),
          )
        ],
        title: Text(
          'Post',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            appBar: header(state.user),
            body: Form(
              key: _formKey,
              child: ListView(children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.only(right: 12, left: 12),
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: contentController,
                        keyboardType: TextInputType.multiline,
                        minLines: 32,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: "Content",
                            fillColor: Colors.white,
                            filled: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Content is Required!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )
              ]),
            ),
            floatingActionButton:
                FloatingActionButton(onPressed: () {}, backgroundColor: tosca),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
