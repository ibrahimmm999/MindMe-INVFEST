import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/models/user_model.dart';
import 'package:src/services/chat_service.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/detail_chat.dart';

import '../../models/chat_model.dart';
import '../widgets/custom_button.dart';

class PsikologDetailPage extends StatelessWidget {
  const PsikologDetailPage({required this.consultant, super.key});

  final UserModel consultant;

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 405,
        decoration: BoxDecoration(
          image: consultant.photoUrl.isEmpty
              ? const DecorationImage(
                  image: AssetImage("assets/profile_image_default_kotak.png"),
                  fit: BoxFit.cover)
              : DecorationImage(
                  image: NetworkImage(consultant.photoUrl), fit: BoxFit.cover),
        ),
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

    Widget button() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return StreamBuilder<Object>(
                stream: ChatService().chatStream(),
                builder: (context, snapshot) {
                  final String chatId;
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  }
                  if (!snapshot.hasData) {
                    chatId = '';
                  } else {
                    List<ChatModel> chats = ChatService().getChatList(snapshot);
                    var chatIdfind = chats
                        .where((element) =>
                            element.consultanId == consultant.id &&
                            element.userId == state.user.id)
                        .toList();
                    if (chatIdfind.isNotEmpty) {
                      chatId = chatIdfind.first.chatId;
                    } else {
                      chatId = '';
                    }
                  }
                  return CustomButton(
                      radiusButton: 12,
                      buttonColor: secondaryColor,
                      buttonText: 'Consult Now',
                      widthButton: double.infinity,
                      onPressed: () {
                        if (state.user.isPremium) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailChat(
                                name: consultant.name,
                                imageUrl: consultant.photoUrl,
                                consultantId: consultant.id,
                                chatId: chatId,
                                userId: state.user.id,
                              ),
                            ),
                          );
                        } else {
                          return showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                width: double.infinity,
                                color: white,
                                padding: EdgeInsets.all(defaultMargin),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/lock-closed.png',
                                      width: 110,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Opss so sorry this features locked',
                                      style: secondaryColorText.copyWith(
                                        fontWeight: medium,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                        'Please join premium to get this benefits',
                                        style: greyText),
                                    const SizedBox(height: 20),
                                    CustomButton(
                                      radiusButton: 12,
                                      buttonColor: primaryColor,
                                      buttonText: 'Get Premium',
                                      widthButton: 154,
                                      heightButton: 44,
                                      onPressed: () {
                                        context.read<AuthCubit>().updateUser(
                                              UserModel(
                                                id: state.user.id,
                                                email: state.user.email,
                                                name: state.user.name,
                                                username: state.user.username,
                                                bookmark_article:
                                                    state.user.bookmark_article,
                                                bookmark_video:
                                                    state.user.bookmark_video,
                                                alamat: state.user.alamat,
                                                openTime: state.user.openTime,
                                                photoUrl: state.user.photoUrl,
                                                resume: state.user.resume,
                                                role: state.user.role,
                                                isPremium: true,
                                              ),
                                            );
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      heightButton: 54);
                });
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
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              consultant.name,
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
                  consultant.alamat,
                  style: secondaryColorText.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              consultant.openTime,
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
              consultant.resume,
              style:
                  greyText.copyWith(fontWeight: FontWeight.w300, fontSize: 12),
            ),
            Spacer(),
            button(),
            SizedBox(height: 30),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Stack(
          children: [backgroundImage(), buttonBack(), content()],
        ),
      ),
    );
  }
}
