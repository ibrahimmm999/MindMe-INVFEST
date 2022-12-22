import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/detail_article_page.dart';

class ArticleTileCard extends StatelessWidget {
  const ArticleTileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailArticlePage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 315,
        height: 110,
        margin: const EdgeInsets.only(bottom: 24),
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
                      image: AssetImage("assets/example/article1_example.png"),
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
                      "Kesehatan Mental : Gejala, Faktor dan Penanganan",
                      style: primaryColorText.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "19 september 2022",
                      style: secondaryColorText.copyWith(fontSize: 8),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Yuni Rahmawati",
                      style: greyText.copyWith(fontSize: 8),
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
}
