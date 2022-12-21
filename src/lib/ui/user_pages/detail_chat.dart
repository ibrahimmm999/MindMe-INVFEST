import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/chat_bubbles.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        toolbarHeight: 70,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.chevron_left),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/example/profile_pict_example.png',
              width: 50,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mr. Budi, S.Psi.',
                  style: whiteText.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Online',
                  style: greyText.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'What do you mind?.',
                          hintStyle: greyText,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/send_button.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Haloo dok, bagaimana ya?',
          ),
          ChatBubble(
            text: 'Kamu tetap semangat, jangan lupa bahagia :)',
          ),
          ChatBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: white2,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
