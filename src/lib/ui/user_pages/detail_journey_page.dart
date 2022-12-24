import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:src/models/journey_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class DetailJourneyPage extends StatelessWidget {
  final JourneyModel journey;
  const DetailJourneyPage({
    super.key,
    required this.journey,
  });
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
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: secondaryColor,
          ),
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

    // Widget headerJourney() {
    //   return Expanded(
    //     child: Column(
    //       children: [
    //         Text(
    //           journey.title,
    //           overflow: TextOverflow.clip,
    //           style: primaryColorText.copyWith(
    //               fontSize: 14, fontWeight: FontWeight.w600),
    //         ),
    //         SizedBox(
    //           height: 4,
    //         ),
    //         Text(
    //           (DateFormat('dd MMMM yyyy').format(journey.date.toDate()))
    //               .toString(),
    //           style: secondaryColorText.copyWith(fontSize: 12),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget journeyImage() {
      return Container(
          height: 177,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(journey.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(defaultRadius)));
    }

    Widget journeyText() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        child: Text(
          (journey.content.replaceAll("(*)", "\n")),
          style: secondaryColorText.copyWith(color: Colors.black, fontSize: 12),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              journey.title,
              overflow: TextOverflow.clip,
              style: primaryColorText.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              (DateFormat('dd MMMM yyyy').format(journey.date.toDate()))
                  .toString(),
              style: secondaryColorText.copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 12,
            ),
            journeyImage(),
            SizedBox(
              height: 28,
            ),
            journeyText(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
