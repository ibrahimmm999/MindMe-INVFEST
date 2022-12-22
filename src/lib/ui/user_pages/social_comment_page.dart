import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/comment_bubbles.dart';

class SocialCommentPage extends StatelessWidget {
  const SocialCommentPage({super.key});

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
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'user123 - 1 menit',
              style: greyText.copyWith(
                fontWeight: regular,
                fontSize: 12,
              ),
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

    Widget comment() {
      return Column(
        children: [
          CommentBubble(
            isSender: true,
            text: 'Wahh sangat menginspirasi',
          ),
          CommentBubble(
            text: 'Kamu tetap semangat, jangan lupa bahagia :)',
          ),
          CommentBubble(
            text: 'Terima kasih, dok. Saya jadi',
          ),
          CommentBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          CommentBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          CommentBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          CommentBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          CommentBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
        ],
      );
    }

    Widget chatInput() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: white,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Whar do you mind?',
                      hintStyle: greyText,
                      focusColor: primaryColor,
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultRadius)),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  'assets/send_button.png',
                  width: 45,
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        children: [
          postCard(),
          Container(
            margin: const EdgeInsets.all(16),
            child: comment(),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      body: Column(
        children: [
          Expanded(
            child: content(),
          ),
          chatInput(),
        ],
      ),
    );
  }
}
