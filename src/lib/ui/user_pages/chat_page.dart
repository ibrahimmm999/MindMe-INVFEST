import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/chat_tile.dart';
import 'package:src/ui/widgets/custom_button.dart';

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
                'assets/image_no_message.png',
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
                onPressed: () {},
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: white2,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
