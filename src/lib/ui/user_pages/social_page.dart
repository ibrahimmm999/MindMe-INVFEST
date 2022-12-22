import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/custom_button.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: white,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              color: primaryColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Social',
              style: secondaryColorText.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget postCard() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'user1347',
                  style: secondaryColorText.copyWith(
                    fontWeight: medium,
                    fontSize: 12,
                  ),
                ),
                Text(
                  ' - 1 menit',
                  style: greyText.copyWith(
                    fontWeight: regular,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'kalo cape fisik, istirahat itu udah menjadi obat. tapi kalo yg cape pikiran, istirahat aja rasanya masih cape. kesehatan mental itu penting dan mahal harganya, please sayangi dirimu, jangan terus-menerus nyalahin diri sendiri atas apa yg udah terjadi dan yg ga sesuai ekspektasi',
              style: secondaryColorText.copyWith(
                fontWeight: light,
                fontSize: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadius),
                child: Image.asset(
                  'assets/example/article1_example.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/comment_icon.png',
                  width: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '10',
                  style: greyText.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget postCardSend() {
      return GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirm', style: redText),
                content: Text(
                  'Are you sure to delete this post?',
                  style: secondaryColorText,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NO',
                      style: secondaryColorText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'YES',
                      style: secondaryColorText,
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(bottom: 24),
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'You',
                    style: secondaryColorText.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    ' - 1 Jam',
                    style: greyText.copyWith(
                      fontWeight: regular,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'kalo cape fisik, istirahat itu udah menjadi obat. tapi kalo yg cape pikiran, istirahat aja rasanya masih cape. kesehatan mental itu penting dan mahal harganya, please sayangi dirimu, jangan terus-menerus nyalahin diri sendiri atas apa yg udah terjadi dan yg ga sesuai ekspektasi',
                style: secondaryColorText.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset(
                    'assets/example/article1_example.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/comment_icon.png',
                    width: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '10',
                    style: greyText.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            postCard(),
            postCardSend(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: ListView(children: [content()]),
    );
  }
}
