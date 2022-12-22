import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DetailArticlePage extends StatelessWidget {
  const DetailArticlePage({super.key});

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

    Widget content() {
      Widget headerArticle() {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kesehatan Mental : Gejala, Faktor dan Penanganan",
                      overflow: TextOverflow.clip,
                      style: primaryColorText.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "19 september 2022",
                      style: secondaryColorText.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Yuni Rahmawati",
                      style: greyText.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30, top: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/love_icon.png"),
                      fit: BoxFit.cover)),
            )
          ],
        );
      }

      Widget articleImage() {
        return Container(
            height: 177,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/example/article_banner.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(defaultRadius)));
      }

      Widget articleText() {
        return Container(
          margin: EdgeInsets.only(top: 28),
          child: Text(
            "Sahabat Ukhuwah, sepertinya sudah tidak heran jika mendengar kata depresi, stres dan frustasi. Bukan cuma mendengar, mungkin Sahabat pernah bertemu dengan orang-orang yang memiliki atau penyintas gangguan seperti ini. Hal ini berhubungan dengan kesehatan mental seseorang. Bagaimana mengetahui kesehatan mental seseorang? Dan sebenarnya, perlu kah kita menjaga kesehatan mental kita? Mari simak artikel ini sampai habis.\n\nApa itu Kesehatan Mental? Menurt World Health Organization (WHO), kesehatan mental adalah kondisi sejahtera seseorang. Dimana, individu mampu nyadari kemampuan yang ia miliki. Mengatasi tekanan dan stres dalam kehidupan sehari-hari, bekerja produktif, dan mampu berkontribusi aktif di lingkungan atau komunitasnya. Ada beberapa hal yang mencakup kesehatan mental seperti, kenyamanan emosional, psikologi dan hubungan sosial. Dan itu semua dapat mempengaruhi cara berfikir seseorang, Dan juga mempengaruhi cara mengatasi stress, menjalani hubungan dengan orang lain dan membuat keputusan. Kesehatan mental merupakan hal yang penting mulai dari anak-anak, remaja hingga dewasa.",
            style:
                secondaryColorText.copyWith(color: Colors.black, fontSize: 12),
          ),
        );
      }

      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          margin: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultRadius),
                  topRight: Radius.circular(defaultRadius))),
          child: Column(
            children: [
              headerArticle(),
              const SizedBox(
                height: 12,
              ),
              articleImage(),
              articleText()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: content(),
    );
  }
}
