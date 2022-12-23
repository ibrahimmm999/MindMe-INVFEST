import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:src/cubit/journey_cubit.dart';
import 'package:src/models/article_model.dart';
import 'package:src/models/journey_model.dart';
import 'package:src/ui/user_pages/detail_journey_page.dart';
import 'package:src/ui/user_pages/journey_form_page.dart';

import '../../shared/theme.dart';

class JourneyPage extends StatefulWidget {
  const JourneyPage({super.key});

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  @override
  void initState() {
    context.read<JourneyCubit>().fetchJourney();
    super.initState();
  }

  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    //get collection from firebase, collection is table in mysql
    CollectionReference journey = firebase.collection('journey');

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
          'Journey',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget journeyTileCard(JourneyModel journey, String id) {
      return GestureDetector(
        onTap: () {
          // print(journey);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailJourneyPage(journey: journey),
            ),
          );
        },
        child: Container(
          // padding: const EdgeInsets.all(4),
          width: 315,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                height: 102,
                width: 102,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(journey.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Container(
                  width: 193,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        journey.title,
                        style: primaryColorText.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        (DateFormat('dd MMMM yyyy')
                                .format(journey.date.toDate()))
                            .toString(),
                        style: secondaryColorText.copyWith(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JourneyFormPage(
                                  id: id,
                                )));
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 16,
                    color: grey,
                  ))
            ],
          ),
        ),
      );
    }

    Widget journeyList(List<JourneyModel> journey) {
      return ListView(
          padding: EdgeInsets.only(
            top: 24,
            left: defaultMargin,
            right: defaultMargin,
          ),
          children: journey.map(
            (e) {
              return journeyTileCard(e, e.id);
            },
          ).toList());
    }

    return BlocConsumer<JourneyCubit, JourneyState>(
      listener: (context, state) {
        if (state is JourneyFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: red,
          ));
        }
      },
      builder: (context, state) {
        if (state is JourneySuccess) {
          return Scaffold(
            appBar: header(),
            body: journeyList(state.journey),
            floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.add_rounded,
                  size: 40,
                ),
                backgroundColor: tosca,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JourneyFormPage()));
                }),
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
