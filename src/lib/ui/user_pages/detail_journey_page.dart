import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DetailJourneyPage extends StatelessWidget {
  const DetailJourneyPage({super.key});

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
                onPressed: () {},
                icon: Icon(
                  Icons.check_rounded,
                  size: 20,
                  color: tosca,
                )),
          )
        ],
        title: Text(
          'Articles',
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
