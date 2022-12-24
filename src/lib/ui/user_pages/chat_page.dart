import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/models/chat_model.dart';
import 'package:src/models/user_model.dart';
import 'package:src/services/auth_service.dart';
import 'package:src/services/chat_service.dart';
import 'package:src/services/user_service.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/consult_room_page.dart';
import 'package:src/ui/widgets/chat_tile.dart';
import 'package:src/ui/widgets/custom_button.dart';

import '../../cubit/consultant_cubit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: whiteText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: white2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/headset.png',
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Opss no message yet?',
                style: secondaryColorText.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'You have never done a cosultation',
                style: greyText,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                radiusButton: 12,
                buttonColor: secondaryColor,
                buttonText: 'Consult Room',
                widthButton: 162,
                heightButton: 44,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConsultRoomPage()));
                },
              )
            ],
          ),
        ),
      );
    }

    Widget content(List<UserModel> constultant) {
      return StreamBuilder(
          stream: ChatService().chatStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Expanded(
                  child: Center(child: CircularProgressIndicator()));
            }
            if (!snapshot.hasData) {
              return emptyChat();
            } else {
              List<ChatModel> chats = ChatService().getChatList(snapshot);
              if (chats.isEmpty) {
                return emptyChat();
              }
              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: white2,
                  child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      children: chats.map((chat) {
                        UserModel consultan = constultant
                            .where((element) => element.id == chat.consultantId)
                            .toList()[0];
                        return ChatTile(
                          imageUrl: consultan.photoUrl,
                          name: consultan.name,
                          chat: chat,
                        );
                      }).toList()),
                ),
              );
            }
          });
    }

    return BlocBuilder<ConsultanCubit, ConsultantState>(
      builder: (context, state) {
        if (state is ConsultantSuccess) {
          return Column(
            children: [
              header(),
              content(state.consultants),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: secondaryColor,
            ),
          );
        }
      },
    );
  }
}
