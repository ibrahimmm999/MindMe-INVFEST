import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';

class PsikologDetailPage extends StatelessWidget {
  const PsikologDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 405,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/example/detail_psikolog.png"),
                fit: BoxFit.cover)),
      );
    }

    Widget buttonBack() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 12),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
            )),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 320),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        padding:
            EdgeInsets.only(top: 26, left: defaultMargin, right: defaultMargin),
        width: double.infinity,
        child: ListView(
          children: [
            Text(
              "Mr. Budi, S.Psi.",
              style: secondaryColorText.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w600),
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
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Resume",
              style: secondaryColorText.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Saya merupakan psikolog yang sudah berpengalaman. Saya sudah menangani lebih dari 1000 pasien. Saya siap sedia memberikan solusi dan menjadi tempat untuk bercerita bagi Anda.",
              style:
                  greyText.copyWith(fontWeight: FontWeight.w300, fontSize: 12),
            ),
            SizedBox(
              height: 200,
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [backgroundImage(), buttonBack(), content()],
      ),
    );
  }
}
