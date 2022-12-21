import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, this.isSender = false, this.text = ''})
      : super(key: key);

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? primaryColor : tosca,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    text,
                    style: whiteText,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
