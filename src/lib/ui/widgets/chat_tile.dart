import 'package:flutter/material.dart';
import 'package:src/models/chat_model.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/detail_chat.dart';

class ChatTile extends StatelessWidget {
  const ChatTile(
      {required this.name,
      required this.imageUrl,
      required this.chat,
      Key? key})
      : super(key: key);

  final ChatModel chat;
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChat(
              consultantId: chat.consultanId,
              userId: chat.userId,
              chatId: chat.chatId,
              imageUrl: imageUrl,
              name: name,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          children: [
            Row(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: secondaryColorText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        chat.lastMessage,
                        style: greyText.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: disableColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
