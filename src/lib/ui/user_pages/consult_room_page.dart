import 'package:flutter/material.dart';
import 'package:src/ui/user_pages/psikolog_detail_page.dart';

import '../../shared/theme.dart';

class ConsultRoomPage extends StatelessWidget {
  const ConsultRoomPage({super.key});

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
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: secondaryColor,
          iconSize: 16,
        ),
        title: Text(
          'Consult Room',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      Widget articleTile() {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PsikologDetailPage()));
          },
          child: Container(
            padding: EdgeInsets.all(4),
            width: 315,
            height: 110,
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Container(
                  height: 102,
                  width: 102,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/example/profile_pict_example.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    width: 193,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mr. Budi, S.Psi.",
                          style: secondaryColorText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: primaryColor,
                              size: 18,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Bandung",
                              style: secondaryColorText.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Open 24 Jam",
                          style: toscaText.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }

      return Expanded(
        child: Container(
          padding: EdgeInsets.only(
              right: defaultMargin, left: defaultMargin, top: defaultMargin),
          color: white2,
          child: ListView(
            children: [articleTile(), articleTile()],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Column(
        children: [content()],
      ),
    );
  }
}
