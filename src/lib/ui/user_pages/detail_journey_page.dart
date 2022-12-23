import 'package:flutter/material.dart';
import 'package:src/models/journey_model.dart';

import '../../shared/theme.dart';

class DetailJourneyPage extends StatelessWidget {
  final JourneyModel journey;
  const DetailJourneyPage({super.key, required this.journey});

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

    return Scaffold(
      appBar: header(),
    );
  }
}
