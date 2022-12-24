// ignore_for_file: unnecessary_new, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, use_key_in_widget_constructors, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/change_image_cubit.dart';
import 'package:src/models/journey_model.dart';
import 'package:src/ui/user_pages/detail_journey_page.dart';
import 'package:src/ui/user_pages/journey_page.dart';

import '../../shared/theme.dart';

class JourneyFormPage extends StatefulWidget {
  final String id_user;
  //constructor have one parameter, optional paramter
  //if have id we will show data and run update method
  //else run add data
  const JourneyFormPage({this.id, required this.id_user});

  final String? id;

  @override
  State<JourneyFormPage> createState() => _JourneyFormPageState();
}

class _JourneyFormPageState extends State<JourneyFormPage> {
  //set form key
  final _formKey = GlobalKey<FormState>();

  //set texteditingcontroller variable
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference? journeys;

  void getData() async {
    //get journeys collection from firebase
    //collection is table in mysql
    journeys = firebase.collection('journey');

    //if have id
    if (widget.id != null) {
      //get journeys data based on id document
      var data = await journeys!.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        titleController = TextEditingController(
            text: (item['title']).toString().replaceAll("(*)", "\n"));
        contentController = TextEditingController(
            text: (item['content']).toString().replaceAll("(*)", "\n"));
      });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String defaultImageUrl =
        'https://firebasestorage.googleapis.com/v0/b/mindme-5a2a8.appspot.com/o/image_comment%2Farticle1_example.png?alt=media&token=e44aafdb-a067-4c21-9833-e837757b029b';
    PreferredSizeWidget header() {
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
                    if (widget.id == null) {
                      journeys!.add({
                        'title': (titleController.text),
                        'content':
                            (contentController.text).replaceAll("\n", "(*)"),
                        'imageUrl':
                            'https://firebasestorage.googleapis.com/v0/b/mindme-5a2a8.appspot.com/o/image_comment%2Farticle1_example.png?alt=media&token=e44aafdb-a067-4c21-9833-e837757b029b',
                        'date': Timestamp.fromDate(currentTime),
                        'id_user': widget.id_user
                      });
                    } else {
                      journeys!.doc(widget.id).update({
                        'title': titleController.text,
                        'content':
                            (contentController.text).replaceAll("\n", "(*)"),
                        'date': Timestamp.fromDate(currentTime),
                        'id_user': widget.id_user
                      });
                    }
                    //snackbar notification
                    final snackBar =
                        SnackBar(content: Text('Data saved successfully!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JourneyPage(
                                  user_id: widget.id_user,
                                )),
                        (route) => false);
                    print(widget.id_user);
                    print(journeys);
                  }
                },
                icon: Icon(
                  Icons.check_rounded,
                  size: 20,
                  color: tosca,
                )),
          )
        ],
        title: Text(
          'My Journey',
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
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title', style: secondaryColorText.copyWith(fontSize: 16)),
                SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title is Required!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Content',
                  style: secondaryColorText.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  minLines: 14,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Content",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Content is Required!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, backgroundColor: tosca),
    );
  }
}
