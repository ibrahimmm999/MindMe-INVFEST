import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:src/models/chat_model.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/chat_bubbles.dart';

class DetailChat extends StatelessWidget {
  const DetailChat(
      {required this.name,
      required this.imageUrl,
      required this.consultantId,
      this.chatId = '',
      required this.userId,
      Key? key})
      : super(key: key);

  final String consultantId;
  final String chatId;
  final String userId;
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    print(chatId);
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
            ClipOval(
              child: imageUrl.isEmpty
                  ? Image.asset(
                      'assets/profile_image_default.png',
                      width: 54,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imageUrl,
                      width: 54,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              name,
              style: whiteText.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            )
          ],
        ),
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
                      contentPadding: EdgeInsets.all(8),
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
          left: 16,
          right: 16,
          bottom: 16,
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
          ),
          ChatBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          ChatBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          ChatBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          ChatBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
          ),
          ChatBubble(
            text: 'Terima kasih, dok. Saya jadi termotivasi',
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
