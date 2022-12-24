import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/get_chatId_cubit.dart';
import 'package:src/models/chat_model.dart';
import 'package:src/models/message_model.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/chat_bubbles.dart';

import '../../services/chat_service.dart';

class DetailChat extends StatelessWidget {
  DetailChat(
      {required this.name,
      required this.imageUrl,
      required this.consultantId,
      required this.chatId,
      required this.userId,
      Key? key})
      : super(key: key);

  final String consultantId;
  final String userId;
  final String imageUrl;
  final String name;
  String chatId = '';

  TextEditingController chatController = TextEditingController(text: '');

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
                    controller: chatController,
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
                BlocConsumer<GetChatIdCubit, GetChatIdState>(
                  listener: (context, state) {
                    if (state is GetChatIdSuccess) {
                      chatId = state.chatId;
                      ChatService().addMessage(
                        userId,
                        consultantId,
                        chatController.text,
                        Timestamp.now(),
                        state.chatId,
                      );
                      ChatService()
                          .updateLastMessage(chatController.text, chatId);
                      chatController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      child: Image.asset(
                        'assets/send_button.png',
                        width: 45,
                      ),
                      onTap: () {
                        if (chatId.isEmpty) {
                          ChatService().addChat(
                            consultantId,
                            userId,
                            chatController.text,
                          );
                        }
                        context
                            .read<GetChatIdCubit>()
                            .getChatId(userId, consultantId);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget chat() {
      return StreamBuilder(
          stream: ChatService().messageStream(chatId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox();
            }

            List<MessageModel> messages = [];
            messages = ChatService().getMessageList(snapshot);
            messages.sort((a, b) => a.date.compareTo(b.date));

            return Column(
              children: messages
                  .map((message) => ChatBubble(
                        text: message.text,
                        isSender: message.senderId == userId,
                      ))
                  .toList(),
            );
          });
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        children: [
          Container(
            child: chatId.isEmpty ? SizedBox() : chat(),
          )
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


//  stream: ChatService().chatStream(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Expanded(
//                 child: Center(child: CircularProgressIndicator()));
//             return Text('data');
//           }
//           if (!snapshot.hasData) {
//             chatId = '';
//           } else {
//             List<ChatModel> chats = ChatService().getChatList(snapshot);
//             var chatIdfind = chats
//                 .where((element) =>
//                     element.consultanId == consultantId &&
//                     element.userId == userId)
//                 .toList();
//             if (chatIdfind.isNotEmpty) {
//               chatId = chatIdfind.first.chatId;
//             } else {
//               chatId = '';
//             }
//           }