// ignore_for_file: unnecessary_new, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, use_key_in_widget_constructors, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:src/ui/user_pages/journey_page.dart';

import '../../shared/theme.dart';
import '../widgets/custom_button.dart';

class JourneyFormPage extends StatefulWidget {
  //constructor have one parameter, optional paramter
  //if have id we will show data and run update method
  //else run add data
  const JourneyFormPage({this.id});

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
  CollectionReference? users;

  void getData() async {
    //get users collection from firebase
    //collection is table in mysql
    users = firebase.collection('journey');

    //if have id
    if (widget.id != null) {
      //get users data based on id document
      var data = await users!.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        titleController = TextEditingController(text: item['title']);
        contentController = TextEditingController(text: item['content']);
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
                    //if id not null run add data to store data into firebase
                    //else update data based on id
                    if (widget.id == null) {
                      users!.add({
                        'title': titleController.text,
                        'content': contentController.text,
                      });
                    } else {
                      users!.doc(widget.id).update({
                        'title': titleController.text,
                        'content': contentController.text,
                      });
                    }
                    //snackbar notification
                    final snackBar =
                        SnackBar(content: Text('Data saved successfully!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => JourneyPage()),
                        (route) => false);
                  }
                  ;
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

        //this form for add and edit data
        //if have id passed from main, field will show data
        body: Form(
          key: _formKey,
          child: ListView(children: [
            Container(
              margin: EdgeInsets.only(top: 40, right: 25, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title',
                      style: secondaryColorText.copyWith(fontSize: 16)),
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
                    minLines: 24,
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
        ));
  }
}
